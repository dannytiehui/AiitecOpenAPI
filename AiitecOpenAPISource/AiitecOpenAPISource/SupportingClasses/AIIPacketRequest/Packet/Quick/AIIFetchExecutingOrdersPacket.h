//
//  AIIFetchExecutingOrdersPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIFetchExecutingOrdersResponseQuery : AIIQuery

@property (nonatomic, assign) BOOL executingOrders;

@end


@interface AIIFetchExecutingOrdersRequest : AIIRequest
@end


@interface AIIFetchExecutingOrdersResponse : AIIResponse

@property (nonatomic, strong) AIIFetchExecutingOrdersResponseQuery *query;

@end
