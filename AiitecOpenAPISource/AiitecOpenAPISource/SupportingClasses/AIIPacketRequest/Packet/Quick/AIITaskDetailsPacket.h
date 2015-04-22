//
//  AIITaskDetailsPacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIDetailsPacket.h"
#import "AIITask.h"

@interface AIITaskDetailsRequestQuery : AIIQuery

/** 经度. */
@property (nonatomic, assign) double longitude;
/** 纬度. */
@property (nonatomic, assign) double latitude;

@end



@interface AIITaskDetailsResponseQuery : AIIEntityQuery
@end



@interface AIITaskDetailsRequest : AIIDetailsRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIITaskDetailsRequestQuery *query;
#pragma clang diagnostic pop

@end



@interface AIITaskDetailsResponse : AIIDetailsResponse
@end

