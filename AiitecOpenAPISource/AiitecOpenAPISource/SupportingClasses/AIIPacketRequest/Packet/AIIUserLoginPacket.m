//
//  AIIUserLoginPacket.m
//  AAClient
//
//  Created by iMac on 13-5-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIUserLoginPacket.h"

@implementation AIIUserLoginRequestQuery

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    AIIUserLoginRequestQuery *query = [super copyWithZone:zone];
    query.name = [_name copy];
    query.password = [_password copy];
    return query;
}

#pragma mark - NSMutableCopying

- (id)mutableCopyWithZone:(NSZone *)zone
{
    AIIUserLoginRequestQuery *query = [super mutableCopyWithZone:zone];
    query.name = [_name mutableCopy];
    query.password = [_password mutableCopy];
    return query;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.name forKey:@"UserLoginRequestQueryName"];
    [aCoder encodeObject:self.password forKey:@"UserLoginRequestQueryPassword"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    self.name = [aDecoder decodeObjectForKey:@"UserLoginRequestQueryName"];
    self.password = [aDecoder decodeObjectForKey:@"UserLoginRequestQueryPassword"];
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"password";
    if (![[dict objectForKey:k] isKindOfClass:[NSNull class]]) {
        [mutableDictionary setObject:[AIIUtility md5:[dict objectForKey:k]] forKey:k];
    }
    
    dict = mutableDictionary;
    
    return dict;
}

@end


@implementation AIIUserLoginResponseQuery
@end


@implementation AIIUserLoginRequest

//- (NSString *)packetNickname
//{
//    return @"登录";
//}

@end


@implementation AIIUserLoginResponse
@end
