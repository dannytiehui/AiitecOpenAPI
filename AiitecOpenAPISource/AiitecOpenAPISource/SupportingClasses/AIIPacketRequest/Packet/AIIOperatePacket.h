//
//  AIIOperatePacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIOperateRequestQuery : AIIQuery
@end


@interface AIIOperateRequest : AIIRequest

@property (nonatomic, strong) AIIOperateRequestQuery *query;

@end


@interface AIIOperateResponse : AIIResponse
@end
