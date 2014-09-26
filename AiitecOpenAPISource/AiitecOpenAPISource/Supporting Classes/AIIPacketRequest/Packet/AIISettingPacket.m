//
//  AIISettingPacket.m
//  AII
//
//  Created by iMac on 14-2-18.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIISettingPacket.h"

@implementation AIISettingResponseQuery
@end



@implementation AIISettingRequest
@end


@implementation AIISettingResponse

- (Class)queryClass
{
    return [AIISettingResponseQuery class];
}

@end
