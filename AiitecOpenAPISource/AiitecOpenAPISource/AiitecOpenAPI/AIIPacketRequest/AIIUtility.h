//
//  AIIUtility.h
//  AAClient
//
//  Created by iMac on 13-5-15.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <objc/runtime.h>

typedef NS_ENUM(NSUInteger, AIISex){
    AIISexDefault,
    AIISexMale,
    AIISexFemale
};

typedef NS_ENUM(NSUInteger, AIIOrderType){
    AIIOrderTypeDESC = 1,
    AIIOrderTypeASC
};

UIKIT_EXTERN NSString *const DeviceTokenKey;

/// AIIUtility.
@interface AIIUtility : NSObject

+ (NSString *)cachesPath;
+ (NSString *)cachesPacketPath;

/// 判断添加到 NSMutableDictionary 的对象是否为nil, 为nil则忽略.

/**
 *  @brief  判断添加到 NSMutableDictionary 的对象是否为nil, 为nil则忽略.
 *
 *  @param  anObject value.
 *  @param  aKey key.
 *  @param  dict .
 */
+ (void)setObject:(id)anObject forKey:(id <NSCopying>)aKey toDictionary:(NSMutableDictionary *)dict;
+ (void)setObject:(id)anObject forKey:(id <NSCopying>)aKey toDictionary:(NSMutableDictionary *)dict allowEmptyString:(BOOL)allow;
+ (void)setInteger:(NSUInteger)integer forKey:(id <NSCopying>)aKey toDictionary:(NSMutableDictionary *)dict;
+ (void)setInteger:(NSUInteger)integer forKey:(id <NSCopying>)aKey toDictionary:(NSMutableDictionary *)dict allowZero:(BOOL)allow;

+ (NSString *)replaceUnicode:(NSString *)unicodeString;

#pragma mark - Filter empty object

/**
 *  @brief  过滤字符串、数组、字典里面的空对象(null)或者空字符串(@"").
 *
 *  @param  object 需要过滤的过滤字符串、数组、字典对象.
 *  @return id 返回过滤后的对象.
 */
+ (id)emptyObjectFilter:(id)object;
+ (void)setObject:(id)anObject forKey:(id <NSCopying>)aKey toDict:(NSMutableDictionary **)dict;
+ (void)addObject:(id)anObject toArray:(NSMutableArray **)array;

/**
 *  @brief  32位MD5加密.
 *
 *  @param str 需要md5加密的字符串.
 */
+ (NSString *)md5:(NSString *)str;

/**
 *  @brief  字符串转日期.
 *
 *  @param  dateString 日期字符串,如:@"2013-12-17 14:45:59".
 *  @return NSDate对象的实例.
 */
+ (NSDate *)dateFromString:(NSString *)dateString;

/**
 *  @brief  日期转字符串.
 *  @param  date NSDate对象的实例.
 *  @return 字符串格式的日期,如:@"2011-08-09 12:02:01 GMT+08:00".
 */
+ (NSString *)stringFromDate:(NSDate *)date;

/**
 *  @brief  JSON格式的NSString 转 NSDictionary.
 *
 *  @param  jsonString JSON格式的字符串,如:@"{\"id\":34,\"name\":\"Danny\"}".
 *  @return NSDictionary对象的实例.
 */
+ (NSDictionary *)dictionaryWithJSONString:(NSString *)jsonString;
+ (NSDictionary *)dictionaryWithJSONString:(NSString *)jsonString error:(NSError **)error;

/**
 *  @brief  NSDictionary 转 JSON格式的NSString.
 *
 *  @param  dictionary NSDictionary对象的实例.
 *  @return NSString对象的实例.
 */
+ (NSString *)stringWithDictionary:(NSDictionary *)dictionary;
+ (NSString *)stringWithDictionary:(NSDictionary *)dictionary error:(NSError **)error;

/**
 *  @brief  JSON格式的数组 转 NSArray.
 *
 *  @param  jsonString JSON格式的数组,如:@"[{\"id\":34,\"name\":\"Danny\"},{\"id\":35,\"name\":\"lth\"}]".
 *  @return NSArray对象的实例.
 */
+ (NSArray *)arrayWithJSONString:(NSString *)jsonString;
+ (NSArray *)arrayWithJSONString:(NSString *)jsonString error:(NSError **)error;

/**
 *  @brief  反射获取类属性数组.
 *
 *  @param  aClass Class对象的实例.
 *  @return 属性数组.
 */
+ (NSArray *)classPropertys:(Class)aClass;

/**
 *  @brief  反射获取类属性的类型字典.
 *
 *  @param  aClass Class对象的实例.
 *  @return 属性的类型字典.
 */
+ (NSDictionary *)classPropertysAttributes:(Class)aClass;


#warning dictionaryWithJSONString, stringWithDictionary 是否可以考虑用对应的类别呢？

#pragma mark - File

+ (BOOL)removeItemAtPath:(NSString *)path;
+ (unsigned long long)fileSizeAtPath:(NSString*)path;
+ (unsigned long long)folderSizeAtPath:(NSString*)path;

@end
