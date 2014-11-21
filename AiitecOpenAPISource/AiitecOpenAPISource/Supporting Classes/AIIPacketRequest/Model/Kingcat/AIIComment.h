//
//  AIIComment.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/6.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIUser.h"
#import "AIIOrder.h"

@interface AIIComment : AIIEntity

/** 评价等级. */
@property (nonatomic, assign) AIICommentStars stars;
/** 评价内容. */
@property (nonatomic, copy) NSString *content;

/** 评价人. */
@property (nonatomic, strong) AIIUser *user;

@end
