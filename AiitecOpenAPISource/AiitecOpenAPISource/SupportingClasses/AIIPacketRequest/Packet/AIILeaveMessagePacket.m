//
//  LeaveMessagePacket.m
//  AAClient
//
//  Created by iMac on 13-7-22.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIILeaveMessagePacket.h"

@implementation AIILeaveMessageRequest

- (NSString *)nameSpace
{
    return @"LeaveMessage";
}

- (NSString *)packetNickname
{
    return @"留言";
}

@end



@implementation AIILeaveMessageResponse

- (NSString *)nameSpace
{
    return @"LeaveMessage";
}

@end