//
//  AIIWeibo.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIWeibo.h"

@implementation AIIWeibo

- (id)init
{
    if (self = [super init]) {
        _user = [[AIIUser alloc] init];
        _imageCollection = [[AIIImageCollection alloc] init];
    }
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:self.user.key]) {
        [self.user setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:@"repostWeibo"]) {
        self.repostWeibo = [[AIIWeibo alloc] init];
        [self.repostWeibo setValuesForKeysWithDictionary:value];
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
    if([@[@"delete"] containsObject:key]) {
        
    }
    else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k;
    
    k = @"user";
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[self.user dictionaryWithValuesForKeys:self.user.keys] forKey:self.user.key];
    }
    
    k = @"imageCollection";
    if ([dict objectForKey:k]) {
        [mutableDictionary setObject:[self.imageCollection arrayWithObject] forKey:self.imageCollection.key];
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    
    return dict;
}

@end
