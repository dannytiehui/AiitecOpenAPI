//
//  AIIJSONValueConvert.h
//  AAClient
//
//  Created by iMac on 13-5-13.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 组包(VTD).
 *
 *  Object组包成JSONString.
 */
@protocol ValueToDictionary <NSObject>

/// 组包 -- 从JSONModel、IqPacket对象中,读取元素值到JSON格式的字符串中,并返回.
- (NSString *)jsonStringWithObject;

@end


/** 解包(VFD).
 *
 *  Dictionary赋值给Object.
 */
@protocol ValueFromDictionary <NSObject>

/// 被 - (void)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues; 所取代.
/// 解包 -- 从JSON格式的字符串中,提取出对象元素值,并赋到JSONModel、IqPacket对象中.
//- (void)setObjectWithJSONString:(NSString *)jsonString;

@end


/** 组包(VTA).
 *
 *  Object组包成JSONArray.
 */
@protocol ValueToArray <NSObject>

/// 组包 -- 从ModelCollection对象中,读取元素值到JSON格式的数组中,并返回.
//- (NSString *)jsonArrayWithObject;
- (NSArray *)arrayWithObject;

@end


/** 解包(OFA).
 *
 *  Array解包后赋值给Object.
 */
@protocol ValueFromArray <NSObject>

/// 解包 -- 从NSDictionary格式的数组中,提取出对象元素值,并赋到ModelCollection对象中.
- (void)setObjectWithArray:(NSArray *)array;

@end
