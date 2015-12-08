//
//  AIIItem.m
//  AII
//
//  Created by iMac on 13-11-15.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIItem.h"

@implementation AIIItem

//#pragma mark - NSCoding
//
//- (void)encodeWithCoder:(NSCoder *)aCoder
//{
//    [super encodeWithCoder:aCoder];
//    [aCoder encodeObject:self.key forKey:@"ItemKey"];
//    [aCoder encodeObject:self.value forKey:@"ItemValue"];
//}
//
//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super initWithCoder:aDecoder];
//    self.key = [aDecoder decodeObjectForKey:@"ItemKey"];
//    self.value = [aDecoder decodeObjectForKey:@"ItemValue"];
//    return self;
//}


#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"isCar"]) {
        self.isCar = [value isEqualToString:@"1"] ? YES : NO;
    }
    else if ([key isEqualToString:@"isHouse"]) {
        self.isHouse = [value isEqualToString:@"1"] ? YES : NO;
    }
    else if ([key isEqualToString:@"status"]) {
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
    NSString *k = @"isCar";
    if ([keys containsObject:k]) {
        NSString *isCar = self.isCar ? @"1" : @"2";
        [mutableDictionary setObject:isCar forKey:k];
    }
    
    k = @"isHouse";
    if ([keys containsObject:k]) {
        NSString *isHouse = self.isHouse ? @"1" : @"2";
        [mutableDictionary setObject:isHouse forKey:k];
    }
    
    k = @"status";
    if ([keys containsObject:k]) {
        NSString *status = self.status ? @"1" : @"2";
        [mutableDictionary setObject:status forKey:k];
    }
    
    dict = mutableDictionary;
    return dict;
}



@end
