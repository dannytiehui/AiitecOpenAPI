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

@property (nonatomic, strong) AIIAdListRequestQuery *query;

@end



@interface AIIAdListResponse : AIIListResponse
@end
