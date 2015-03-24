//
//  AIITaskLabelListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/9.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIITaskLabelListPacket.h"

@implementation AIITaskLabelListWhere
@end


@implementation AIITaskLabelListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIItemCollection alloc] init];
        self.modelCollection.key = @"labels";
        self.modelCollection.entityKey = @"label";
    }
    return self;
}

@end


@implementation AIITaskLabelListRequest
@end


@implementation AIITaskLabelListResponse
@end