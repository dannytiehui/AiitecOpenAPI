//
//  AIITaskJoinListPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIIJoinCollection.h"

@interface AIITaskJoinListWhere: AIIWhere

/** 0全部（默认）;1已选定的用户. */
@property (nonatomic, assign) BOOL selected;

@end


//@interface AIITaskJoinListRequestQuery : AIIListRequestQuery
//@end


@interface AIITaskJoinListResponseQuery : AIIListResponseQuery
@end


@interface AIITaskJoinListRequest : AIIListRequest
@end


@interface AIITaskJoinListResponse : AIIListResponse
@end