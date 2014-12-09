//
//  AIIComment.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/8.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIComment.h"

@implementation AIIComment

- (id)init
{
    if (self = [super init]) {
        _user = [[AIIUser alloc] init];
    }
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:self.user.key]) {
        [self.user setValuesForKeysWithDictionary:value];
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
    NSString *k = @"user";
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[self.user dictionaryWithValuesForKeys:self.user.keys] forKey:self.user.key];
    }

    dict = mutableDictionary;
    
    return dict;
}

@end
