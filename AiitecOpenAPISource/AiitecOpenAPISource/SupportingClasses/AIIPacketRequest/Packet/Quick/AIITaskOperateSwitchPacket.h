//
//  AIITaskOperateSwitchPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/6.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIITaskOperateSwitchRequestQuery : AIIQuery

@property (nonatomic, assign) NSUInteger type;
@property (nonatomic, assign) BOOL open;

@end


@interface AIITaskOperateSwitchRequest : AIIRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIITaskOperateSwitchRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AIITaskOperateSwitchResponse : AIIResponse
@end
