//
//  AIIPositionUpdatePacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIPositionUpdateRequestQuery : AIIQuery

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

@end


@interface AIIPositionUpdateRequest : AIIRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIPositionUpdateRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AIIPositionUpdateResponse : AIIResponse
@end

