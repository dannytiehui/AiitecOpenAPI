//
//  AIIPacketConfig.h
//  AII
//
//  Created by iMac on 13-11-19.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

#define OPEN_SESSION_VALIDATE YES   //!< 开启/关闭会话验证

#define SESSION_Nil_STATUS         1000
#define SESSION_Nil_DESC           @"sessionId为空"

#define NotReachable_STATUS         100
#define NotReachable_DESC           @"哎呀！网络数据不对啦。"

//#warning 设置开关，允许底层架构启用/禁用sessionId方案.
/// 开关.允许底层架构启用/禁用sessionId方案.
#define AiitecOpenAPISetting_SessionId YES

@interface AIIPacketConfig : NSObject

@end
