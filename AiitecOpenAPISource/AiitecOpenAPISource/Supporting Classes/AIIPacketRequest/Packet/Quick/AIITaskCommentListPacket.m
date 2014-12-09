//
//  AIITaskCommentListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIITaskCommentListPacket.h"

@implementation AIITaskCommentListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIICommentCollection alloc] init];
    }
    return self;
}

@end


@implementation AIITaskCommentListRequest
@end


@implementation AIITaskCommentListResponse
@end
