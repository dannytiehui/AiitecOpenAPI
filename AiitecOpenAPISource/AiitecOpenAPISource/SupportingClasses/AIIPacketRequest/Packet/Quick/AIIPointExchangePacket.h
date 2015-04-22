//
//  AIIPointExchangePacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIEntityPacket.h"

@interface AIIPointExchangeRequestQuery : AIIQuery

@property (nonatomic, assign) float money;
@property (nonatomic, copy) NSString *account;
/** 账户姓名. */
@property (nonatomic, copy) NSString *name;

@end


@interface AIIPointExchangeRequest : AIIRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIPointExchangeRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AIIPointExchangeResponse : AIIEntityResponse
@end
