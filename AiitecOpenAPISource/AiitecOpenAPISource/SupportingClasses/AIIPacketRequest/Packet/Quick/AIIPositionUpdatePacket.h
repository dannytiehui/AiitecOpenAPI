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

@property (nonatomic, strong) AIIPositionUpdateRequestQuery *query;

@end


@interface AIIPositionUpdateResponse : AIIResponse
@end

