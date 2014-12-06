//
//  AII_Namespace_SwitchPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/6.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AII_Namespace_SwitchPacket.h"

@implementation AII_Namespace_SwitchRequestQuery

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
        NSString *open = self.open ? @"1" : @"2";
        [mutableDictionary setObject:open forKey:k];
    }
    
    dict = mutableDictionary;
    return dict;
}

@end


@implementation AII_Namespace_SwitchRequest
@end


@implementation AII_Namespace_SwitchResponse
@end

