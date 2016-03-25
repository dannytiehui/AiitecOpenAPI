//
//  AIIDetailsPacket.m
//  AAClient
//
//  Created by iMac on 13-7-10.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIDetailsPacket.h"

@implementation AIIDetailsRequest

- (AIIJSONCacheLevel)jsonCacheLevel
{
    return AIIJSONCacheLevelThird;
}

@end


@implementation AIIDetailsResponse

#pragma mark - super

- (Class)queryClass
{
    /// 子类实现
    return [AIIEntityQuery class];
}

@end
