//
//  AIIPointExchangeSubmitPacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIEntityPacket.h"

@interface AIIPointExchangeSubmitRequestQuery : AIIQuery

@property (nonatomic, assign) float money;
@property (nonatomic, copy) NSString *account;

@end



@interface AIIPointExchangeSubmitRequest : AIIRequest

@property (nonatomic, strong) AIIPointExchangeSubmitRequestQuery *query;

@end



@interface AIIPointExchangeSubmitResponse : AIIEntityResponse
@end
