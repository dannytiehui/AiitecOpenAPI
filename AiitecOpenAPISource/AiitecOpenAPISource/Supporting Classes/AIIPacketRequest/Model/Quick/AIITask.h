//
//  AIITask.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIUser.h"
//#import "AIIOrder.h"
#import "AIIImageCollection.h"

/** 任务状态. */
typedef NS_ENUM(NSUInteger, AIITaskStatus) {
    AIITaskStatusFirst = 1,       //!< 1正常/未确认
    AIITaskStatusSecond,      //!< 2已被抢单/已接单
    AIITaskStatusThird,       //!< 3执行中
    AIITaskStatusFourth,      //!< 4已完成
    AIITaskStatusFifth,       //!< 5已取消
    AIITaskStatusSixth,       //!< 6虚假信息
};

@class AIIOrder;

@interface AIITask : AIIEntity

@property (nonatomic, assign) float reward;//!< 悬赏金额
@property (nonatomic, assign) float rewardPlus;//!< 悬赏金额追加额度
@property (nonatomic, assign) NSUInteger image;//!< 第一张图片
@property (nonatomic, copy) NSString *deadline;//!< 截止时间
@property (nonatomic, assign) AIITaskStatus status;//!< 任务状态
@property (nonatomic, assign) BOOL unfreeze;//!< 悬赏金解冻状态：0冻结（默认）;1解冻;
@property (nonatomic, assign) NSUInteger userId;//!< 用户id
@property (nonatomic, assign) NSUInteger labelId;//!< 标签id
@property (nonatomic, assign) NSUInteger regionId;//!< 区域id
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
//@property (nonatomic, assign) CLLocationCoordinate2D coordinate;//!< 坐标结构体，纬度、经度.
@property (nonatomic, copy) NSString *street;//!< 位置描述
@property (nonatomic, assign) float distance;//!< 距离

@property (nonatomic, strong) AIIUser *user;
@property (nonatomic, strong) AIIOrder *order;
@property (nonatomic, strong) AIIImageCollection *imageCollection;

@end
