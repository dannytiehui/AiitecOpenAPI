//
//  AIIEntityPacket.m
//  AAClient
//
//  Created by iMac on 13-7-23.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntityPacket.h"

@implementation AIIEntityRequest

#pragma mark - super

- (Class)queryClass
{
    /// 子类实现
    return [AIIEntityQuery class];
}

@end


@implementation AIIEntityResponse
@end
