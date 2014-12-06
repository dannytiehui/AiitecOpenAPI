//
//  AIIRemindBadgeNumberPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIRemindBadgeNumberRequestQuery : AIIQuery
@end


@interface AIIRemindBadgeNumberResponseQuery : AIIQuery
@end


@interface AIIRemindBadgeNumberRequest : AIIRequest

@property (nonatomic, strong) AIIRemindBadgeNumberRequestQuery *query;

@end


@interface AIIRemindBadgeNumberResponse : AIIResponse
@end
