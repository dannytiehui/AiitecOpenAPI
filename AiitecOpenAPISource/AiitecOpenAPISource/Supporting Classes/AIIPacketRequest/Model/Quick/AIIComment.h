//
//  AIIComment.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/8.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"
#import "AIIUser.h"

@interface AIIComment : AIIEntity

@property (nonatomic, copy) NSString *content;
/** 统计赞的次数. */
@property (nonatomic, assign) NSUInteger statPraise;

@property (nonatomic, strong) AIIUser *user;

#pragma mark - option
/** 发回复人id. */
@property (nonatomic, assign) NSUInteger userId;
/** 回复目标id，不传就只是评论任务. */
@property (nonatomic, assign) NSUInteger userIdTo;

@end
