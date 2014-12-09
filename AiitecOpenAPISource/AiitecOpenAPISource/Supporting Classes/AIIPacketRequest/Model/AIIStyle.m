//
//  AIIStyle.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/9.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIStyle.h"

@implementation AIIStyle

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"sound"]) {
        self.sound = [[value stringValue] isEqualToString:@"1"] ? YES : NO;
    }
    else if ([key isEqualToString:@"vibrate"]) {
        self.vibrate = [[value stringValue] isEqualToString:@"1"] ? YES : NO;
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"sound";
    if ([keys containsObject:k]) {
        NSString *sound = self.sound ? @"1" : @"2";
        [mutableDictionary setObject:sound forKey:k];
    }
    
    k = @"vibrate";
    if ([keys containsObject:k]) {
        NSString *vibrate = self.vibrate ? @"1" : @"2";
        [mutableDictionary setObject:vibrate forKey:k];
    }
    
    dict = mutableDictionary;
    return dict;
}

@end
