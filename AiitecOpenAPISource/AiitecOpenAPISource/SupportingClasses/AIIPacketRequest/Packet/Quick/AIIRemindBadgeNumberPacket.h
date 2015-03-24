//
//  AIIRemindBadgeNumberPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIRemindBadgeNumberRequestQuery : AIIQuery
@end


@interface AIIRemindBadgeNumberResponseQuery : AIIQuery

/** 新评论. */
@property (nonatomic, assign) NSUInteger statNewComment;
/** 新赞. */
@property (nonatomic, assign) NSUInteger statNewPraise;
/** 新任务提醒. */
@property (nonatomic, assign) NSUInteger statTaskRemind;
/** 新活动提醒. */
@property (nonatomic, assign) NSUInteger statEventRemind;
/** 新通知. */
@property (nonatomic, assign) NSUInteger statNewNotice;

@end


@interface AIIRemindBadgeNumberRequest : AIIRequest

@property (nonatomic, strong) AIIRemindBadgeNumberRequestQuery *query;

@end


@interface AIIRemindBadgeNumberResponse : AIIResponse
@end
