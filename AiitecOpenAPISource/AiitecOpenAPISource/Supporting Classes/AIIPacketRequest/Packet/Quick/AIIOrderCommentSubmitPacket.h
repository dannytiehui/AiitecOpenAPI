//
//  AIIOrderCommentSubmitPacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIOrderCommentSubmitRequestQuery : AIIQuery

@property (nonatomic, copy) NSString *content;

@end



@interface AIIOrderCommentSubmitRequest : AIIRequest

@property (nonatomic, strong) AIIOrderCommentSubmitRequestQuery *query;

@end



@interface AIIOrderCommentSubmitResponse : AIIResponse
@end
