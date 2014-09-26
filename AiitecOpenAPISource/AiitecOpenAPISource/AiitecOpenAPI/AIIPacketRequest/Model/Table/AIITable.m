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

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"where"]) {
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
    if ([self.keys containsObject:k] && [dict objectForKey:k]) {
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
