//
//  AIIFileHttpConnection.m
//  AAClient
//
//  Created by iMac on 13-6-19.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIFileHttpConnection.h"

@interface AIIFileHttpConnection ()
{
    NSMutableData *_receiveData;
}

@property (nonatomic, weak) id<FileHttpConnectionDelegate> delegate;
@property (nonatomic, weak) NSData *data;
@property (nonatomic, weak) id context;

- (void)connectionDidFinish;

@end


@implementation AIIFileHttpConnection

static NSMutableArray *_fileHttpConnectionArray;

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

+ (NSData *)sendSynchronousRequest:(NSString *)path
{
    if (![ReachabilityUtility defaultManager].isReachable) {
        NSLog(NotReachableAlertMessage);
        return nil;
    }
    
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

    if (!data) {
        NSLog(@"AIIFileHttpConnection.sendSynchronousRequest.Error:%@", error);
    }
    return data;
}

+ (void)sendAsynchronousRequest:(NSString *)path delegate:(id<FileHttpConnectionDelegate>)delegate context:(id)context
{
    AIIFileHttpConnection *fileHttpConnection = [[AIIFileHttpConnection alloc] init];
    fileHttpConnection.delegate = delegate;
    fileHttpConnection.context = context;
    if (!_fileHttpConnectionArray) {
        _fileHttpConnectionArray = [[NSMutableArray alloc] init];
    }
    [_fileHttpConnectionArray addObject:fileHttpConnection];
    
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    if (![ReachabilityUtility defaultManager].isReachable) {
        NSLog(NotReachableAlertMessage);
        
        double delayInSeconds = 0.1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [fileHttpConnection connectionDidFinish];
        });
        return;
    }
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:fileHttpConnection];
    if (!connection) {
        NSLog(@"AIIFileHttpConnection.sendAsynchronousRequest.Error:%@", @"NSURLConnection 创建失败！");
    }
}

- (void)connectionDidFinish
{
    self.data = _receiveData;
    [self.delegate fileRequestFinished:self];
    [_fileHttpConnectionArray removeObject:self];
}

@end
