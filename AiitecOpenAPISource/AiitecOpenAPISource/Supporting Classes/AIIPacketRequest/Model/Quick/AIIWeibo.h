//
//  AIIWeibo.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"
#import "AIIUser.h"
#import "AIIImageCollection.h"

@interface AIIWeibo : AIIEntity

@property (nonatomic, copy) NSString *content;
/** 转发统计. */
@property (nonatomic, assign) NSUInteger statRepost;
/** 评论统计. */
@property (nonatomic, assign) NSUInteger statComment;
/** 赞统计. */
@property (nonatomic, assign) NSUInteger statPraise;
/** 踩统计. */
@property (nonatomic, assign) NSUInteger statDevalue;
/** 0未赞;1已赞. */
@property (nonatomic, assign) BOOL praiseStatus;
/** 0未踩;1已踩. */
@property (nonatomic, assign) BOOL devalueStatua;

@property (nonatomic, strong) AIIWeibo *repostWeibo;
@property (nonatomic, strong) AIIUser *user;
@property (nonatomic, strong) AIIImageCollection *imageCollection;

#pragma mark - option
/** 回复目标id，不传就只是评论任务. */
@property (nonatomic, assign) NSUInteger userIdTo;

@end
