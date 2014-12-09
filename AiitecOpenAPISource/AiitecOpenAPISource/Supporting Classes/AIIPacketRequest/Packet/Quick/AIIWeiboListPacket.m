//
//  AIIWeiboListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIWeiboListPacket.h"

@implementation AIIWeiboListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIWeiboCollection alloc] init];
    }
    return self;
}

@end


@implementation AIIWeiboListRequest
@end


@implementation AIIWeiboListResponse
@end
