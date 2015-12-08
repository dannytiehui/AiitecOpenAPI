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

- (NSString *)JSONString;
- (NSString *)JSONFormatString;

@end
