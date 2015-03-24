//
//  AIITaskEvaluateListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIITaskEvaluateListPacket.h"

@implementation AIITaskEvaluateListRequestQuery
@end


@implementation AIITaskEvaluateListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIEvaluateCollection alloc] init];
    }
    return self;
}

@end


@implementation AIITaskEvaluateListRequest
@end


@implementation AIITaskEvaluateListResponse
@end
