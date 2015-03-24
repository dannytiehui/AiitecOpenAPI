//
//  AIIFetchExecutingOrdersPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIFetchExecutingOrdersPacket.h"

@implementation AIIFetchExecutingOrdersResponseQuery

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"executingOrders"]) {
        self.executingOrders = [value isEqualToString:@"1"] ? YES : NO;
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    
    NSString *k = @"executingOrders";
    if ([keys containsObject:k]) {
        NSString *executingOrders = self.executingOrders ? @"1" : @"2";
        [mutableDictionary setObject:executingOrders forKey:k];
    }
    
    dict = mutableDictionary;
    return dict;
}

@end


@implementation AIIFetchExecutingOrdersRequest
@end


@implementation AIIFetchExecutingOrdersResponse
@end
