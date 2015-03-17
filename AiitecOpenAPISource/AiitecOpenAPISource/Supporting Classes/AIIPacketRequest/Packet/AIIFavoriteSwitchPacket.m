//
//  AIIFavoriteSwitchRequest.m
//  AAClient
//
//  Created by iMac on 13-5-21.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIFavoriteSwitchPacket.h"

@implementation AIIFavoriteSwitchRequestQuery

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
        NSString *open = self.open ? @"1" : @"2";
        [mutableDictionary setObject:open forKey:k];
    }
    
    dict = mutableDictionary;
    return dict;
}

@end


@implementation AIIFavoriteSwitchRequest

- (NSString *)packetNickname
{
    return @"收藏/取消收藏";
}

@end


@implementation AIIFavoriteSwitchResponse
@end