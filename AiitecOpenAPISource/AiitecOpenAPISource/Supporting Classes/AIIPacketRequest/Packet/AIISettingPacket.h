//
//  AIISettingPacket.h
//  AII
//
//  Created by iMac on 14-2-18.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"
#import "AIIItemCollection.h"

@interface AIISettingResponseQuery : AIIQuery

/** 注册时是否开启手机验证:YES开启验证;NO不验证. */
@property (nonatomic, assign) BOOL registerValidate;

/** 摇一摇次数. */
@property (nonatomic, assign) NSUInteger shakeCount;
/** 淘积分概率,单位（%）. */
@property (nonatomic, assign) float amoyIntegral;
/** 银猫兑换金猫比例,单位（%）. */
@property (nonatomic, assign) float exchangeRatio;
/** 淘银猫范围最小值. */
@property (nonatomic, assign) float amoySilverCatMinimum;
/** 淘银猫范围最大值. */
@property (nonatomic, assign) float amoySilverCatMaximum;

/** 等级. */
@property (nonatomic, strong) AIIItemCollection *levels;

@end


@interface AIISettingRequest : AIIRequest
@end


@interface AIISettingResponse : AIIResponse

@property (nonatomic, strong) AIISettingResponseQuery *query;

@end
