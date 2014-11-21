//
//  AIIOrderCommentListPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIICommentCollection.h"

@interface AIIOrderCommentListResponseQuery : AIIListResponseQuery
@end


@interface AIIOrderCommentListRequest : AIIListRequest
@end


@interface AIIOrderCommentListResponse : AIIListResponse

@property (nonatomic, strong) AIIOrderCommentListResponseQuery *query;

@end
