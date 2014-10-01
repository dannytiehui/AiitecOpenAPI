//
//  AIIModelCollectionQuery.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-11.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIModelCollectionQuery.h"

@implementation AIIModelCollectionQuery

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:self.modelCollection.key]) {
        [self.modelCollection setObjectWithArray:value];
    }
    else {
        [super setValue:value forKey:key];
    }
}

//- (void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//    if([key isEqualToString:self.modelCollection.key]) {
//        [self.modelCollection setObjectWithArray:value];
//    }
//    else {
//        [super setValue:value forUndefinedKey:key];
//    }
//}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"modelCollection";
    if ([[dict objectForKey:k] isKindOfClass:[AIIModelCollection class]]) {
        [mutableDictionary setObject:[self.modelCollection arrayWithObject] forKey:self.modelCollection.key];
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    
    return dict;
}

@end
