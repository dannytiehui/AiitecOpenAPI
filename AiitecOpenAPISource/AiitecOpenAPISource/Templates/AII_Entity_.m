//
//  AII_Entity_.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AII_Entity_.h"

@implementation AII_Entity_

- (id)init
{
    if (self = [super init]) {
        _entity = [[AIIEntity alloc] init];
        _modelCollection = [[AIIModelCollection alloc] init];
    }
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"b"]) {
        self.b = [value isEqualToString:@"1"] ? YES : NO;
    }
    else if ([key isEqualToString:self.entity.key]) {
        [self.entity setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:self.modelCollection.key]) {
        [self.modelCollection setObjectWithArray:value];
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
    NSString *k = @"b";
    if ([keys containsObject:k]) {
        NSString *b = self.b ? @"1" : @"2";
        [mutableDictionary setObject:b forKey:k];
    }
    
    k = @"entity";
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[self.entity dictionaryWithValuesForKeys:self.entity.keys] forKey:self.entity.key];
    }
    
    k = @"modelCollection";
    if ([dict objectForKey:k]) {
        [mutableDictionary setObject:[self.modelCollection arrayWithObject] forKey:self.modelCollection.key];
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    return dict;
}

@end
