//
//  AIIPointDetailsPacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-24.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIPointDetailsResponseQuery : AIIQuery

/** 排行. */
@property (nonatomic, assign) NSUInteger rank;
/** 超越人数百分比. */
@property (nonatomic, assign) float beyond;

@end


@interface AIIPointDetailsRequest : AIIRequest

@end



@interface AIIPointDetailsResponse : AIIResponse


@property (nonatomic, strong) AIIPointDetailsResponseQuery *query;

@end
