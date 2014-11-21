//
//  AIIUserRegisterPacket.h
//  AAClient
//
//  Created by iMac on 13-5-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntityPacket.h"
#import "AIIUser.h"

@interface AIIUserRegisterRequestQuery : AIIEntityQuery

@property (nonatomic, assign) NSUInteger smscodeId;

@end


@interface AIIUserRegisterRequest : AIIEntityRequest

@property (nonatomic, strong) AIIUserRegisterRequestQuery *query;

@end


@interface AIIUserRegisterResponse : AIIEntityResponse
@end