//
//  AIIEntityQuery.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-11.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntityQuery.h"

@implementation AIIEntityQuery

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:self.entity.key]) {
        [self.entity setValuesForKeysWithDictionary:value];
    }
    else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"entity";
    if ([[dict objectForKey:k] isKindOfClass:[AIIEntity class]]) {
        [mutableDictionary setObject:[self.entity dictionaryWithValuesForKeys:self.entity.keys] forKey:self.entity.key];
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    
    return dict;
}

@end
