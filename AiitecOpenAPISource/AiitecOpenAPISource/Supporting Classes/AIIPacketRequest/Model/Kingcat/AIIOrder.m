//
//  AIIOrder.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIOrder.h"

@implementation AIIOrder

- (id)init
{
    if (self = [super init]) {
        _goods = [[AIIGoods alloc] init];
        _merchant = [[AIIMerchant alloc] init];
        _winners = [[AIIUserCollection alloc] init];
        _winners.key = @"winners";
        _winners.entityKey = @"winner";
    }
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"spendingStatus"]) {
        self.spendingStatus = [value boolValue];
    }
    else if ([key isEqualToString:@"winningStatus"]) {
        self.spendingStatus = [value boolValue];
    }
    else if ([key isEqualToString:self.goods.key]) {
        [self.goods setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:self.merchant.key]) {
        [self.merchant setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:self.winners.key]) {
        [self.winners setObjectWithArray:value];
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"goods";
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[self.goods dictionaryWithValuesForKeys:self.goods.keys] forKey:self.goods.key];
    }
    
    k = @"merchant";
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[self.merchant dictionaryWithValuesForKeys:self.merchant.keys] forKey:self.merchant.key];
    }
    
    k = @"winners";
    if ([dict objectForKey:k]) {
        self.winners.key = @"winners";
        self.winners.entityKey = @"winner";
        self.winners.entityProperties = @[@"mobile"];
        [mutableDictionary setObject:[self.winners arrayWithObject] forKey:self.winners.key];
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    
    return dict;
}

@end
