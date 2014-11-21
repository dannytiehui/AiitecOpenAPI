//
//  AIIExchangeSubmitPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIExchangeSubmitPacket.h"

@implementation AIIExchangeSubmitRequestQuery

#pragma mark - NSObject(NSKeyValueCoding)

- (id)valueForUndefinedKey:(NSString *)key
{
    id value;
    if([key isEqualToString:@"a"]) {
        value = [self valueForKey:@"action"];
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
    else {
        [super setValue:value forUndefinedKey:key];
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
 
    dict = mutableDictionary;
    return dict;
}

#pragma mark - ValueToDictionary

- (NSString *)jsonStringWithObject
{
    return [AIIUtility stringWithDictionary:[self dictionaryWithValuesForKeys:self.keys]];
}

#pragma mark - super

- (NSString *)key
{
    return @"q";
}

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

    _defaultProperties = mutableArray;
    return _defaultProperties;
}

@end


@implementation AIIExchangeSubmitRequest
@end



@implementation AIIExchangeSubmitResponse
@end
