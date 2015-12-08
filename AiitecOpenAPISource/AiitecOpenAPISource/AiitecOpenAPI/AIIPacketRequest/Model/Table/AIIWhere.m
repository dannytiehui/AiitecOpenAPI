//
//  AIIWhere.m
//  AII
//
//  Created by iMac on 13-12-13.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIWhere.h"

@implementation AIIWhere

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    AIIWhere *where = [super copyWithZone:zone];
    
    where.ids = [_ids copy];
    where.searchKey = [_searchKey copy];
    
    return where;
}

#pragma mark - NSMutableCopying

- (id)mutableCopyWithZone:(NSZone *)zone
{
    AIIWhere *where = [super mutableCopyWithZone:zone];
    
    where.ids = [_ids mutableCopy];
    where.searchKey = [_searchKey mutableCopy];
    
    return where;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.ids forKey:@"WhereIds"];
    [aCoder encodeObject:self.searchKey forKey:@"WhereSearchKey"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    self.ids = [aDecoder decodeObjectForKey:@"WhereIds"];
    self.searchKey = [aDecoder decodeObjectForKey:@"WhereSearchKey"];
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"sk"]) {
        self.searchKey = value;
    }
    else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"ids";
    if (![dict objectForKey:k] || [[dict objectForKey:k] isKindOfClass:[NSNull class]]) {
        [mutableDictionary removeObjectForKey:k];
    }
    
    k = @"searchKey";
    if ([dict objectForKey:k] && ![[dict objectForKey:k] isKindOfClass:[NSNull class]]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"sk"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    return dict;
}

@end
