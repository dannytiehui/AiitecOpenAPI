//
//  AIIAdListPacket.m
//  AII
//
//  Created by iMac on 14-1-21.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIAdListPacket.h"

@implementation AIIAdListRequestQuery
@end



@implementation AIIAdListRequest

- (Class)queryClass
{
    return [AIIAdListRequestQuery class];
}

//- (NSString *)packetNickname
//{
//    return @"广告列表";
//}

//- (CacheSupporting)cacheSupporting
//{
//    return CacheSupportingFull;
//}

@end


@implementation AIIAdListResponse
@end
