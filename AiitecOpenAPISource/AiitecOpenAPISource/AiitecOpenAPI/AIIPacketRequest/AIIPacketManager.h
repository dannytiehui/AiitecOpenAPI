//
//  AIIPacketManager.h
//  AII
//
//  Created by iMac on 13-11-18.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIICacheManager.h"

@class AIIPacketManager;
@protocol AIIPacketManagerDelegate <NSObject>

- (void)packetManagerFinished:(AIIPacketManager *)connection;

@end



@interface AIIPacketManager : NSObject <AIIPacketConnectionDelegate>

@property (nonatomic, assign) BOOL sessionRequesting;
//@property (nonatomic, copy) NSString *sessionId;

/**
 *  @brief SessionId 过期时间
 *  @note 若过期,则需重新获取sessionId
 */
//@property (nonatomic, copy) NSDate *expire;
@property (nonatomic, copy) NSString *expire;

/**
 *  @brief SessionId 过期时间
 *
 *  1.  初始化值为:YES
 *  2.  在进行Session会话请求后，如果返回SessionId为Nil，则值变为:NO
 *  3.  在PacketHttpConnection的_packetHttpConnectionQueue执行完成后，值恢复为:YES
 */
@property (nonatomic, assign) BOOL sessionResponseNotNil;

@property (nonatomic, assign) id<AIIPacketManagerDelegate> delegate;

+ (AIIPacketManager *)defaultManager;
+ (void)beginWithPacket:(PacketNameSpace)nameSpaces;


@end
