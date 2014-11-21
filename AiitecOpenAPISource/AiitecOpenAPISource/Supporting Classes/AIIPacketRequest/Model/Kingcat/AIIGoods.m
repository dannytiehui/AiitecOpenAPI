//
//  AIIGoods.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIGoods.h"

@implementation AIIGoods

- (id)init
{
    if (self = [super init]) {
        _merchant = [[AIIMerchant alloc] init];
        _imageCollection = [[AIIImageCollection alloc] init];
    }
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"status"]) {
        self.status = [value isEqualToString:@"1"] ? YES : NO;
    }
    else if ([key isEqualToString:self.merchant.key]) {
        [self.merchant setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:self.imageCollection.key]) {
        [self.imageCollection setObjectWithArray:value];
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = self.merchant.key;
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[self.merchant dictionaryWithValuesForKeys:self.merchant.keys] forKey:self.merchant.key];
    }
    
    k = @"imageCollection";
    if ([dict objectForKey:k]) {
        [mutableDictionary setObject:[self.imageCollection arrayWithObject] forKey:self.imageCollection.key];
    }
    [mutableDictionary removeObjectForKey:k];
    
    k = @"status";
    if ([keys containsObject:k]) {
        NSString *status = self.status ? @"1" : @"2";
        [mutableDictionary setObject:status forKey:k];
    }
    
    dict = mutableDictionary;
    
    return dict;
}

@end
