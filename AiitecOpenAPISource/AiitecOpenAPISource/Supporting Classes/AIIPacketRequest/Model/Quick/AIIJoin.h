//
//  AIIJoin.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIUser.h"

/** 任务类型. */
typedef NS_ENUM(NSUInteger, AIIMarkStatus) {
    AIIMarkStatusFirst = 1,   //!< 1已完成（发布者）
    AIIMarkStatusSecond,      //!< 2已完成（参与者）
    AIIMarkStatusThird,       //!< 3(1+2)
};

@interface AIIJoin : AIIEntity

@property (nonatomic, assign) BOOL selected;
@property (nonatomic, assign) BOOL sign;
@property (nonatomic, assign) AIIMarkStatus markStatus;

@property (nonatomic, strong) AIIUser *user;

@end
