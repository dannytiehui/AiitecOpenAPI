//
//  AIITaskJoinSwitchPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIITaskJoinSwitchPacket.h"

@implementation AIITaskJoinSwitchRequestQuery

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"open"]) {
        self.open = [value isEqualToString:@"1"] ? YES : NO;
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
        NSUInteger open = [[dict objectForKey:k] boolValue] ? 1 : 2;
        [mutableDictionary setObject:[NSNumber numberWithInteger:open] forKey:k];
    }
    
    dict = mutableDictionary;
    return dict;
}

@end


@implementation AIITaskJoinSwitchRequest
@end


@implementation AIITaskJoinSwitchResponse
@end
