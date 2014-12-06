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

/** 任务类型. */
typedef NS_ENUM(NSUInteger, AIITaskType) {
    AIITaskTypeFirst = 1,   //!< 1任务
    AIITaskTypeSecond,      //!< 2活动
    
};

/** 任务状态. */
typedef NS_ENUM(NSUInteger, AIITaskStatus) {
    AIITaskStatusFirst = 1,   //!< 1正常/已发布
    AIITaskStatusSecond,      //!< 2已被抢单/待执行/有人参与
    AIITaskStatusThird,       //!< 3执行中/确认执行
    AIITaskStatusFourth,      //!< 4已完成/待评价
    AIITaskStatusFifth,       //!< 5已取消/关闭任务
    AIITaskStatusTenth = 10,  //!< 10虚假信息
};

@class AIIOrder;

@interface AIITask : AIIEntity

@property (nonatomic, assign) AIITaskType type;
/** 活动编号.*/
@property (nonatomic, assign) NSUInteger number;
/** 人均悬赏.*/
@property (nonatomic, assign) float reward;
/** 悬赏金额追加额度.*/
@property (nonatomic, assign) float rewardPlus;
/** 名额.*/
@property (nonatomic, assign) NSUInteger limit;
/** 任务状态.*/
@property (nonatomic, assign) AIITaskStatus status;
/** 描述.*/
@property (nonatomic, copy) NSString *content;
/** 截止时间.*/
@property (nonatomic, copy) NSString *deadline;
/** 报名统计.*/
@property (nonatomic, assign) NSUInteger statJoin;
/** 评论统计.*/
@property (nonatomic, assign) NSUInteger statComment;
/** 赞统计.*/
@property (nonatomic, assign) NSUInteger statPraise;
/** 我的参加状态：0未参加；1已参加；.*/
@property (nonatomic, assign) BOOL joinStatus;
/** 我的赞状态：0未赞；1已赞；.*/
@property (nonatomic, assign) BOOL praiseStatus;
/** 距离.*/
@property (nonatomic, assign) float distance;


/** .*/
@property (nonatomic, assign) NSUInteger image;//!< 第一张图片
/** .*/
@property (nonatomic, assign) BOOL unfreeze;//!< 悬赏金解冻状态：0冻结（默认）;1解冻;
/** .*/
@property (nonatomic, assign) NSUInteger userId;//!< 用户id
/** .*/
@property (nonatomic, assign) NSUInteger labelId;//!< 标签id
/** .*/
@property (nonatomic, assign) NSUInteger regionId;//!< 区域id
/** .*/
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
//@property (nonatomic, assign) CLLocationCoordinate2D coordinate;//!< 坐标结构体，纬度、经度.
/** .*/
@property (nonatomic, copy) NSString *street;//!< 位置描述


@property (nonatomic, strong) AIIUser *user;
@property (nonatomic, strong) AIIAddress *address;
@property (nonatomic, strong) AIIOrder *order;
@property (nonatomic, strong) AIIImageCollection *imageCollection;

@end
