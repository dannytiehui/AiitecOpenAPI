//
//  AIIFetchRankPacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-22.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIFetchRankRequestQuery : AIIQuery

@property (nonatomic, assign) float reward;//!< 悬赏金额
@property (nonatomic, assign) NSUInteger labelId;//!< 标签id

@end



@interface AIIFetchRankResponseQuery : AIIQuery

@property (nonatomic, assign) NSUInteger rank;//!< 排名第几

@end



@interface AIIFetchRankRequest : AIIRequest

@property (nonatomic, strong) AIIFetchRankRequestQuery *query;

@end



@interface AIIFetchRankResponse : AIIResponse

@property (nonatomic, strong) AIIFetchRankResponseQuery *query;

@end

