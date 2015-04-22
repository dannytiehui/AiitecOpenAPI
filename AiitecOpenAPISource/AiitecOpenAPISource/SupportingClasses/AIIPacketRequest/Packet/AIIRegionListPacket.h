//
//  AIIRegionListPacket.h
//  AAClient
//
//  Created by iMac on 13-7-1.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIIRegionCollection.h"

@interface AIIRegionListRequestQuery : AIIListRequestQuery

@property (nonatomic, assign) NSUInteger parentId;
@property (nonatomic, copy) NSString *name;

@end


@interface AIIRegionListResponseQuery : AIIListResponseQuery
@end


@interface AIIRegionListRequest : AIIListRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIRegionListRequestQuery *query;
#pragma clang diagnostic pop


@end


@interface AIIRegionListResponse : AIIListResponse
@end
