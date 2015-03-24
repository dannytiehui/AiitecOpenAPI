//
//  AIIDeviceTokenSwitchPacket.m
//  AAClient
//
//  Created by iMac on 13-7-4.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIDeviceTokenSwitchPacket.h"

@implementation AIIDeviceTokenSwitchRequestQuery

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
    
    NSString *k = @"deviceToken";
//    if (![[dict objectForKey:k] isKindOfClass:[NSNull class]]) {
    [mutableDictionary setObject:[[NSUserDefaults standardUserDefaults] objectForKey:DeviceTokenKey] forKey:k];
//    }
    dict = mutableDictionary;
    
    k = @"open";
    if ([keys containsObject:k]) {
        NSString *open = self.open ? @"1" : @"2";
        [mutableDictionary setObject:open forKey:k];
    }
    
    dict = mutableDictionary;
    return dict;
}

@end

//@implementation AIIDeviceTokenSwitchResponse
//
//- (NSString *)nameSpace
//{
//    return @"DeviceTokenSwitch";
//}
//
//@end


@implementation AIIDeviceTokenSwitchRequest
@end

@implementation AIIDeviceTokenSwitchResponse
@end