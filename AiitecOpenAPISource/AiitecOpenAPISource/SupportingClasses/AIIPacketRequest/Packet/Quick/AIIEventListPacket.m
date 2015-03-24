//
//  AIIEventListPacket.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEventListPacket.h"

@implementation AIIEventListWhere
@end


@implementation AIIEventListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIEventCollection alloc] init];
    }
    return self;
}

@end


@implementation AIIEventListRequest
@end


@implementation AIIEventListResponse
@end
