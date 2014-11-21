//
//  AIIOrderCommentListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIOrderCommentListPacket.h"

@implementation AIIOrderCommentListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIICommentCollection alloc] init];
    }
    return self;
}

@end


@implementation AIIOrderCommentListRequest
@end


@implementation AIIOrderCommentListResponse
@end