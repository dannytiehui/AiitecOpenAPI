//
//  AIIRankListPacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-12.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIIUserCollection.h"

@interface AIIRankListRequestQuery : AIIListRequestQuery

@property (nonatomic, assign) NSUInteger schoolId;

@end


@interface AIIRankListResponseQuery : AIIListResponseQuery
@end


@interface AIIRankListRequest : AIIListRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIRankListRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AIIRankListResponse : AIIListResponse
@end
