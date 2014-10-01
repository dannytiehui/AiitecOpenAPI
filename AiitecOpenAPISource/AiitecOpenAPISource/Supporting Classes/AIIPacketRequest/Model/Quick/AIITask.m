//
//  AIITask.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIITask.h"
#import "AIIOrder.h"

@implementation AIITask

- (id)init
{
    if (self = [super init]) {
        _user = [[AIIUser alloc] init];
        _order = [[AIIOrder alloc] init];
        _imageCollection = [[AIIImageCollection alloc] init];
    }
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"unfreeze"]) {
        self.unfreeze = [value isEqualToString:@"1"] ? YES : NO;
    }
    else if ([key isEqualToString:self.user.key]) {
//        self.user = [[AIIUser alloc] init];
        [self.user setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:self.order.key]) {
//        self.order = [[AIIOrder alloc] init];
        [self.order setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:self.imageCollection.key]) {
        [self.imageCollection setObjectWithArray:value];
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:self.imageCollection.key]) {
        [self.imageCollection setObjectWithArray:value];
    }
    else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = self.user.key;
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[self.user dictionaryWithValuesForKeys:self.user.keys] forKey:self.user.key];
    }
    
    k = self.order.key;
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[self.order dictionaryWithValuesForKeys:self.order.keys] forKey:self.order.key];
    }
    
    k = @"imageCollection";
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[self.imageCollection arrayWithObject] forKey:self.imageCollection.key];
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    
    return dict;
}

@end
