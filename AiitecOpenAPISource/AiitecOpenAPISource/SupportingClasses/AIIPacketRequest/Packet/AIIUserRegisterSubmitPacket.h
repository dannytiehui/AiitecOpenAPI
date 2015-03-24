//
//  AIIUserRegisterSubmitPacket.h
//  AAClient
//
//  Created by iMac on 13-5-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntityPacket.h"
#import "AIIUser.h"

@interface AIIUserRegisterSubmitRequestQuery : AIIEntityQuery

@property (nonatomic, assign) NSUInteger smscodeId;

@end


@interface AIIUserRegisterSubmitRequest : AIIEntityRequest

@property (nonatomic, strong) AIIUserRegisterSubmitRequestQuery *query;

@end


@interface AIIUserRegisterSubmitResponse : AIIEntityResponse
@end