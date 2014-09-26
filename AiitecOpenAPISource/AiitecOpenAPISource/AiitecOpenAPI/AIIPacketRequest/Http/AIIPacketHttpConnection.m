//
//  AIIPacketHttpConnection.m
//  AAClient
//
//  Created by iMac on 13-6-27.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIPacketHttpConnection.h"
#import "AIIPacketManager.h"

#import "AIISessionPacket.h"
#import "AIIListPacket.h"
#import "AIIDetailsPacket.h"
#import "Table.h"

typedef NS_ENUM(NSUInteger, HttpMethod){
    HttpMethodPost,
    HttpMethodGet
};

@interface AIIPacketHttpConnection ()

@property (nonatomic, weak) id target;
@property (nonatomic) SEL action;
@property (nonatomic, weak) id<PacketHttpConnectionDelegate> delegate;
@property (nonatomic, strong) AIIRequest *request;
@property (nonatomic, strong) AIIResponse *response;
@property (nonatomic, weak) id context;
@property (nonatomic, weak) NSString *responseString;

- (NSString *)apiPath;
- (NSString *)responseClassName;
+ (AIIResponse *)sendSynchronous:(AIIRequest *)request method:(HttpMethod)method;
+ (void)sendAsynchronous:(AIIPacketHttpConnection *)connection request:(AIIRequest *)request;
+ (ASIFormDataRequest *)formDataRequest:(AIIRequest *)request URLString:(NSString *)URLString;

+ (void)sessionIdRequest:(AIIPacketHttpConnection *)connection;

@end



@implementation AIIPacketHttpConnection

static NSMutableArray *_packetHttpConnectionArray;
static NSMutableArray *_packetHttpConnectionQueue;

- (NSString *)apiPath
{
#ifdef DEBUG
    NSLog(@"apiPath:%@", [NSString stringWithFormat:@"%@%@?", DOMAIN_PATH, API_PATH]);
#endif
    return [NSString stringWithFormat:@"%@%@?", DOMAIN_PATH, API_PATH];
}

- (NSString *)responseClassName
{
    NSString *className = NSStringFromClass(self.request.class);
    return [className stringByReplacingOccurrencesOfString:@"Request" withString:@"Response"];
}

+ (AIIResponse *)sendSynchronous:(AIIRequest *)request method:(HttpMethod)method
{
    AIIPacketHttpConnection *packetHttpConnection = [[AIIPacketHttpConnection alloc] init];
    packetHttpConnection.request = request;
    NSString *className = [packetHttpConnection responseClassName];
    NSString *path = packetHttpConnection.apiPath;
    ASIHTTPRequest *req;
    
    switch (method) {
        case HttpMethodGet:
        {
            NSString *urlStr = [path stringByAppendingFormat:@"json=%@", [request jsonStringWithObject]];
            urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; // 编码
            NSURL *url = [NSURL URLWithString:urlStr];
            req = [ASIHTTPRequest requestWithURL:url];
        }
            break;
            
        case HttpMethodPost:
        {
            req = [AIIPacketHttpConnection formDataRequest:request URLString:path];           
        }
            break;
            
        default:
            NSAssert(NO, @"NS_ENUM HttpMethod error!");
            break;
    }
    
    if (![ReachabilityUtility defaultManager].isReachable) {
        NSLog(NotReachableAlertMessage);
        return [[NSClassFromString(className) alloc] initWithJSONString:nil];
    }
    
    [req startSynchronous];
    NSError *error = [req error];
    if (!error) {
        NSLog(@"%@", [req responseString]);
        packetHttpConnection.response = [[NSClassFromString(className) alloc] initWithJSONString:[req responseString]];
    }
    return packetHttpConnection.response;
}

+ (void)sendAsynchronous:(AIIPacketHttpConnection *)connection request:(AIIRequest *)request
{
    if (!_packetHttpConnectionArray) {
        _packetHttpConnectionArray = [[NSMutableArray alloc] init];
    }
  
//    NSLog(@"--%@, %d", request.nameSpace, [_packetHttpConnectionArray containsObject:connection]);
    if (![_packetHttpConnectionArray containsObject:connection]) {
        [_packetHttpConnectionArray addObject:connection];
    }
    
    NSString *path = connection.apiPath;
    ASIFormDataRequest *req = [AIIPacketHttpConnection formDataRequest:request URLString:path];

    if (![ReachabilityUtility defaultManager].isReachable) {
        NSLog(NotReachableAlertMessage);
        
        double delayInSeconds = 0.1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [connection requestOver:req];
        });
        return;
    }
    
    // 检测 Session 是否过期. bExpire=YES表示过期
//    BOOL bExpire = (NSOrderedAscending == [[AIIPacketManager defaultManager].expire compare:[NSDate date]]);
    BOOL bSessionRequest = [request.nameSpace isEqualToString:@"Session"];
    
    // 发起Session请求后,sessionId仍然返回空。
//    if (![AIIPacketManager defaultManager].sessionResponseNotNil || (!bExpire && bSessionRequest)) {
    if (![AIIPacketManager defaultManager].sessionResponseNotNil) {
        double delayInSeconds = 0.1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [connection requestOver:req];
        });
        return;
    }
    
    NSString *sessionId = [[NSUserDefaults standardUserDefaults] objectForKey:@"sessionId"];
//    if (OPEN_SESSION_VALIDATE && !bSessionRequest && ![AIIPacketManager defaultManager].sessionId.length) {
    /// 情况一: sessionId为空或不存在时.
    if (OPEN_SESSION_VALIDATE && !bSessionRequest && !sessionId.length) {
        NSLog(SESSION_Nil_DESC);
        
        if (!_packetHttpConnectionQueue) {
            _packetHttpConnectionQueue = [[NSMutableArray alloc] init];
        }
        [_packetHttpConnectionQueue addObject:connection];
        
        if (![AIIPacketManager defaultManager].sessionRequesting)  {
//            [AIIPacketManager defaultManager].sessionRequesting = YES;
//            AIIRequest *request = [[AIISessionRequest alloc] init];
////            NSLog(@"主线:%@", [request jsonStringWithObject]);
//            [AIIPacketHttpConnection sendAsynchronous:request delegate:connection.delegate context:connection.context];
            [AIIPacketHttpConnection sessionIdRequest:connection];
        }
        return;
    }

    NSLog(@"主线:%@", [request jsonStringWithObject]);
    [req setDelegate:connection];
    [req startAsynchronous];
}

+ (ASIFormDataRequest *)formDataRequest:(AIIRequest *)request URLString:(NSString *)URLString
{
    NSURL *url = [NSURL URLWithString:URLString];
    ASIFormDataRequest *req = [ASIFormDataRequest requestWithURL:url];
    [req setPostValue:[request jsonStringWithObject] forKey:@"json"];
    
    // Upload Image(or File)
    if ([request.query respondsToSelector:@selector(fileCollection)]) {
        AIIUploadFileRequest *uploadFileRequest = (AIIUploadFileRequest *)request;
        AIIFile *file;
        NSUInteger count = uploadFileRequest.query.fileCollection.count;
        for (NSUInteger i = 0; i < count; i++) {
            file = [uploadFileRequest.query.fileCollection objectAtIndex:i];
            [req addData:file.data withFileName:file.filename andContentType:file.contentType forKey:@"file[]"];
        }
    }
    return req;
}

+ (void)sessionIdRequest:(AIIPacketHttpConnection *)connection
{
    [AIIPacketManager defaultManager].sessionRequesting = YES;
    AIIRequest *request = [[AIISessionRequest alloc] init];
    [AIIPacketHttpConnection sendAsynchronous:request delegate:connection.delegate context:connection.context];
}

#pragma mark - Public Method

+ (AIIResponse *)sendSynchronous:(AIIRequest *)request
{
    return [AIIPacketHttpConnection sendSynchronous:request method:HttpMethodPost];
}

+ (void)sendAsynchronous:(AIIRequest *)request delegate:(id<PacketHttpConnectionDelegate>)delegate context:(id)context;
{
    AIIPacketHttpConnection *connection = [[AIIPacketHttpConnection alloc] init];
    connection.request = request;
    connection.context = context;
    connection.delegate = delegate;
    
    [AIIPacketHttpConnection sendAsynchronous:connection request:request];
}

+ (void)sendAsynchronous:(AIIRequest *)request target:(id)target action:(SEL)action context:(id)context
{
    AIIPacketHttpConnection *connection = [[AIIPacketHttpConnection alloc] init];
    connection.request = request;
    connection.context = context;
    connection.target = target;
    connection.action = action;
    
    [AIIPacketHttpConnection sendAsynchronous:connection request:request];    
}

#pragma mark - ASIHTTPRequestDelegate

- (void)requestFinished:(ASIHTTPRequest *)request
{
    [self requestOver:request];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    [self requestOver:request];
}

- (void)requestOver:(ASIHTTPRequest *)request
{
//#ifdef DEBUG
    NSLog(@"%@(responseString) = %@", self.request.nameSpace, request.responseString);
//#endif
    NSString *className = [self responseClassName];
    self.response = [[NSClassFromString(className) alloc] initWithJSONString:request.responseString];
    
    BOOL bSessionResponse = [self.request.nameSpace isEqualToString:@"Session"];
    if (bSessionResponse) {
        NSString *sessionId = ((AIISessionResponse *)self.response).sessionId;
        [AIIPacketManager defaultManager].sessionRequesting = NO;
//        [AIIPacketManager defaultManager].sessionId = ((AIISessionResponse *)self.response).sessionId;
        [[NSUserDefaults standardUserDefaults] setObject:sessionId forKey:@"sessionId"];
        [AIIPacketManager defaultManager].expire = ((AIISessionResponse *)self.response).query.expire;
//        [AIIPacketManager defaultManager].sessionResponseNotNil = [AIIPacketManager defaultManager].sessionId.length ? YES : NO;
        [AIIPacketManager defaultManager].sessionResponseNotNil = sessionId.length ? YES : NO;
    }
    /// 情况二: sessionId失效（或服务器删除了session表里面对应的数据）,需要重新获取.
    else if ([self.response.query.status isEqualToString:@"1002"]) {  //!<
       
        if (!_packetHttpConnectionQueue) {
            _packetHttpConnectionQueue = [[NSMutableArray alloc] init];
        }
        [_packetHttpConnectionQueue addObject:self];
        
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"sessionId"];
        [AIIPacketHttpConnection sessionIdRequest:self];
        return;
    }
    
    if (_packetHttpConnectionQueue.count) {
        AIIPacketHttpConnection *connection = [_packetHttpConnectionQueue firstObject];
        [AIIPacketHttpConnection sendAsynchronous:connection request:connection.request];
        [_packetHttpConnectionQueue removeObject:connection];
    }
    else {
        /// 恢复初始设置
        [AIIPacketManager defaultManager].sessionResponseNotNil = YES;
    }
    
    if (bSessionResponse) {
        [_packetHttpConnectionArray removeObject:self];
        return;
    }
    
    if (self.delegate) {
        [self.delegate packetRequestFinished:self];
    }
    else if ([self.target respondsToSelector:self.action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.action withObject:self];
#pragma clang diagnostic pop
    }
    
    [_packetHttpConnectionArray removeObject:self];
}

@end
