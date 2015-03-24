//
//  AIIPacketConnection.h
//  AAClient
//
//  Created by iMac on 13-6-27.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIPacketHttpConnection.h"

@class AIIPacketConnection;
@protocol LoginDelegate;

/// AIIPacketConnectionDelegate
@protocol AIIPacketConnectionDelegate <NSObject>

- (void)packetConnectionFinished:(AIIPacketConnection *)connection;

@end



@interface AIIPacketConnection : NSObject <PacketHttpConnectionDelegate>

- (id<AIIPacketConnectionDelegate>)delegate;
- (AIIRequest *)request;
- (AIIResponse *)response;
- (id)context;

+ (AIIResponse *)sendSynchronous:(AIIRequest *)request;// Default use HttpMethodPost
+ (void)sendAsynchronous:(AIIRequest *)request delegate:(id<AIIPacketConnectionDelegate>)delegate context:(id)context;
+ (void)sendAsynchronous:(AIIRequest *)request target:(id)target action:(SEL)action context:(id)context;

/**
 * @brief 优先返回缓存数据,当网络请求完成后通过回调更新数据.
 *
 * @param request 对象.
 * @param delegate .
 * @param context .
 *
 * @return AIIResponse.
 */
+ (AIIResponse *)sendAsyn:(AIIRequest *)request delegate:(id<AIIPacketConnectionDelegate>)delegate context:(id)context;
+ (AIIResponse *)sendAsyn:(AIIRequest *)request target:(id)target action:(SEL)action context:(id)context;

+ (BOOL)removeCache;

@end