//
//  AIIQuestion.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/6.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIQuestion.h"

@implementation AIIQuestion

- (id)init
{
    if (self = [super init]) {
        _options = [[AIIItemCollection alloc] init];
        _options.key = @"options";
    }
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:self.options.key]) {
        [self.options setObjectWithArray:value];
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"winners";
    if ([dict objectForKey:k]) {
        self.options.key = @"options";
        self.options.entityKey = @"option";
        self.options.entityProperties = @[@"key", @"value"];
        [mutableDictionary setObject:[self.options arrayWithObject] forKey:self.options.key];
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    
    return dict;
}


@end
