//
//  AIIEvent.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"

/** 活动类型 */
typedef NS_ENUM(NSUInteger, AIIEntityType) {
    AIIEntityTypeDefault,
    AIIEntityTypeFirst      //!< 1寻宝活动
};

@interface AIIEvent : AIIEntity

@property (nonatomic, assign) AIIEntityType type;
/** 参与人数上限. */
@property (nonatomic,assign) NSUInteger number;
/** 积分奖励. */
@property (nonatomic, assign) NSUInteger point;
/** 快应币奖励. */
@property (nonatomic, assign) float amount;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
//@property (nonatomic, assign) CLLocationCoordinate2D coordinate;//!< 坐标结构体，纬度、经度.
/** 开始时间: 2014-08-27 12:00:00. */
@property (nonatomic, copy) NSString *startTime;
/** 结束时间: 2014-08-27 18:00:00. */
@property (nonatomic, copy) NSString *endTime;
/** 学校id. */
@property (nonatomic, assign) NSUInteger schoolId;

@end
