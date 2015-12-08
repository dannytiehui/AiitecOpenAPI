//
//  AIIUserDetailsPacket.m
//  AAClient
//
//  Created by iMac on 13-5-24.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIUserDetailsPacket.h"

@implementation AIIUserDetailsRequestQuery

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"name";
    if (![dict objectForKey:k] || [[dict objectForKey:k] isKindOfClass:[NSNull class]]) {
        [mutableDictionary removeObjectForKey:k];
    }
    
    dict = mutableDictionary;
    return dict;
}

@end


@implementation AIIUserDetailsResponseQuery
@end


@implementation AIIUserDetailsRequest

- (NSString *)packetNickname
{
    return @"查询个人信息";
}

@end


@implementation AIIUserDetailsResponse

@end
