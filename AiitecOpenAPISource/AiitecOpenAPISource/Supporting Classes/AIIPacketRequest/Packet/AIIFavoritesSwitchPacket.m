//
//  AIIFavoritesSwitchRequest.m
//  AAClient
//
//  Created by iMac on 13-5-21.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIFavoritesSwitchPacket.h"

@implementation AIIFavoritesSwitchRequestQuery

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"open"]) {
        self.status = [value isEqualToString:@"1"] ? YES : NO;
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"open";
    if ([keys containsObject:k]) {
        NSString *status = self.open ? @"1" : @"2";
        [mutableDictionary setObject:status forKey:k];
    }
    
    dict = mutableDictionary;
    return dict;
}

@end


@implementation AIIFavoritesSwitchRequest

- (NSString *)packetNickname
{
    return @"收藏/取消收藏";
}

@end


@implementation AIIFavoritesSwitchResponse
@end