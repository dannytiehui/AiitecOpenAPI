//
//  AIIUserLoginPacket.m
//  AAClient
//
//  Created by iMac on 13-5-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIUserLoginPacket.h"

@implementation AIIUserLoginRequestQuery

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
