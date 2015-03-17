//
//  AIIResponse.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "AIIIqPacket.h"

/** 协议响应基类.
 *
 * 全部响应协议（Response后缀）都继承此基类.
 */
@interface AIIResponse : AIIIqPacket

/**
 *  @brief  读取缓存的服务器响应数据,并转化为AIIResponse对象.
 *
 *  @return AIIResponse对象.
 */
- (id)initWithCachesPacketFile;

- (NSString *)JSONString;
- (NSString *)JSONFormatString;

/**
 *  @brief  将服务器响应的数据缓存到文件里面.
 *
 *  @return 缓存状态.
 */
- (BOOL)writeToFile;

@end
