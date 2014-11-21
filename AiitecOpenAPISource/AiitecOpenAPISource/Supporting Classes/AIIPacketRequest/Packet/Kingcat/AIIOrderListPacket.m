//
//  AIIOrderListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIOrderListPacket.h"

@implementation AIIOrderListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIOrderCollection alloc] init];
    }
    return self;
}

@end


@implementation AIIOrderListRequest
@end


@implementation AIIOrderListResponse
@end