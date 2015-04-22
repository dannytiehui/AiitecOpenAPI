//
//  AIIPayPacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

/** 交易类型. */
typedef NS_ENUM(NSUInteger, AIITradeType) {
    AIITradeTypeAlipay = 1,             //<! 1支付宝
};

@interface AIIPayRequestQuery : AIIQuery

@property (nonatomic, assign) AIITradeType type;
@property (nonatomic, assign) float money;
/** 交易流水号. */
@property (nonatomic, copy) NSString *transferNo;

@end


@interface AIIPayRequest : AIIRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIPayRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AIIPayResponse : AIIResponse
@end