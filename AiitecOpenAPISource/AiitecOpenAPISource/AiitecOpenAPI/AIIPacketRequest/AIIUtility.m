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
//    NSString *str = [NSPropertyListSerialization propertyListFromData:data mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
    NSString *str = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListImmutable format:nil error:nil];
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

+ (NSString *)dateStringWithAbbreviation:(NSString *)abbreviation dateFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:abbreviation];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter stringFromDate:[NSDate date]];
}

+ (NSString *)dateStringToHuman:(NSString *)dateString
{
    NSString *string = @"";
    
    NSDate *date = [NSDate date];
    NSTimeInterval timeInterval = [date timeIntervalSinceDate:[AIIUtility dateFromString:dateString]];
    
    if (timeInterval < 60) {
        string = @"刚刚";
    }
    else if (timeInterval < 60 * 60) {
        string = [NSString stringWithFormat:@"%.f分钟前", timeInterval / 60];
    }
    else if (timeInterval < 60 * 60 * 24) {
        string = [NSString stringWithFormat:@"%.f小时前", timeInterval / 3600];
    }
    else if (timeInterval < 60 * 60 * 24 * 30) {
        string = [NSString stringWithFormat:@"%.f天前", timeInterval / 86400];
    }
    else if (timeInterval < 60 * 60 * 24 * 365) {
        string = [NSString stringWithFormat:@"%.f个月前", timeInterval / 2592000];
    }
    else {
        string = [NSString stringWithFormat:@"%.f年前", timeInterval / 31536000];
    }
    return string;
}

+ (NSDate *)dateFromString:(NSString *)dateString
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    return [df dateFromString:dateString];
}

+ (NSString *)stringFromDate:(NSDate *)date
{
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

+ (NSDictionary *)dictionarySorted:(NSDictionary *)dict
{
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] init];
    
    NSArray *keys = [dict allKeys];
    NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    
    for (NSString *key in sortedArray) {
        [mutableDictionary setValue:[dict objectForKey:key] forKey:key];
    }
    
    return mutableDictionary;
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

+ (NSString *)stringWithDictionaryClearFormat:(NSDictionary *)dictionary
{
    return [AIIUtility stringWithDictionaryRecursive:dictionary string:@"{"];
}

+ (NSString *)stringWithDictionaryRecursive:(NSDictionary *)dict string:(NSString *)string
{
    NSEnumerator *enumerator = [dict keyEnumerator];
    id key;
    
    while ((key = [enumerator nextObject])) {
        
        /** 考虑对象后面需要加逗号的情况. */
        if ([@"}" isEqualToString:[string substringFromIndex:string.length - 1]]) {
            string = [string stringByAppendingString:@","];
        }
        
        if ([[dict objectForKey:key] class] == [[[NSMutableDictionary alloc] init] class]) {
            string = [string stringByAppendingFormat:@"\"%@\":{", key];
            string = [AIIUtility stringWithDictionaryRecursive:[dict objectForKey:key] string:string];
//            string = [string stringByAppendingString:@"}"];
        }
        else if ([[dict objectForKey:key] class] == [[[NSMutableArray alloc] init] class]) {
            string = [string stringByAppendingFormat:@"\"%@\":[", key];
            
            NSArray *array = (NSArray *)[dict objectForKey:key];
            NSUInteger count = [array count];
            for (NSUInteger i = 0; i < count; i ++) {
                string = [string stringByAppendingString:@"{"];
                string = [AIIUtility stringWithDictionaryRecursive:[array objectAtIndex:i] string:string];
                string = [string stringByAppendingString:@","];
            }

            /** 考虑数组为空的情况. */
            if ([@"," isEqualToString:[string substringFromIndex:string.length - 1]]) {
                string = [string substringToIndex:string.length - 1];
            }
            
            string = [string stringByAppendingString:@"],"];
        }
        else {
//            NSLog(@"%@, %@,%@", key, [[dict objectForKey:key] superclass] , [NSMutableString class]);
            if ([[dict objectForKey:key] superclass] == [NSNumber class]) {
                string = [string stringByAppendingFormat:@"\"%@\":%@,", key, [dict objectForKey:key]];
            }
            else if ([[dict objectForKey:key] superclass] == [NSArray class]) {
                NSArray *array = [dict objectForKey:key];
                NSString *temp = @"";
                for (id value in array) {
                    if ([value superclass] == [NSNumber class]) {
                        temp = [temp stringByAppendingFormat:@"%@,", value];
                    }
                    else {
                        temp = [temp stringByAppendingFormat:@"\"%@\",", value];
                    }
                }
                
                if (array.count) {
                    temp = [temp substringToIndex:temp.length - 1];
                }
                
                string = [string stringByAppendingFormat:@"\"%@\":[%@],", key, temp];
            }
            else if ([[dict objectForKey:key] superclass] == [NSObject class]) {
                string = [string stringByAppendingFormat:@"\"%@\":null,", key];
            }
            else {
                NSString *formatNewlineString = [[dict objectForKey:key] stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
                formatNewlineString = [formatNewlineString stringByReplacingOccurrencesOfString:@"/" withString:@"\\/"];
                string = [string stringByAppendingFormat:@"\"%@\":\"%@\",", key, formatNewlineString];
            }
            
        }
    }
    
    if ([@"," isEqualToString:[string substringFromIndex:string.length - 1]]) {
        string = [string substringToIndex:string.length - 1];
    }
    return [string stringByAppendingString:@"}"];
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

+ (NSString *)arc4random:(NSUInteger)length stringType:(AIIStringType)stringType
{
    NSString *randomString = [[NSString alloc] init];
    NSArray *numberArray    = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    NSArray *uppercaseArray = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    NSArray *lowercaseArray = @[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"];
    NSArray *baseArray = @[numberArray, uppercaseArray, lowercaseArray];
    
    NSArray *array = [[NSArray alloc] init];
    NSUInteger count = baseArray.count;
    for (NSUInteger i = 0; i < count; i++) {
        NSUInteger match = stringType >> i;//!< 右移位法
//        NSLog(@"%lu, %lu, %lu", i, (unsigned long)match, (match & 1));
        if (match & 1) {
            array = [array arrayByAddingObjectsFromArray:baseArray[i]];
        }
    }
    
    int len = (unsigned int)[array count];
    for (int i = 0; i< length; i ++){
        int index = arc4random_uniform(len);
        randomString = [randomString stringByAppendingString:array[index]];
    }
    return randomString;
}

//  十进制转二进制
+ (NSString *)toBinarySystemWithDecimalSystem:(NSNumber *)decimal
{
    int num = [decimal intValue];
    int remainder = 0;      //余数
    int divisor = 0;        //除数
    
    NSString *prepare = @"";
    
    while (true) {
        remainder = num % 2;
        divisor = num / 2;
        num = divisor;
        prepare = [prepare stringByAppendingFormat:@"%d",remainder];
        
        if (divisor == 0) {
            break;
        }
    }
    
    NSString *result = @"";
    for (NSInteger i = prepare.length - 1; i >= 0; i --) {
        result = [result stringByAppendingFormat:@"%@", [prepare substringWithRange:NSMakeRange(i , 1)]];
    }
    
    return result;
}

//  二进制转十进制
+ (NSNumber *)toDecimalSystemWithBinarySystem:(NSString *)binary
{
    int ll = 0 ;
    int temp = 0 ;
    for (int i = 0; i < binary.length; i ++) {
        temp = [[binary substringWithRange:NSMakeRange(i, 1)] intValue];
        temp = temp * powf(2, binary.length - i - 1);
        ll += temp;
    }
    return [NSNumber numberWithInt:ll];
}

+ (NSString *)iqPacketEncryption
{
    // 1. 获取北京时间，格式:yyyyMMdd
    NSString *dateString = [AIIUtility dateStringWithAbbreviation:@"GMT+0800" dateFormat:@"yyyyMMdd"];
    NSUInteger dateInteger = [dateString integerValue];
    
    // 2. 数字混排.把日期年月日与8取模,把dateString的最后一位移到「取模」的位置,如20141209,与8取模值为1,则数字混排后的结果为:29014120;特例:若时间为20150120,与8取模值为0,则数字混排后的结果为:02015012.十进制数字则为2015012.
    NSMutableString *ms = [NSMutableString stringWithFormat:@"%@", dateString];
    NSString *lastNumber = [ms substringFromIndex:(ms.length-1)];
    [ms insertString:lastNumber atIndex:(dateInteger % 8)];

    dateInteger = [[ms substringToIndex:ms.length -1] integerValue];
    
    // 3.把十进制数字转二进制
    return [AIIUtility toBinarySystemWithDecimalSystem:[NSNumber numberWithInteger:dateInteger]];
}

@end
