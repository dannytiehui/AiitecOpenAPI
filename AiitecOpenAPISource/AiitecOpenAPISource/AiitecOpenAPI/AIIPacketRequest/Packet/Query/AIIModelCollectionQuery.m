//
//  AIIModelCollectionQuery.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-11.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIModelCollectionQuery.h"

@implementation AIIModelCollectionQuery

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    AIIModelCollectionQuery *modelCollectionQuery = [super copyWithZone:zone];
    modelCollectionQuery.modelCollection = [_modelCollection copyWithZone:zone];
    return modelCollectionQuery;
}

#pragma mark - NSMutableCopying

- (id)mutableCopyWithZone:(NSZone *)zone
{
    AIIModelCollectionQuery *modelCollectionQuery = [super mutableCopyWithZone:zone];
    modelCollectionQuery.modelCollection = [_modelCollection mutableCopyWithZone:zone];
    return modelCollectionQuery;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.modelCollection forKey:@"ModelCollectionQueryModelCollection"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    self.modelCollection = [aDecoder decodeObjectForKey:@"ModelCollectionQueryModelCollection"];
    return self;
}

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
