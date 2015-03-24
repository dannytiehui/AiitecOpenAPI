//
//  AIIOrder.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIITask.h"

/** 维权状态. */
typedef NS_ENUM(NSUInteger, AIIComplaintsStatus) {
    AIIComplaintsStatusDefault,     //!< 0正常/未确认
    AIIComplaintsStatusFirst,       //!< 1维权中
    AIIComplaintsStatusSecond,      //!< 2已解决
};

@interface AIIOrder : AIIEntity

@property (nonatomic, assign) float amount;//!< 订单总金额
@property (nonatomic, assign) AIITaskStatus status;//!< 订单/任务状态
@property (nonatomic, assign) BOOL commentStatus;//!< 评价状态:0未评价;1已评价;
@property (nonatomic, assign) AIIComplaintsStatus complaintsStatus;//!< 维权状态
@property (nonatomic, assign) NSUInteger code;//!< 快应码

@end
