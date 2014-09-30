//
//  AIIListPacket.m
//  AAClient
//
//  Created by iMac on 13-5-9.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"

@implementation AIIListRequestQuery

- (id)init
{
    if (self = [super init]) {
//        self.table = [[AIITable alloc] init];
    }
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (id)valueForUndefinedKey:(NSString *)key
{
    id value;
    if([key isEqualToString:self.table.key]) {
        self.table = [[AIITable alloc] init];
        value = [self valueForKey:@"table"];
    }
    else {
        value = [super valueForUndefinedKey:key];
    }
    return value;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:self.table.key]) {
        [self.table setValue:value forKey:@"table"];
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
    if ([[dict objectForKey:k] isKindOfClass:[NSNull class]]) {
        [mutableDictionary removeObjectForKey:k];
    }
    
    k = @"table";
    if ([keys containsObject:@"table"] && ![[dict objectForKey:k] isKindOfClass:[NSNull class]]) {
        [mutableDictionary setObject:[self.table dictionaryWithValuesForKeys:self.table.keys] forKey:self.table.key];
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    return dict;
}

@end



@implementation AIIListResponseQuery
@end



@implementation AIIListRequest

#pragma mark - super

- (Class)queryClass
{
    return [AIIListRequestQuery class];
}

@end



@implementation AIIListResponse

#pragma mark - super

- (Class)queryClass
{
    return [AIIListResponseQuery class];
}

@end

