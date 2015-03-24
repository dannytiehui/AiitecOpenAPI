//
//  AIIFetchRankPacket.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-22.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIFetchRankPacket.h"

@implementation AIIFetchRankRequestQuery
@end



@implementation AIIFetchRankResponseQuery
@end



@implementation AIIFetchRankRequest

#pragma mark - super

- (Class)queryClass
{
    return [AIIFetchRankRequestQuery class];
}

@end



@implementation AIIFetchRankResponse

#pragma mark - super

- (Class)queryClass
{
    return [AIIFetchRankResponseQuery class];
}

@end

