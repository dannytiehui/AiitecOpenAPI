//
//  AIIFileConnection.h
//  AAClient
//
//  Created by iMac on 13-7-11.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIFileHttpConnection.h"

@class AIIFileConnection;
/// AIIFileConnectionDelegate
@protocol AIIFileConnectionDelegate <NSObject>

- (void)fileConnectionFinished:(AIIFileConnection *)connection;

@end


/// AIIFileConnection
@interface AIIFileConnection : NSObject <FileHttpConnectionDelegate>

- (id<AIIFileConnectionDelegate>)delegate;
- (NSData *)data;
- (id)context;
- (NSString *)path;

+ (BOOL)fileExistsAtPath:(NSString *)path;

+ (NSData *)sendSynchronousRequest:(NSString *)path;
+ (void)sendAsynchronousRequest:(NSString *)path delegate:(id<AIIFileConnectionDelegate>)delegate context:(id)context;
+ (BOOL)removeCache;
+ (unsigned long long)folderSize;

@end
