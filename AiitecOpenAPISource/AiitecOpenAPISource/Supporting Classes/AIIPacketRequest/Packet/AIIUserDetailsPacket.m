//
//  AIIUserDetailsPacket.m
//  AAClient
//
//  Created by iMac on 13-5-24.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIUserDetailsPacket.h"
//
//@implementation AIIUserDetailsRequestQuery
//@end
//
//

@implementation AIIUserDetailsResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.entity = [[AIIUser alloc] init];
    }
    return self;
}

//#pragma mark - NSObject(NSKeyValueCoding)
//
//- (id)valueForUndefinedKey:(NSString *)key
//{
//    NSLog(@"AIIUserDetailsResponseQuery.valueForUndefinedKey:key = %@", key);
//    
//    id value;
//    if([key isEqualToString:self.entity.key]) {
//        value = [self valueForKey:self.entity.key];
//    }
//    else {
//        value = [super valueForUndefinedKey:key];
//    }
//    return value;
//}
//
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//    NSLog(@"AIIUserDetailsResponseQuery.setValue:%@, forUndefinedKey:%@", key, value);
//
//    if([key isEqualToString:self.entity.key]) {
//        [self.entity setValuesForKeysWithDictionary:value];
//    }
//    else {
//        [super setValue:value forUndefinedKey:key];
//    }
//}
//
//- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
//{
//    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
//    
//    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
//    NSString *k = @"entity";
//    if ([dict objectForKey:k]) {
//        [mutableDictionary setObject:[self.entity dictionaryWithValuesForKeys:self.entity.properties] forKey:@"user"];
//        [mutableDictionary removeObjectForKey:k];
//    }
//    dict = mutableDictionary;
//    
//    return dict;
//}
//
@end


@implementation AIIUserDetailsRequest

//- (NSString *)nameSpace
//{
//    return @"UserDetails";
//}

- (NSString *)packetNickname
{
    return @"查询个人信息";
}

@end


@implementation AIIUserDetailsResponse

@end
