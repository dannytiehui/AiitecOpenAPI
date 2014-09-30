//
//  AIIUser.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-15.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "AIIUser.h"

@implementation AIIUser

- (id)init
{
    if (self = [super init]) {
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
            self.channel = AIIChannelPhone;
        }
        else {
            self.channel = AIIChannelPad;
        }
        
        _address = [[AIIAddress alloc] init];
        _itemCollection = [[AIIItemCollection alloc] init];
    }
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:self.address.key]) {
        [self.address setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:self.itemCollection.key]) {
        [self.itemCollection setObjectWithArray:value];
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
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
    NSString *k = @"password";
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[AIIUtility md5:self.password] forKey:k];
    }

    k = @"address";
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[self.address dictionaryWithValuesForKeys:self.address.keys] forKey:self.address.key];
    }
    
    k = @"itemCollection";
    if ([dict objectForKey:k] && [dict objectForKey:k]) {
        [mutableDictionary setObject:[self.itemCollection arrayWithObject] forKey:self.itemCollection.key];
    }
    [mutableDictionary removeObjectForKey:k];
      
    dict = mutableDictionary;
    
    return dict;
}

@end
