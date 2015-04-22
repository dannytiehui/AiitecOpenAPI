//
//  AIIAdListPacket.h
//  AII
//
//  Created by iMac on 14-1-21.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIIAdCollection.h"

@interface AIIAdListRequestQuery : AIIListRequestQuery

/** 广告位id. */
@property (nonatomic, assign) NSUInteger positionId;

@end


@interface AIIAdListResponseQuery : AIIListResponseQuery
@end


@interface AIIAdListRequest : AIIListRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIAdListRequestQuery *query;
#pragma clang diagnostic pop

@end



@interface AIIAdListResponse : AIIListResponse
@end
