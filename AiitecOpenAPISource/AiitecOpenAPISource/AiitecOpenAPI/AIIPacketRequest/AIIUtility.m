//
//  AIIUtility.m
//  AAClient
//
//  Created by iMac on 13-5-15.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIUtility.h"

NSString *const DeviceTokenKey = @"deviceId";

@implementation AIIUtility

+ (NSString *)cachesPath
{
    static NSString *path = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    });
    return path;
}

+ (NSString *)cachesPacketPath
{
    static NSString *path = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        path = [[AIIUtility cachesPath] stringByAppendingPathComponent:@"com.aiitec.AiitecOpenAPI"];
    });
    return path;
}

+ (void)setObject:(id)anObject forKey:(id <NSCopying>)aKey toDictionary:(NSMutableDictionary *)dict
{
    if (anObject) {
        dict[aKey] = anObject;
    }
}

+ (void)setObject:(id)anObject forKey:(id <NSCopying>)aKey toDictionary:(NSMutableDictionary *)dict allowEmptyString:(BOOL)allow
{
    if (anObject) {
        if (allow || ([anObject isKindOfClass:[NSString class]] && [anObject length] > 0)) {
            dict[aKey] = anObject;
        }
    }
    else if (allow) {
        dict[aKey] = @"";
    }
}

+ (void)setInteger:(NSUInteger)integer forKey:(id <NSCopying>)aKey toDictionary:(NSMutableDictionary *)dict
{
    [AIIUtility setInteger:integer forKey:aKey toDictionary:dict allowZero:NO];
}

+ (void)setInteger:(NSUInteger)integer forKey:(id <NSCopying>)aKey toDictionary:(NSMutableDictionary *)dict allowZero:(BOOL)allow
{
    if (allow || integer) {
        dict[aKey] = [NSString stringWithFormat:@"%lu", integer];
    }
}

+ (NSString *)replaceUnicode:(NSString *)unicodeString {
    NSString *s1 = [unicodeString stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    NSString *s2 = [s1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
    NSString *s3 = [[@"\""stringByAppendingString:s2]stringByAppendingString:@"\""];
    NSData *data = [s3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str = [NSPropertyListSerialization propertyListFromData:data mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
    return [str stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
}

#pragma mark - Filter empty object

+ (id)emptyObjectFilter:(id)object
{
    id objectFiltered = nil;
    
    do {
        if ([object isKindOfClass:[NSNull class]]) {
            break;
        }
        
        if ([object isKindOfClass:[NSString class]]) {
            if (((NSString *)object).length > 0) {
                objectFiltered = object;
            }
            break;
        }
        
        if ([object isKindOfClass:[NSArray class]]) {
            objectFiltered = [AIIUtility arrayFilter:object];
            break;
        }
        
        if ([object isKindOfClass:[NSDictionary class]]) {
            objectFiltered = [AIIUtility dictionaryFilter:object];
            break;
        }
        
        if (object) {
            objectFiltered = object;
            break;
        }
    } while (NO);
    
    return objectFiltered;
}

+ (void)setObject:(id)anObject forKey:(id <NSCopying>)aKey toDict:(NSMutableDictionary **)dict
{
    if (anObject && ((NSString *)aKey).length > 0) {
        id objectFiltered = [AIIUtility emptyObjectFilter:anObject];
        if (objectFiltered) {
            [(NSMutableDictionary *)*dict setObject:objectFiltered forKey:aKey];
        }
    }
}

+ (void)addObject:(id)anObject toArray:(NSMutableArray **)array
{
    if (anObject) {
        id objectFiltered = [AIIUtility emptyObjectFilter:anObject];
        if (objectFiltered) {
            [(NSMutableArray *)*array addObject:objectFiltered];
        }
    }
}

/// 字典的递归过滤方法，用于将字典内为nil或者空串的键值对去掉
+ (NSDictionary *)dictionaryFilter:(NSDictionary *)dict
{
    NSMutableDictionary *dictFiltered = nil;
    
    if ([dict isKindOfClass:[NSDictionary class]])
    {
        dictFiltered = [[NSMutableDictionary alloc] init];
        for (NSString *key in [dict allKeys]) {
            id object = dict[key];
            id objectFiltered = [AIIUtility emptyObjectFilter:object];
            if (objectFiltered) {
                dictFiltered[key] = objectFiltered;
            }
        }
        
        if (0 == dictFiltered.count) {
            dictFiltered = nil;
        }
    }
    
    return dictFiltered;
}

+ (NSArray *)arrayFilter:(NSArray *)array
{
    NSMutableArray *arrayFiltered = nil;
    
    if ([array isKindOfClass:[NSArray class]] && array.count > 0) {
        arrayFiltered = [[NSMutableArray alloc] init];
        for (id object in array) {
            id objectFiltered = [AIIUtility emptyObjectFilter:object];
            if (objectFiltered) {
                [arrayFiltered addObject:objectFiltered];
            }
        }
        
        if (0 == arrayFiltered.count) {
            arrayFiltered = nil;
        }
    }
    
    return arrayFiltered;
}

+ (NSString *)md5:(NSString *)str
{
    if (str.length == 0) {
        return @"";
    }
    const char *cStr = [str UTF8String];
    unsigned char result[16];
//    CC_MD5(cStr, strlen(cStr), result);//!< 用下面的一行代码替换 [Danny 2014-11-21].
    CC_MD5(cStr, (uint32_t)strlen(cStr), result);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (NSDate *)dateFromString:(NSString *)dateString{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    return [df dateFromString:dateString];
}

+ (NSString *)stringFromDate:(NSDate *)date{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    return [df stringFromDate:date];
}

+ (NSDictionary *)dictionaryWithJSONString:(NSString *)jsonString
{
    NSError *error;
    NSDictionary *dict = [[NSDictionary alloc] init];
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    if (data) {
        dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    }

    if (error) {
        NSLog(@"Error! dictionaryWithJSONString:%@", jsonString);
    }
    
    return dict;
}

+ (NSDictionary *)dictionaryWithJSONString:(NSString *)jsonString error:(NSError **)error
{
    NSDictionary *dict = [[NSDictionary alloc] init];
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    if (data) {
        dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:error];
    }
    return dict;
}

+ (NSString *)stringWithDictionary:(NSDictionary *)dict
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"Error! stringWithDictionary: %@, %@", [error localizedDescription], dict);
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSString *)stringWithDictionary:(NSDictionary *)dict error:(NSError **)error
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:error];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSArray *)arrayWithJSONString:(NSString *)jsonString
{
    NSError *error;
    NSArray *array = [[NSArray alloc] init];
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    if (data) {
        array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    }
    
    if (error) {
        NSLog(@"Error! dictionaryWithJSONString:%@", jsonString);
    }
    
    return array;
}

+ (NSArray *)arrayWithJSONString:(NSString *)jsonString error:(NSError **)error
{
    NSArray *array = [[NSArray alloc] init];
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    if (data) {
        array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:error];
    }
    return array;
}

+ (NSArray *)classPropertys:(Class)aClass
{
    NSMutableArray *prop = [[NSMutableArray alloc] init];
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(aClass, &outCount);//!< [aClass class];
    for (i=0; i<outCount; i++) {
        objc_property_t property = properties[i];
        NSString *key = [[NSString alloc] initWithCString:property_getName(property)  encoding:NSUTF8StringEncoding];
//        NSLog(@"property[%d] :%@ \n", i, key);
        [prop addObject:key];
    }
    
    return prop;
}

+ (NSDictionary *)classPropertysAttributes:(Class)aClass
{
    NSMutableDictionary *mDict = [[NSMutableDictionary alloc] init];
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(aClass, &outCount);//!< [aClass class];
    for (i=0; i<outCount; i++) {
        objc_property_t property = properties[i];
        NSString *key = [[NSString alloc] initWithCString:property_getName(property)  encoding:NSUTF8StringEncoding];
        NSString *temp = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
        NSArray *tempArray = [temp componentsSeparatedByString:@","];
        [mDict setObject:tempArray forKey:key];
    }
    
    return mDict;
}

#pragma mark - File

+ (BOOL)removeItemAtPath:(NSString *)path
{
    NSFileManager *fm = [NSFileManager defaultManager];
    return [fm removeItemAtPath:path error:nil];
}

+ (unsigned long long)fileSizeAtPath:(NSString*)path
{
    unsigned long long size = 0;
    
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:path]){
        size = [[fm attributesOfItemAtPath:path error:nil] fileSize];
        //        NSLog(@"%llu, %@", size, path);
    }
    return size;
}

+ (unsigned long long)folderSizeAtPath:(NSString*)path
{
    unsigned long long size = 0;
    NSFileManager *fm = [NSFileManager defaultManager];
    NSEnumerator *childFilesEnumerator = [[fm subpathsAtPath:path] objectEnumerator];
    NSString *fileName;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        size += [self fileSizeAtPath:[path stringByAppendingPathComponent:fileName]];
    }
    return size;
}


@end
