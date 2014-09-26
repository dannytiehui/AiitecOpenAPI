//
//  AddressbookListPacket.m
//  AAClient
//
//  Created by iMac on 13-7-22.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AddressbookListPacket.h"

@implementation AddressbookListRequest

- (NSString *)nameSpace
{
    return @"AddressbookList";
}

- (NSString *)packetNickname
{
    return @"通讯录列表";
}

- (AIICacheSupporting)cacheSupporting
{
    return AIICacheSupportingFull;
}

@end


@implementation AddressbookListResponse
@end
