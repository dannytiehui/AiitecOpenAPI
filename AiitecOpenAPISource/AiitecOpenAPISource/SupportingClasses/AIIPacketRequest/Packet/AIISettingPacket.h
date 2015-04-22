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

#pragma mark - 全市通

/** 商城订单积分兑换率. */
@property (nonatomic, assign) float exchangeShop;
/** 购买积分兑换率. */
@property (nonatomic, assign) float exchangeBuy;

@property (nonatomic, strong) AIIItemCollection *itemCollection;

@end


@interface AIISettingRequest : AIIRequest
@end


@interface AIISettingResponse : AIIResponse

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIISettingResponseQuery *query;
#pragma clang diagnostic pop

@end
