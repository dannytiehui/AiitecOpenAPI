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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIITaskJoinSwitchRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AIITaskJoinSwitchResponse : AIIResponse
@end
