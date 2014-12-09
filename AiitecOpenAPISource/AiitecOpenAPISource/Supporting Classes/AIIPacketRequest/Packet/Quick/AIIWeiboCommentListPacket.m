//
//  AIIWeiboCommentListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIWeiboCommentListPacket.h"

@implementation AIIWeiboCommentListWhere
@end


//@implementation AIIWeiboCommentListRequestQuery
//@end


@implementation AIIWeiboCommentListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIICommentCollection alloc] init];
    }
    return self;
}

@end


@implementation AIIWeiboCommentListRequest
@end


@implementation AIIWeiboCommentListResponse
@end
