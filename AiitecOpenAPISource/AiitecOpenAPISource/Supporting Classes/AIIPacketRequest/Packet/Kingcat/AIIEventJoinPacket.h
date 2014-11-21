//
//  AIIEventJoinPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIEventJoinRequestQuery : AIIQuery

/** 银猫. */
@property (nonatomic, assign) float silverCat;

@end


@interface AIIEventJoinRequest : AIIRequest

@property (nonatomic, strong) AIIEventJoinRequestQuery *query;

@end


@interface AIIEventJoinResponse : AIIResponse
@end