//
//  AIITaskJoinListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIITaskJoinListPacket.h"

@implementation AIITaskJoinListWhere
@end


//@implementation AIITaskJoinListRequestQuery
//@end


@implementation AIITaskJoinListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIJoinCollection alloc] init];
    }
    return self;
}

@end


@implementation AIITaskJoinListRequest
@end


@implementation AIITaskJoinListResponse
@end
