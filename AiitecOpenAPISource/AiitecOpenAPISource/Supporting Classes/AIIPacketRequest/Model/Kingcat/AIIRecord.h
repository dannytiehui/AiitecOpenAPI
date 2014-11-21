//
//  AIIRecord.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/4.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"

/** 状态. */
typedef NS_ENUM(NSUInteger, AIIRecordStatus) {
    AIIRecordStatusDefault,
    AIIRecordStatusFirst,
    AIIRecordStatusSecond,
    AIIRecordStatusThird
};

/** 类型. */
typedef NS_ENUM(NSUInteger, AIIRecordType) {
    AIIRecordTypeFirst = 1, //!< 1充值+
    AIIRecordTypeSecond,    //!< 2兑换+
    AIIRecordTypeThird,     //!< 3订单+/-
    AIIRecordTypeFourth,    //!< 4提现-
    AIIRecordTypeFifth      //!< 5活动+
};

@interface AIIRecord : AIIEntity

/** 金猫. */
@property (nonatomic, assign) float goldenCat;
/** 银猫. */
@property (nonatomic, assign) float silverCat;
/** YES收入, NO支出. */
@property (nonatomic, assign) BOOL income;
@property (nonatomic, assign) AIIRecordStatus status;
@property (nonatomic, assign) AIIRecordType type;
/** 用户姓名. */
@property (nonatomic, copy) NSString *username;

@end
