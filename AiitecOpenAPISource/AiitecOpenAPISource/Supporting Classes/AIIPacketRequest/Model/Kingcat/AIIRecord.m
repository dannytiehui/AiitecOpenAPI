//
//  AIIRecord.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/4.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRecord.h"

@implementation AIIRecord

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"income"]) {
        self.income = [value isEqualToString:@"1"] ? YES : NO;
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"income";
    if ([keys containsObject:k]) {
        NSString *income = self.income ? @"1" : @"2";
        [mutableDictionary setObject:income forKey:k];
    }
    
    dict = mutableDictionary;
    
    return dict;
}


@end
