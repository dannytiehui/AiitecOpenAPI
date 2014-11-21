//
//  AIIOrderSubmitPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntityPacket.h"
#import "AIIOrder.h"

@interface AIIOrderSubmitRequestQuery : AIIQuery

/** 商品数量. */
@property (nonatomic, assign) NSUInteger number;
/** 收货地址id. */
@property (nonatomic, assign) NSUInteger contactsId;

@end


@interface AIIOrderSubmitRequest : AIIRequest

@property (nonatomic, strong) AIIOrderSubmitRequestQuery *query;

@end


@interface AIIOrderSubmitResponse : AIIEntityResponse
@end