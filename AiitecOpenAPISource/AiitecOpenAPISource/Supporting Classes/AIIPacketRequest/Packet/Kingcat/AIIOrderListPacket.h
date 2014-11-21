//
//  AIIOrderListPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIIOrderCollection.h"

@interface AIIOrderListResponseQuery : AIIListResponseQuery
@end


@interface AIIOrderListRequest : AIIListRequest
@end


@interface AIIOrderListResponse : AIIListResponse

@property (nonatomic, strong) AIIOrderListResponseQuery *query;

@end
