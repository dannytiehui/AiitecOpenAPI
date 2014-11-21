//
//  AIISettingPacket.m
//  AII
//
//  Created by iMac on 14-2-18.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIISettingPacket.h"

@implementation AIISettingResponseQuery

- (instancetype)init
{
    if (self = [super init]) {
        _levels = [[AIIItemCollection alloc] init];
        _levels.key = @"levels";
        _levels.entityKey = @"level";
    }
    return self;
}


#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:self.levels.key]) {
        [self.levels setObjectWithArray:value];
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"levels";
    if ([dict objectForKey:k]) {
        [mutableDictionary setObject:[self.levels arrayWithObject] forKey:self.levels.key];
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    
    return dict;
}


@end


@implementation AIISettingRequest
@end


@implementation AIISettingResponse

- (Class)queryClass
{
    return [AIISettingResponseQuery class];
}

@end
