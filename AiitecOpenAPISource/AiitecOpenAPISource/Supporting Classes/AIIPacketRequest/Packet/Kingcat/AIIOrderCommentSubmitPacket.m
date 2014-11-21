//
//  AIIOrderCommentSubmitPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIOrderCommentSubmitPacket.h"

@implementation AIIOrderCommentSubmitRequestQuery

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:self.comment.key]) {
        [self.comment setValuesForKeysWithDictionary:value];
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"comment";
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[self.comment dictionaryWithValuesForKeys:self.comment.keys] forKey:self.comment.key];
    }
    dict = mutableDictionary;
    return dict;
}

@end


@implementation AIIOrderCommentSubmitRequest
@end


@implementation AIIOrderCommentSubmitResponse
@end
