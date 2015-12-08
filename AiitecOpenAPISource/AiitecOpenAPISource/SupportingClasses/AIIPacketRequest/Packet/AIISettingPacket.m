//
//  AIISettingPacket.m
//  AII
//
//  Created by iMac on 14-2-18.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIISettingPacket.h"

@implementation AIISettingResponseQuery

- (id)init
{
    if (self = [super init]) {
//        _itemCollection = [[AIIItemCollection alloc] init];
//        _itemCollection.key = @"topPoints";
//        _itemCollection.entityKey = @"topPoint";
    }
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

//- (void)setValue:(id)value forKey:(NSString *)key
//{
//    if ([key isEqualToString:self.itemCollection.key]) {
//        [self.itemCollection setObjectWithArray:value];
//    }
//    else {
//        [super setValue:value forKey:key];
//    }
//}
//
//- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
//{
//    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
//    
//    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
//    NSString *k = @"itemCollection";
//    if ([dict objectForKey:k]) {
//        [mutableDictionary setObject:[self.itemCollection arrayWithObject] forKey:self.itemCollection.key];
//    }
//    [mutableDictionary removeObjectForKey:k];
//    
//    dict = mutableDictionary;
//    
//    return dict;
//}

@end


@implementation AIISettingRequest
@end


@implementation AIISettingResponse

- (Class)queryClass
{
    return [AIISettingResponseQuery class];
}

@end
