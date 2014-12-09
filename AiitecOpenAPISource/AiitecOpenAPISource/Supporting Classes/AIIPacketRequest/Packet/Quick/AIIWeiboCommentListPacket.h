//
//  AIIWeiboCommentListPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIICommentCollection.h"

@interface AIIWeiboCommentListWhere: AIIWhere

@property (nonatomic, assign) NSUInteger userId1;
@property (nonatomic, assign) NSUInteger userId2;

@end


//@interface AIIWeiboCommentListRequestQuery : AIIListRequestQuery
//@end


@interface AIIWeiboCommentListResponseQuery : AIIListResponseQuery
@end


@interface AIIWeiboCommentListRequest : AIIListRequest
@end


@interface AIIWeiboCommentListResponse : AIIListResponse
@end