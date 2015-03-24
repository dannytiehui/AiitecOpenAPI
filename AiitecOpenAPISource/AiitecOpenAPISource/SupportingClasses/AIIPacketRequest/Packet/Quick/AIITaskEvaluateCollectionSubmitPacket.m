//
//  AIITaskEvaluateCollectionSubmitPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/6.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIITaskEvaluateCollectionSubmitPacket.h"

@implementation AIITaskEvaluateCollectionSubmitRequestQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIEvaluateCollection alloc] init];
    }
    return self;
}

@end


@implementation AIITaskEvaluateCollectionSubmitRequest
@end


@implementation AIITaskEvaluateCollectionSubmitResponse
@end
