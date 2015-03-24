//
//  AIIWeiboDetailsPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIWeiboDetailsPacket.h"

@implementation AIIWeiboDetailsResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.entity = [[AIIWeibo alloc] init];
        _repostWeibo = [[AIIWeibo alloc] init];
    }
    return self;
}

@end


@implementation AIIWeiboDetailsRequest

- (NSString *)packetNickname
{
    return @"";
}

@end


@implementation AIIWeiboDetailsResponse

@end
