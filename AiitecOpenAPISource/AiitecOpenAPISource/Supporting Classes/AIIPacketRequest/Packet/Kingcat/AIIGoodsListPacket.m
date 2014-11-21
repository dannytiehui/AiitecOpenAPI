//
//  AIIGoodsListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIGoodsListPacket.h"

@implementation AIIGoodsListWhere


#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"status"]) {
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
    NSString *k = @"status";
    if ([keys containsObject:k]) {
        NSString *status = self.status ? @"1" : @"2";
        [mutableDictionary setObject:status forKey:k];
    }
    
    dict = mutableDictionary;
    return dict;
}

@end



@implementation AIIGoodsListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIGoodsCollection alloc] init];
    }
    return self;
}

@end



@implementation AIIGoodsListRequest
@end



@implementation AIIGoodsListResponse
@end
