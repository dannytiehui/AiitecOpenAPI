//
//  AIIPaySubmitPacket.h
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

@interface AIIPaySubmitRequestQuery : AIIQuery

@property (nonatomic, assign) AIITradeType type;
@property (nonatomic, assign) float money;
@property (nonatomic, copy) NSString *transferNo;//!< 交易流水号

@end



@interface AIIPaySubmitRequest : AIIRequest

@property (nonatomic, strong) AIIPaySubmitRequestQuery *query;

@end



@interface AIIPaySubmitResponse : AIIResponse

@end