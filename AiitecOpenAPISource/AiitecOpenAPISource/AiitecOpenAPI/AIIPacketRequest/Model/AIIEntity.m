//
//  AIIEntity.m
//  AAClient
//
//  Created by iMac on 13-5-13.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"

@implementation AIIEntity

//- (id)init
//{
//    if (self = [super init]) {
//        /** 注意:self.key等同于[self key],不能用 _key 替换,原因是程序的执行先后顺序,[self key]是调用的子类方法. */
//        if (!self.key.length) {
//            NSString *className = NSStringFromClass(self.class);
//            className = [className stringByReplacingOccurrencesOfString:@"AII" withString:@""];
//            _key = className.lowercaseString;
//        }
//    }
//    return self;
//}

- (id)initWithJSONString:(NSString *)jsonString
{
    self = [self init];
    
    NSDictionary *dict = [AIIUtility dictionaryWithJSONString:jsonString];
    [self setValuesForKeysWithDictionary:[dict objectForKey:self.key]];
    
    return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeInteger:self.identifier forKey:@"EntityIdentifier"];
    [aCoder encodeObject:self.name forKey:@"EntityName"];
    [aCoder encodeObject:self.timestampUpdate forKey:@"EntityTimestampUpdate"];
    [aCoder encodeObject:self.timestamp forKey:@"EntityTimestamp"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    self.identifier = (NSUInteger)[aDecoder decodeObjectForKey:@"EntityIdentifier"];
    self.name = [aDecoder decodeObjectForKey:@"EntityName"];
    self.timestampUpdate = [aDecoder decodeObjectForKey:@"EntityTimestampUpdate"];
    self.timestamp = [aDecoder decodeObjectForKey:@"EntityTimestamp"];
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

//- (id)valueForUndefinedKey:(NSString *)key
//{
//    NSLog(@"AIIEntity.valueForUndefinedKey:key = %@", key);
//    
//    id value;
//    if([key isEqualToString:@"id"]) {
//        value = [self valueForKey:@"identifier"];
//    }
//    else {
//        value = [super valueForUndefinedKey:key];
//    }
//    return value;
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"id"]) {
//        [self setValue:value forKey:@"identifier"];//!< 不推荐
        self.identifier = [value integerValue];//!< 推荐
    }
    else if([key isEqualToString:@"description"]) {
//        [self setValue:value forKey:@"desc"];//!< 不推荐
        self.desc = value;
    }
    else {
//        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"identifier";
    if ([[dict objectForKey:k] integerValue]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"id"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    k = @"name";
    if (![dict objectForKey:k] || [[dict objectForKey:k] isKindOfClass:[NSNull class]]) {
        [mutableDictionary removeObjectForKey:k];
    }
    
    k = @"desc";
    if ([dict objectForKey:k] && ![[dict objectForKey:k] isKindOfClass:[NSNull class]]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"description"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    
    return dict;
}

#pragma mark - ValueToDictionary

- (NSString *)jsonStringWithObject
{
    return [AIIUtility stringWithDictionary:[self dictionaryWithValuesForKeys:self.keys]];
}

#pragma mark - super

/**
 *  @brief  组包时,获取对象的默认属性.默认不包含key,且｀identifier、name、desc、timestampUpdate、timestamp｀为空时不包含.
 *
 *  @return 组包时包含的属性.
 */
- (NSArray *)defaultProperties
{
    NSArray *_defaultProperties = [super defaultProperties];
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray:_defaultProperties];
    
    if (!self.identifier) {
        [mutableArray removeObject:@"identifier"];
    }
    
    if (!self.name) {
        [mutableArray removeObject:@"name"];
    }
    
    if (!self.desc) {
        [mutableArray removeObject:@"desc"];
    }
    
    if (!self.timestampUpdate) {
        [mutableArray removeObject:@"timestampUpdate"];
    }
    
    if (!self.timestamp) {
        [mutableArray removeObject:@"timestamp"];
    }
    
    _defaultProperties = mutableArray;
    return _defaultProperties;
}

@end
