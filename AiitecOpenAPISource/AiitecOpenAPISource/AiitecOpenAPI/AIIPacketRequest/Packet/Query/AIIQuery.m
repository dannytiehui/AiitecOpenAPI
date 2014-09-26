//
//  AIIQuery.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-8-27.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIQuery.h"

@implementation AIIQuery

#pragma mark - NSObject(NSKeyValueCoding)

- (id)valueForUndefinedKey:(NSString *)key
{
    id value;
    if([key isEqualToString:@"a"]) {
        value = [self valueForKey:@"action"];
    }
    else if([key isEqualToString:@"id"]) {
        value = [self valueForKey:@"identifier"];
    }
    else if([key isEqualToString:@"s"]) {
        value = [self valueForKey:@"status"];
    }
    else if([key isEqualToString:@"d"]) {
        value = [self valueForKey:@"desc"];
    }
    else if([key isEqualToString:@"t"]) {
        value = [self valueForKey:@"timestamp"];
    }
    else {
        value = [super valueForUndefinedKey:key];
    }
    return value;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"a"]) {
        [self setValue:value forKey:@"action"];
    }
    else if([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"identifier"];
    }
    else if([key isEqualToString:@"s"]) {
        [self setValue:value forKey:@"status"];
    }
    else if([key isEqualToString:@"d"]) {
        [self setValue:value forKey:@"desc"];
    }
    else if([key isEqualToString:@"t"]) {
        [self setValue:value forKey:@"timestamp"];
    }
    else {
//        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"action";
    if ([[dict objectForKey:k] integerValue]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"a"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    k = @"identifier";
    if ([[dict objectForKey:k] integerValue]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"id"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    k = @"status";
    if ([dict objectForKey:k] && ![[dict objectForKey:k] isKindOfClass:[NSNull class]]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"s"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    k = @"desc";
    if ([dict objectForKey:k] && ![[dict objectForKey:k] isKindOfClass:[NSNull class]]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"d"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    k = @"timestamp";
    if ([dict objectForKey:k] && ![[dict objectForKey:k] isKindOfClass:[NSNull class]]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"t"];
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
 *  @brief  组包时,获取对象的默认属性.默认不包含key,且｀action、identifier、status、desc、timestamp｀为空时不包含.
 *
 *  @return 组包时包含的属性.
 */
- (NSArray *)defaultProperties
{
    NSArray *_defaultProperties = [super defaultProperties];
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray:_defaultProperties];
    
    if (!self.action) {
        [mutableArray removeObject:@"action"];
    }
    
    if (!self.identifier) {
        [mutableArray removeObject:@"identifier"];
    }
    
    if (!self.status) {
        [mutableArray removeObject:@"desc"];
    }
    
    if (!self.desc) {
        [mutableArray removeObject:@"timestampUpdate"];
    }
    
    if (!self.timestamp) {
        [mutableArray removeObject:@"timestamp"];
    }
    
    _defaultProperties = mutableArray;
    return _defaultProperties;
}

@end
