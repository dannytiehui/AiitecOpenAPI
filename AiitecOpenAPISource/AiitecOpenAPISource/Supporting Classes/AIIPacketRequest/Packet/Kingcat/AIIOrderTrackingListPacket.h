//
//  AIIOrderTrackingListPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIIOrderCollection.h"

@interface AIIOrderTrackingListResponseQuery : AIIListResponseQuery
@end


@interface AIIOrderTrackingListRequest : AIIListRequest
@end


@interface AIIOrderTrackingListResponse : AIIListResponse

@property (nonatomic, strong) AIIOrderTrackingListResponseQuery *query;

@end