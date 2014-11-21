//
//  FileHttpConnection.h
//  AAClient
//
//  Created by iMac on 13-6-19.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "ReachabilityUtility.h"

@class AIIFileHttpConnection;
@protocol FileHttpConnectionDelegate <NSObject>

- (void)fileRequestFinished:(AIIFileHttpConnection *)connection;

@end


@interface AIIFileHttpConnection : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

- (id<FileHttpConnectionDelegate>)delegate;
- (NSData *)data;
- (id)context;

+ (NSData *)sendSynchronousRequest:(NSString *)path;
+ (void)sendAsynchronousRequest:(NSString *)path delegate:(id<FileHttpConnectionDelegate>)delegate context:(id)context;

@end



