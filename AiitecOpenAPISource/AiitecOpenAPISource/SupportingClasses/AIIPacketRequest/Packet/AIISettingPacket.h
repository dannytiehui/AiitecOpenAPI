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

#pragma mark - 快卡
/** 分享获得的水晶. */
@property (nonatomic, assign) NSUInteger shareAwards;
/** 神奇时钟的价格. */
@property (nonatomic, assign) NSUInteger clockPrice;
/** 初始血量最大值. */
@property (nonatomic, assign) NSUInteger maxHP;
/** 用户完成订单对推荐业务员奖励的水晶数量. */
@property (nonatomic, assign) NSUInteger refereeCrystalAwards;
/** 邀请用户对业务员的经验奖励. */
@property (nonatomic, assign) NSUInteger refereeExpAwards;

//@property (nonatomic, strong) AIIItemCollection *itemCollection;

@end


@interface AIISettingRequest : AIIRequest
@end


@interface AIISettingResponse : AIIResponse

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIISettingResponseQuery *query;
#pragma clang diagnostic pop

@end
