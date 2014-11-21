//
//  AIIOrderCommentSubmitPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntityPacket.h"
#import "AIIComment.h"

@interface AIIOrderCommentSubmitRequestQuery : AIIEntityQuery

@property (nonatomic, strong) AIIComment *comment;

@end


@interface AIIOrderCommentSubmitRequest : AIIEntityRequest

@property (nonatomic, strong) AIIOrderCommentSubmitRequestQuery *query;

@end


@interface AIIOrderCommentSubmitResponse : AIIEntityResponse
@end