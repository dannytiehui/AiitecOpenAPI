//
//  AIIRankDetailsPacket.h
//  Quick
//
//  Created by iMac on 14/10/21.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIRankDetailsResponseQuery : AIIQuery

/** 活跃排行名次.例如：1. */
@property (nonatomic, assign) NSUInteger rankActive;
/** 活跃超越多少.例如：100.00 | 69.23. */
@property (nonatomic, assign) float beyondActive;
/** 积分排行名次.例如：2. */
@property (nonatomic, assign) NSUInteger rankPoint;
/** 积分超越多少.例如：88.88 | 69.23. */
@property (nonatomic, assign) float beyondPoint;
/** 推广量排行名次.例如：25555. */
@property (nonatomic, assign) NSUInteger rankReferrer;
/** 推广量超越多少.例如：0.19 | 69.23. */
@property (nonatomic, assign) float beyondReferrer;

@end



@interface AIIRankDetailsRequest : AIIRequest
@end



@interface AIIRankDetailsResponse : AIIResponse

@property (nonatomic, strong) AIIRankDetailsResponseQuery *query;

@end
