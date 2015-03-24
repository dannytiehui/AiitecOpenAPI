//
//  AIIRemindListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRemindListPacket.h"

@implementation AIIRemindListWhere
@end


@implementation AIIRemindListRequestQuery
@end


@implementation AIIRemindListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIRemindCollection alloc] init];
    }
    return self;
}

@end


@implementation AIIRemindListRequest
@end


@implementation AIIRemindListResponse
@end
