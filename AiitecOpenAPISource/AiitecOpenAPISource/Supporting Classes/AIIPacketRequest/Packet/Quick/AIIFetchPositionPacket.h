//
//  AIIFetchPositionPacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIFetchPositionResponseQuery : AIIQuery

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

@end



@interface AIIFetchPositionRequest : AIIRequest
@end



@interface AIIFetchPositionResponse : AIIResponse

@property (nonatomic, strong) AIIFetchPositionResponseQuery *query;

@end
