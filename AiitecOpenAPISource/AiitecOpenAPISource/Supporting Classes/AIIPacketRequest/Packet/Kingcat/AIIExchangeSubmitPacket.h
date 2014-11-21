//
//  AIIExchangeSubmitPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

typedef NS_ENUM(NSUInteger, AIIExchangeSubmitRequestQueryAction) {
    AIIExchangeSubmitRequestQueryActionEighth        = 8,
    AIIExchangeSubmitRequestQueryActionThirteenth    = 13
};

/** 维权等级. */
typedef NS_ENUM(NSUInteger, AIIWithdrawalsType) {
    AIIWithdrawalsTypeFirst = 0,   //!< 1收入提现
    AIIWithdrawalsTypeSecond,      //!< 2余额提现
    AIIWithdrawalsTypeThird,       //!< 3返利提现
};


@interface AIIExchangeSubmitRequestQuery : AIIJSONModel <ValueToDictionary>

@property (nonatomic, assign) AIIExchangeSubmitRequestQueryAction action;
/** 金猫. */
@property (nonatomic, assign) float goldenCat;
@property (nonatomic, assign) AIIWithdrawalsType withdrawalsType;

@end


@interface AIIExchangeSubmitRequest : AIIRequest

@property (nonatomic, strong) AIIExchangeSubmitRequestQuery *query;

@end


@interface AIIExchangeSubmitResponse : AIIResponse
@end