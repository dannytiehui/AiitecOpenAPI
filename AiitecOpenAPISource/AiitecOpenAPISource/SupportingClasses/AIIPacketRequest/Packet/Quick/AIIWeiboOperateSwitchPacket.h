//
//  AIIWeiboOperateSwitchPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/6.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIWeiboOperateSwitchRequestQuery : AIIQuery

@property (nonatomic, assign) NSUInteger type;
@property (nonatomic, assign) BOOL open;

@end


@interface AIIWeiboOperateSwitchRequest : AIIRequest

@property (nonatomic, strong) AIIWeiboOperateSwitchRequestQuery *query;

@end


@interface AIIWeiboOperateSwitchResponse : AIIResponse
@end
