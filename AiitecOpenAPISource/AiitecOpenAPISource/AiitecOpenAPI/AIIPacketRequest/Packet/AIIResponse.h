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

/**
 *  @brief  将AIIIqPacket对象写入(缓存)到文件.位置:/userId/md5.json .
 *
 *  @param  userId 文件夹名(用户id).
 *  @param  md5 文件名(通讯协议请求对象Request通过md5私有加密算法加密后的32位字符串).
 *  @return 写入(缓存)状态.
 */
- (NSString *)filePathWithSubfolder:(NSString *)userId filename:(NSString *)md5;

/**
 *  @brief  将AIIJSONModel对象写入(缓存)到文件.用于根据UserId进行通讯协议缓存.
 *
 *  @param  userId 文件夹名(用户id).
 *  @param  md5 文件名(通讯协议请求对象Request通过md5私有加密算法加密后的32位字符串).
 *  @return 写入(缓存)状态.
 */
- (BOOL)writeToFileWithSubfolder:(NSString *)userId filename:(NSString *)md5;

@end
