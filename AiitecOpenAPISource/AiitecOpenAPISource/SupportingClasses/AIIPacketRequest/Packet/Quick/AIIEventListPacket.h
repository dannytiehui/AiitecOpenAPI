//
//  AIIEventListPacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIIEventCollection.h"

@interface AIIEventListWhere: AIIWhere

/** 经度. */
@property (nonatomic, assign) double longitude;
/** 纬度. */
@property (nonatomic, assign) double latitude;

@end


@interface AIIEventListResponseQuery : AIIListResponseQuery
@end


@interface AIIEventListRequest : AIIListRequest
@end


@interface AIIEventListResponse : AIIListResponse
@end