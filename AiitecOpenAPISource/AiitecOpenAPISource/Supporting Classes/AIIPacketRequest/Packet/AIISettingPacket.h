//
//  AIISettingPacket.h
//  AII
//
//  Created by iMac on 14-2-18.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

//@interface AIISettingRequest : AIIQuery
//@end



@interface AIISettingResponseQuery : AIIQuery

/** 注册时是否开启手机验证:YES开启验证;NO不验证. */
@property (nonatomic, assign) BOOL registerValidate;

/** 已许愿人数. */
@property (nonatomic, assign) NSUInteger statWish;
/** 资料完整. */
@property (nonatomic, copy) NSString *point0;
/** 学习“快应人教程”. */
@property (nonatomic, copy) NSString *point1;
/** 认证. */
@property (nonatomic, copy) NSString *point2;
/** 评价APP. */
@property (nonatomic, copy) NSString *point3;
/** 填写推荐人. */
@property (nonatomic, copy) NSString *point4;
/** 签到. */
@property (nonatomic, copy) NSString *point5;
/** 分享APP. */
@property (nonatomic, copy) NSString *point6;
/** 炫耀排行榜. */
@property (nonatomic, copy) NSString *point7;
/** 发任务. */
@property (nonatomic, copy) NSString *point8;
/** 接任务. */
@property (nonatomic, copy) NSString *point9;
/** 完成任务. */
@property (nonatomic, copy) NSString *point10;
/** 完成务分享. */
@property (nonatomic, copy) NSString *point11;
/** 邀请好友. */
@property (nonatomic, copy) NSString *point12;
/** . */
@property (nonatomic, copy) NSString *point13;
/** 成功邀请用户. */
@property (nonatomic, copy) NSString *point14;
/** 注册送的快应币数量. */
@property (nonatomic, copy) NSString *KYB0;
/** 推荐用户完成第一个订单送的快应币数量. */
@property (nonatomic, copy) NSString *KYB1;

@end



@interface AIISettingRequest : AIIRequest
@end



@interface AIISettingResponse : AIIResponse

@property (nonatomic, strong) AIISettingResponseQuery *query;

@end
