//
//  AIITable.m
//  AII
//
//  Created by iMac on 14-1-21.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIITable.h"

@implementation AIITable

- (id)init
{
    if (self = [super init]) {
        self.page = 1;
        self.limit = 10;
        self.orderBy = AIIOrderByDefault;
        self.orderType = AIIOrderTypeDESC;
//        self.where = [[AIIWhere alloc] init];

    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    AIITable *table = [super copyWithZone:zone];

    table.page = _page;
    table.limit = _limit;
    table.orderBy = _orderBy;
    table.orderType = _orderType;
    table.where = [_where copyWithZone:zone];

    return table;
}

#pragma mark - NSMutableCopying

- (id)mutableCopyWithZone:(NSZone *)zone
{
    AIITable *table = [super mutableCopyWithZone:zone];
    
    table.page = _page;
    table.limit = _limit;
    table.orderBy = _orderBy;
    table.orderType = _orderType;
    table.where = [_where mutableCopyWithZone:zone];

    return table;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeInteger:self.page forKey:@"TablePage"];
    [aCoder encodeInteger:self.limit forKey:@"TableLimit"];
    [aCoder encodeInteger:self.orderBy forKey:@"TableOrderBy"];
    [aCoder encodeInteger:self.orderType forKey:@"TableOrderType"];
    [aCoder encodeObject:self.where forKey:@"TableWhere"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    self.page = [aDecoder decodeIntegerForKey:@"TablePage"];
    self.limit = [aDecoder decodeIntegerForKey:@"TableLimit"];
    self.orderBy = [aDecoder decodeIntegerForKey:@"TableOrderBy"];
    self.orderType = [aDecoder decodeIntegerForKey:@"TableOrderType"];
    self.where = [aDecoder decodeObjectForKey:@"TableWhere"];
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:self.where.key]) {
        self.where = [[AIIWhere alloc] init];
        [self.where setValuesForKeysWithDictionary:value];
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    
    NSString *k = @"page";
    if ([self.keys containsObject:k] && [dict objectForKey:k]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"pa"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    k = @"limit";
    if ([self.keys containsObject:k] && [dict objectForKey:k]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"li"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    k = @"orderBy";
    if ([self.keys containsObject:k] && [dict objectForKey:k]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"ob"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    k = @"orderType";
    if ([self.keys containsObject:k] && [dict objectForKey:k]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"ot"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    k = @"where";
    if ([self.keys containsObject:k] && ![[dict objectForKey:k] isKindOfClass:[NSNull class]]) {
        [mutableDictionary setObject:[self.where dictionaryWithValuesForKeys:self.where.keys] forKey:@"w"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    return dict;
}

#pragma mark - super

- (NSString *)key
{
    return @"ta";
}

@end
