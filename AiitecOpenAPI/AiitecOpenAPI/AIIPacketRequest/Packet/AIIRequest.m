//
//  AIIRequest.m
//  AAClient
//
//  Created by iMac on 13-5-13.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIPacketManager.h"

@implementation AIIRequest

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (id)initWithJSONString:(NSString *)jsonString
{
    self = [self init];
    
    NSDictionary *dict = [AIIUtility dictionaryWithJSONString:jsonString];
    [self setValuesForKeysWithDictionary:dict];
    
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (id)valueForUndefinedKey:(NSString *)key
{
    id value;
    if([key isEqualToString:@"t"]) {
        value = [self valueForKey:@"timestampLatest"];
    }
    else if([key isEqualToString:@"c"]) {
        value = [self valueForKey:@"cache"];
    }
    else {
        value = [super valueForUndefinedKey:key];
    }
    return value;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"t"]) {
        [self setValue:value forKey:@"timestampLatest"];
    }
    else if ([key isEqualToString:@"c"]) {
        [self setValue:value forKey:@"cache"];
    }
    else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"timestampLatest";
    if (![[dict objectForKey:k] isKindOfClass:[NSNull class]]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"t"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    k = @"cache";
    if ([[dict objectForKey:k] integerValue]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"c"];
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

#pragma mark - self

- (AIICacheSupporting)cacheSupporting
{
    return AIICacheSupportingNone;
}

- (AIICacheWay)cacheWay
{
    return AIICacheWaySQLite;
}

- (NSString *)packetNickname
{
    // 子类实现
    return @"";
}

@end