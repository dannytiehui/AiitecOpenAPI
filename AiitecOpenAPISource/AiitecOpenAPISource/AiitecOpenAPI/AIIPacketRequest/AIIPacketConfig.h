//
//  AIIPacketConfig.h
//  AII
//
//  Created by iMac on 13-11-19.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

/** AppConfig.h定义配置文件，供底层使用. */
//#ifdef AiitecOpenAPI_Config

#import "AppConfig.h"

//#else

//#define DOMAIN_PATH             @"http://www.baidu.com/"
//#define API_PATH                @""
//#define REACHABILITY_HOSTNAME   @"www.baidu.com" //!< 用于 Reachability 网络检测 (或192.168.1.1)
//#define AiitecOpenAPI_DEBUG 0
//
//#endif

#ifndef AiitecOpenAPI_DEBUG
/** 是否显示调试信息。使用AiitecOpenAPI库文件,必须包含. */
#define AiitecOpenAPI_DEBUG 0 //!<
#endif

#ifndef DOMAIN_PATH
#define DOMAIN_PATH             @"http://www.baidu.com/"
#endif

#ifndef API_PATH
#define API_PATH                @""
#endif

#ifndef REACHABILITY_HOSTNAME
#define REACHABILITY_HOSTNAME   @"www.baidu.com" //!< 用于 Reachability 网络检测 (或192.168.1.1)
#endif



#define OPEN_SESSION_VALIDATE YES   //!< 开启/关闭会话验证

#define SESSION_Nil_STATUS         1000
#define SESSION_Nil_DESC           @"sessionId为空"

#define NotReachable_STATUS         100
#define NotReachable_DESC           @"哎呀！网络数据不对啦。"

#define Cache_Packet_STATUS         99
#define Cache_Packet_DESC           @"来自缓存的协议文件"

//#warning 设置开关，允许底层架构启用/禁用sessionId方案.
/// 开关.允许底层架构启用/禁用sessionId方案.
#define AiitecOpenAPISetting_SessionId YES

/** 是否启用通讯协议加密方案. */
#define IqPacket_Encryption  YES

@interface AIIPacketConfig : NSObject

@end
