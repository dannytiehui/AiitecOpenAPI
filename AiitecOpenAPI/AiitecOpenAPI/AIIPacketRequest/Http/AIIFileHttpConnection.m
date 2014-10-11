//
//  AIIFileHttpConnection.m
//  AAClient
//
//  Created by iMac on 13-6-19.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIFileHttpConnection.h"

@interface AIIFileHttpConnection ()

@property (nonatomic, weak) id<FileHttpConnectionDelegate> delegate;
@property (nonatomic, weak) NSData *data;
@property (nonatomic, weak) id context;

@end


@implementation AIIFileHttpConnection

static NSMutableArray *_fileHttpConnectionArray;

+ (NSData *)sendSynchronousRequest:(NSString *)path
{
    if (![ReachabilityUtility defaultManager].isReachable) {
        NSLog(NotReachableAlertMessage);
        return nil;
    }
    
    NSURL *url = [NSURL URLWithString:path];
    ASIHTTPRequest *req = [ASIHTTPRequest requestWithURL:url];
    [req startSynchronous];
    return [req responseData];
}

+ (void)sendAsynchronousRequest:(NSString *)path delegate:(id<FileHttpConnectionDelegate>)delegate context:(id)context
{
    AIIFileHttpConnection *connection = [[AIIFileHttpConnection alloc] init];
    connection.delegate = delegate;
    connection.context = context;
    if (!_fileHttpConnectionArray) {
        _fileHttpConnectionArray = [[NSMutableArray alloc] init];
    }
    [_fileHttpConnectionArray addObject:connection];
    
    NSURL *url = [NSURL URLWithString:path];
    ASIHTTPRequest *req = [ASIHTTPRequest requestWithURL:url];
    
    if (![ReachabilityUtility defaultManager].isReachable) {
        NSLog(NotReachableAlertMessage);
        
        double delayInSeconds = 0.1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [connection requestOver:req];
        });
        return;
    }
    
    req.delegate = connection;
    [req startAsynchronous];
}

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
    self.data = [request responseData];
    [self.delegate fileRequestFinished:self];
    [_fileHttpConnectionArray removeObject:self];
}

@end
