//
//  AIIUserBadgeNumberPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/4.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIDetailsPacket.h"

@interface AIIUserBadgeNumberResponseQuery : AIIEntityQuery

@property (nonatomic, assign) NSUInteger badge;

@end


@interface AIIUserBadgeNumberRequest : AIIDetailsRequest
@end


@interface AIIUserBadgeNumberResponse : AIIDetailsResponse
@end
