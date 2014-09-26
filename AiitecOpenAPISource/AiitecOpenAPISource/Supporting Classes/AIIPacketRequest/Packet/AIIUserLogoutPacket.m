//
//  AIIUserLogoutPacket.m
//  AAClient
//
//  Created by iMac on 13-5-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIUserLogoutPacket.h"

@implementation AIIUserLogoutRequest

- (NSString *)nameSpace
{
    return @"UserLogout";
}

- (NSString *)packetNickname
{
    return @"登出";
}

@end



@implementation AIIUserLogoutResponse

- (NSString *)nameSpace
{
    return @"UserLogout";
}

@end
