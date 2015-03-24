//
//  AIICheckVersion.m
//  AAClient
//
//  Created by iMac on 13-6-19.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIICheckVersion.h"

@interface AIICheckVersion ()
{
    NSMutableData *_receiveData;
}

+ (void)checkVersion:(id<AIICheckVersionDelegate>)delegate path:(NSString *)path;
- (void)connectionDidFinish;

@end


@implementation AIICheckVersion

static BOOL _checkItunes; //!< 是否检测itunes app版本
static NSMutableArray *_objectArray;


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
    
//    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
//    if ([response respondsToSelector:@selector(allHeaderFields)]) {
//        NSDictionary *dictionary = [httpResponse allHeaderFields];
//        NSLog(@"allHeaderFields: %@",dictionary);
//    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receiveData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self connectionDidFinish];
}

#pragma mark - Public

+ (NSString *)currentVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

+ (void)checkVersion:(id<AIICheckVersionDelegate>)delegate
{
    _checkItunes = NO;
    [AIICheckVersion checkVersion:delegate path:SERVER_CHECKVERSION_PATH];
}

+ (void)checkItunesVersion:(id<AIICheckVersionDelegate>)delegate
{
    _checkItunes = YES;
    [AIICheckVersion checkVersion:delegate path:ITUNES_CHECKVERSION_PATH];
}

#pragma mark - Private

+ (void)checkVersion:(id<AIICheckVersionDelegate>)delegate path:(NSString *)path
{
    AIICheckVersion *checkVersion = [[AIICheckVersion alloc] init];
    checkVersion.delegate = delegate;
    if (!_objectArray) {
        _objectArray = [[NSMutableArray alloc] init];
    }
    [_objectArray addObject:checkVersion];

    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
//    request.HTTPBody = [param dataUsingEncoding:NSUTF8StringEncoding];
    
    if (![ReachabilityUtility defaultManager].isReachable) {
        NSLog(NotReachableAlertMessage);
        
        double delayInSeconds = 0.1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [checkVersion connectionDidFinish];
        });
        
        return;
    }

    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:checkVersion];
    if (!connection) {
        NSLog(@"checkVersion:%@", @"NSURLConnection 创建失败！");
    }
}

- (void)connectionDidFinish
{
    NSData *data = _receiveData;
    NSError *error;

#ifdef DEBUG
    NSLog(@"AIICheckVersion(responseString) = %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
#endif
    
    // 网络等未知问题导致data=nil时触发
    if (!data) {
        [self.delegate checkVersionFinished:self];
        [_objectArray removeObject:self];
        return;
    }

    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    CFShow(CFBridgingRetain(infoDictionary));
    NSString *bundleDisplayName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    NSString *bundleShortVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//    NSString *bundleVersion = [infoDictionary objectForKey:@"CFBundleVersion"];// build
    NSLog(@"app: %@, %@, %@", bundleDisplayName, bundleShortVersion, [infoDictionary objectForKey:@"CFBundleVersion"]);
    
    _newVersion = NO;
    _forcedUpdate = NO;

    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSArray *infoArray = [dic objectForKey:@"results"];
    NSDictionary *releaseInfo;
    
    if (_checkItunes && infoArray.count) {
        releaseInfo = [infoArray objectAtIndex:0];
        _version = [releaseInfo objectForKey:@"version"];
        _link = [releaseInfo objectForKey:@"trackViewUrl"];
        _message = [releaseInfo objectForKey:@"description"];
    }
    else if (infoArray.count) {
        releaseInfo = [infoArray objectAtIndex:0];
        _version = [releaseInfo objectForKey:@"version"];
        _link = [releaseInfo objectForKey:@"trackViewUrl"];
        _message = [releaseInfo objectForKey:@"description"];
        _forcedUpdate = [[releaseInfo objectForKey:@"forcedUpdate"] boolValue];
    }
    
    NSArray *bundleShortVersionArray = [bundleShortVersion componentsSeparatedByString:@"."];
    NSArray *versionArray = [_version componentsSeparatedByString:@"."];
    NSUInteger bundleShortVersionCount = bundleShortVersionArray.count;
    NSUInteger versionCount = versionArray.count;
    
    if (!versionCount) {
        _newVersion = NO;
    }
    else if (bundleShortVersionCount >= versionCount) {
        for (NSUInteger i = 0; i < versionCount; ++i) {
            if ([bundleShortVersionArray[i] integerValue] <  [versionArray[i] integerValue]) {
                _newVersion = YES;
                break;
            }
        }
    }
    else {
        for (NSUInteger i = 0; i < bundleShortVersionCount; ++i) {
            // 本地:1.1 vs 服务器:1.0.1
            if ([bundleShortVersionArray[i] integerValue] >  [versionArray[i] integerValue]) {
                break;
            }
            else if ([bundleShortVersionArray[i] integerValue] <  [versionArray[i] integerValue]) {// 本地:1.0 vs 服务器:1.1
                _newVersion = YES;
                break;
            }
            
            // 本地:1.0 vs 服务器:1.0.1
            if (i == bundleShortVersionCount - 1) {
                _newVersion = YES;
            }
        }
    }
    
    if (!_newVersion) {
        _title = [NSString stringWithFormat:@"温馨提示"];
        _message = [NSString stringWithFormat:@"当前为最新版"];
    }
    else {
        _title = [NSString stringWithFormat:@"有新版本:v%@", _version];
    }
    
    [self.delegate checkVersionFinished:self];
    [_objectArray removeObject:self];
}

@end
