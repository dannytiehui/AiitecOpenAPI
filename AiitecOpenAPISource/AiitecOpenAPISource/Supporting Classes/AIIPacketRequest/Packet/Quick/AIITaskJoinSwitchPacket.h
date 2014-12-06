//
//  AIITaskJoinSwitchPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIITaskJoinSwitchRequestQuery : AIIQuery

@property (nonatomic, assign) BOOL open;

@end


@interface AIITaskJoinSwitchRequest : AIIRequest

@property (nonatomic, strong) AIITaskJoinSwitchRequestQuery *query;

@end


@interface AIITaskJoinSwitchResponse : AIIResponse
@end
