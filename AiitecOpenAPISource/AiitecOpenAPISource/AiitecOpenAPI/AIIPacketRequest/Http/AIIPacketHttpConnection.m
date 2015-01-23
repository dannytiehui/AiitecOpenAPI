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
{
    NSMutableData *_receiveData;
}

@property (nonatomic, weak) id target;
@property (nonatomic) SEL action;
@property (nonatomic, weak) id<PacketHttpConnectionDelegate> delegate;
@property (nonatomic, strong) AIIRequest *request;
@property (nonatomic, strong) AIIResponse *response;
@property (nonatomic, weak) id context;
@property (nonatomic, copy) NSString *responseString;

- (NSString *)apiPath;
- (NSString *)responseClassName;
+ (AIIResponse *)sendSynchronous:(AIIRequest *)request method:(HttpMethod)method;
+ (void)sendAsynchronous:(AIIPacketHttpConnection *)connection request:(AIIRequest *)request;
+ (NSMutableURLRequest *)formDataRequest:(AIIRequest *)request URLString:(NSString *)URLString;

+ (void)sessionIdRequest:(AIIPacketHttpConnection *)connection;

- (void)connectionDidFinish;

@end



@implementation AIIPacketHttpConnection

static NSMutableArray *_packetHttpConnectionArray;
static NSMutableArray *_packetHttpConnectionQueue;


#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"ERROR.connection:didFailWithError %@", error);
    [self connectionDidFinish];
}

#pragma mark - NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _receiveData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receiveData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self connectionDidFinish];
}

#pragma mark - Private

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
    NSMutableURLRequest *req;
    
    switch (method) {
        case HttpMethodGet:
        {
            NSString *urlStr = [path stringByAppendingFormat:@"json=%@", [request jsonStringWithObject]];
            urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; // 编码
            NSURL *url = [NSURL URLWithString:urlStr];
            req = [NSMutableURLRequest requestWithURL:url];
            req.HTTPMethod = @"GET";
        }
            break;
            
        case HttpMethodPost:
        {
            req = (NSMutableURLRequest *)[AIIPacketHttpConnection formDataRequest:request URLString:path];
            req.HTTPMethod = @"POST";
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
    
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&response error:&error];

    NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
#ifdef DEBUG
    NSLog(@"%@, %@(responseString) = %@", req.HTTPMethod, request.nameSpace, responseString);
#endif
    
    if (data || !error) {
        packetHttpConnection.response = [[NSClassFromString(className) alloc] initWithJSONString:responseString];
    }
    else {
        NSLog(@"sendSynchronousRequest.Error: %@", error);
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
//    ASIFormDataRequest *req = [AIIPacketHttpConnection formDataRequest:request URLString:path];
    NSMutableURLRequest *req = [AIIPacketHttpConnection formDataRequest:request URLString:path];
    
    if (![ReachabilityUtility defaultManager].isReachable) {
        NSLog(NotReachableAlertMessage);
        
        double delayInSeconds = 0.1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [connection connectionDidFinish];
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
            [connection connectionDidFinish];
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
    NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:req delegate:connection];
    if (!urlConnection) {
        NSLog(@"NSURLConnection.%@", @"创建失败");
    }
}

#define BOUNDARY @"uploadBoundary"

+ (NSMutableURLRequest *)formDataRequest:(AIIRequest *)request URLString:(NSString *)URLString
{
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:URLString]];
    [req setHTTPMethod:@"POST"];
    
    // Upload Image(or File)
    if ([request.query respondsToSelector:@selector(fileCollection)]) {
        
        [req setValue:[@"multipart/form-data; boundary=" stringByAppendingString:BOUNDARY] forHTTPHeaderField:@"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        
        NSMutableString *param = [NSMutableString string];
        [param appendFormat:@"--%@\r\n", BOUNDARY];
        [param appendFormat:@"Content-Disposition: form-data; name=\"json\"\r\n\r\n%@\r\n", [request jsonStringWithObject]];
        
        [body appendData:[param dataUsingEncoding:NSUTF8StringEncoding]];
        
        AIIUploadFilesRequest *uploadFilesRequest = (AIIUploadFilesRequest *)request;
        AIIFile *file;
        NSUInteger count = uploadFilesRequest.query.fileCollection.count;
        for (NSUInteger i = 0; i < count; i++) {
            file = [uploadFilesRequest.query.fileCollection objectAtIndex:i];
            
            NSMutableString *temp = [NSMutableString string];
            [temp appendFormat:@"--%@\r\n", BOUNDARY];
            [temp appendFormat:@"Content-Disposition: form-data; name=\"file[]\"; filename=\"%@\"\r\n", file.filename];
            [temp appendFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
            
            [body appendData:[temp dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:file.data];
            [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        }
        
        NSString *endString = [NSString stringWithFormat:@"--%@--",BOUNDARY];
        [body appendData:[endString dataUsingEncoding:NSUTF8StringEncoding]];
        [req setHTTPBody:body];
    }
    else { /** 网络请求,通过HTTP POST发送特殊符号到服务器,如:&. */
        [req setValue:[@"multipart/form-data; boundary=" stringByAppendingString:BOUNDARY] forHTTPHeaderField:@"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        NSMutableString *param = [NSMutableString string];
        [param appendFormat:@"--%@\r\n", BOUNDARY];
        [param appendFormat:@"Content-Disposition: form-data; name=\"json\"\r\n\r\n%@\r\n", [request jsonStringWithObject]];
        
        [body appendData:[param dataUsingEncoding:NSUTF8StringEncoding]];
        req.HTTPBody = body;
    }
//    else {
//        NSString *param = [NSString stringWithFormat:@"json=%@", [request jsonStringWithObject]];
//        //        param = [param stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];//!< 转码.
//        req.HTTPBody = [param dataUsingEncoding:NSUTF8StringEncoding];
//    }

    
    return req;
}

+ (void)sessionIdRequest:(AIIPacketHttpConnection *)connection
{
    [AIIPacketManager defaultManager].sessionRequesting = YES;
    AIIRequest *request = [[AIISessionRequest alloc] init];
    [AIIPacketHttpConnection sendAsynchronous:request delegate:connection.delegate context:connection.context];
}

- (void)connectionDidFinish
{
    _responseString = [[NSString alloc] initWithData:_receiveData encoding:NSUTF8StringEncoding];
//#ifdef DEBUG
    NSLog(@"%@(responseString) = %@", self.request.nameSpace, _responseString);
//#endif
    NSString *className = [self responseClassName];
    self.response = [[NSClassFromString(className) alloc] initWithJSONString:_responseString];
    
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
    else if (self.response.query.status == 1002) {  //!<
        
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
        [connection.request jsonStringWithObjectStringSetNull];
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

@end
