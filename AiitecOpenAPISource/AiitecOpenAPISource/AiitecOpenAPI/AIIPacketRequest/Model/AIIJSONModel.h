//
//  AIIJSONModel.h
//  AAClient
//
//  Created by iMac on 13-5-13.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIJSONValueConvert.h"
#import "AIIUtility.h"

/** AIIJSONModel.
 *
 *  对象模型基类.
 */
@interface AIIJSONModel : NSObject <NSCopying, NSMutableCopying, NSCoding>

//@property (nonatomic, strong) NSString *sString;
//@property (nonatomic, copy)   NSString *cString;
///** 可变字符串. */
//@property (nonatomic, strong) NSMutableString *mutableString;

/**
 *  @brief  获取对象的key键值.
 *
 *  @return 对象的key键值.
 */
@property (nonatomic, copy) NSString *key;

/**
 *  @brief  组包时,设置对象的必须属性.
 *
 *  @return 组包时包含的属性.
 */
@property (nonatomic, copy) NSArray *properties;

/**
 *  @brief  组包时,获取对象的默认属性.默认不包含properties.
 *
 *  @return 组包时包含的属性.
 */
- (NSArray *)defaultProperties;

/**
 *  @brief  组包时,获取对象的key键值数组,如果用户设置了properties,则返回properties;否则返回defaultProperties.
 *
 *  @return 对象的key键值.
 */
- (NSArray *)keys;

/**
 *  @brief  反射获取类属性的类型字典.
 *
 *  @return 属性的类型字典.
 */
- (NSDictionary *)propertysAttributes;

/**
 *  @brief  JSON中键（key）对象的缩写集合.
 *
 *  @return JSON中键（key）对象的缩写集合.
 */
@property (nonatomic, readonly) NSDictionary *abbreviationKeys;

//- (void)print;

@end
