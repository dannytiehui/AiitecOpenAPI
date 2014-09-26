//
//  AIIArticle.m
//  AII
//
//  Created by iMac on 14-2-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIArticle.h"

@implementation AIIArticle

- (id)init
{
    if (self = [super init]) {
        _category = [[AIICategory alloc] init];
        _imageCollection = [[AIIImageCollection alloc] init];
    }
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    NSLog(@"AIIUser.setValue:%@ forKey:%@", value, key);
    
    if ([key isEqualToString:self.category.key]) {
        [self.category setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:self.imageCollection.key]) {
        [self.imageCollection setObjectWithArray:value];
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"AIIUser.valueForUndefinedKey:key = %@", key);
    
    id value;
    if([key isEqualToString:self.imageCollection.key]) {
        value = self.imageCollection;
    }
    else {
        value = [super valueForUndefinedKey:key];
    }
    return value;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"setValue:%@ forUndefinedKey%@", value, key);
    
    if([@[@"delete"] containsObject:key]) {
        
    }
    else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"category";
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[self.category dictionaryWithValuesForKeys:self.category.keys] forKey:self.category.key];
    }
    
    k = @"imageCollection";
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[self.imageCollection arrayWithObject] forKey:self.imageCollection.key];
        
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    
    return dict;
}

@end
