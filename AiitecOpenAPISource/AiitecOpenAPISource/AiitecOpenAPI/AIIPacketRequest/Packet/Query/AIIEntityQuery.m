//
//  AIIEntityQuery.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-11.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntityQuery.h"

@implementation AIIEntityQuery

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    AIIEntityQuery *entityQuery = [super copyWithZone:zone];
    entityQuery.entity = [_entity copyWithZone:zone];
    return entityQuery;
}

#pragma mark - NSMutableCopying

- (id)mutableCopyWithZone:(NSZone *)zone
{
    AIIEntityQuery *entityQuery = [super mutableCopyWithZone:zone];
    entityQuery.entity = [_entity mutableCopyWithZone:zone];
    return entityQuery;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.entity forKey:@"EntityQueryEntity"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    self.entity = [aDecoder decodeObjectForKey:@"EntityQueryEntity"];
    return self;
}

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
