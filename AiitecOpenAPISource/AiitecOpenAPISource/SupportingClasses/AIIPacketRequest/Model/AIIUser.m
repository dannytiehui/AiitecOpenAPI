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
        _imageCollection = [[AIIImageCollection alloc] init];
        _itemCollection = [[AIIItemCollection alloc] init];
        _labels = [[AIIItemCollection alloc] init];
        _labels.key = @"labels";
        _labels.entityKey = @"label";
    }
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"class"]) {
        self.classes = value;
    }
    else if ([key isEqualToString:self.address.key]) {
        [self.address setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:self.imageCollection.key]) {
        [self.imageCollection setObjectWithArray:value];
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
    
    k = @"classes";
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:self.classes forKey:@"class"];
    }
    [mutableDictionary removeObjectForKey:k];

    k = @"address";
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[self.address dictionaryWithValuesForKeys:self.address.keys] forKey:self.address.key];
    }
    
    k = @"imageCollection";
    if ([dict objectForKey:k]) {
        [mutableDictionary setObject:[self.imageCollection arrayWithObject] forKey:self.imageCollection.key];
    }
    [mutableDictionary removeObjectForKey:k];
    
    k = @"labels";
    if ([dict objectForKey:k]) {
        [mutableDictionary setObject:[self.labels arrayWithObject] forKey:self.labels.key];
    }
    
    k = @"itemCollection";
    if ([dict objectForKey:k]) {
        [mutableDictionary setObject:[self.itemCollection arrayWithObject] forKey:self.itemCollection.key];
    }
    [mutableDictionary removeObjectForKey:k];
      
    dict = mutableDictionary;
    
    return dict;
}

@end