//
//  AIIUserDetailsPacket.m
//  AAClient
//
//  Created by iMac on 13-5-24.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIUserDetailsPacket.h"

@implementation AIIUserDetailsResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.entity = [[AIIUser alloc] init];
        _merchant = [[AIIUser alloc] init];
        _merchant.key = @"merchant";
    }
    return self;
}

@end


@implementation AIIUserDetailsRequest

- (NSString *)packetNickname
{
    return @"查询个人信息";
}

@end


@implementation AIIUserDetailsResponse

@end
