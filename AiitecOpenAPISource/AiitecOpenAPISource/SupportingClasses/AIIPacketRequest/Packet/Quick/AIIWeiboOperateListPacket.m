//
//  AIIWeiboOperateListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIWeiboOperateListPacket.h"

@implementation AIIWeiboOperateListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIOperateCollection alloc] init];
    }
    return self;
}

@end


@implementation AIIWeiboOperateListRequest
@end


@implementation AIIWeiboOperateListResponse
@end
