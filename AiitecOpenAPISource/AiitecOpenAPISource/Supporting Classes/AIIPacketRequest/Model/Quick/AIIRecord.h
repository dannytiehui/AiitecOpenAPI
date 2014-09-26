//
//  AIIRecord.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-12.
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

@interface AIIRecord : AIIEntity

@property (nonatomic, assign) double value;
/** YES收入, NO支出. */
@property (nonatomic, assign) BOOL income;
@property (nonatomic, assign) AIIRecordStatus status;


@end
