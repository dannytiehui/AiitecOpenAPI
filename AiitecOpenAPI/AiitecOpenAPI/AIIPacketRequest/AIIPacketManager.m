//
//  AIIPacketManager.m
//  AII
//
//  Created by iMac on 13-11-18.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIPacketManager.h"

@implementation AIIPacketManager

+ (AIIPacketManager *)defaultManager
{
    static AIIPacketManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AIIPacketManager alloc] init];
        instance.sessionResponseNotNil = YES;
    });
    return instance;
}

+ (void)beginWithPacket:(PacketNameSpace)nameSpaces
{
     [AIICacheManager beginWithPacket:PacketNameSpaceNotificationList | PacketNameSpaceAddressbookList | PacketNameSpaceLandscapeList | PacketNameSpaceMotorcadeList | PacketNameSpaceVehicleList | PacketNameSpaceLineList | PacketNameSpaceSchedulingList | PacketNameSpaceOrderList | PacketNameSpaceFileList];
}

#pragma - mark PacketConnectionDelegate

- (void)packetConnectionFinished:(AIIPacketConnection *)connection
{
    if (self.delegate) {
        [self.delegate packetManagerFinished:self];
    }
}

@end
