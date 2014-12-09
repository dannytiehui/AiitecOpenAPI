//
//  AIITaskOperateListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIITaskOperateListPacket.h"

@implementation AIITaskOperateListWhere
@end


@implementation AIITaskOperateListRequestQuery
@end


@implementation AIITaskOperateListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIOperateCollection alloc] init];
    }
    return self;
}

@end


@implementation AIITaskOperateListRequest
@end


@implementation AIITaskOperateListResponse
@end
