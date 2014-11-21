//
//  AIIRegionListPacket.m
//  AAClient
//
//  Created by iMac on 13-7-1.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIRegionListPacket.h"

@implementation AIIRegionListRequestQuery
@end


@implementation AIIRegionListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIRegionCollection alloc] init];
    }
    return self;
}

@end


@implementation AIIRegionListRequest

- (NSString *)packetNickname
{
    return @"省市区列表";
}

- (AIICacheSupporting)cacheSupporting
{
    return AIICacheSupportingFull;
}

@end


@implementation AIIRegionListResponse
@end
