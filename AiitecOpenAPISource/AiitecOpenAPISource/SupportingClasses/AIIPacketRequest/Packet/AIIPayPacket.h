//
//  AIIPayPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 15/03/04.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

/** 交易类型. */
typedef NS_ENUM(NSUInteger, AIIPayType) {
    AIIPayTypeAlipay = 1,             //<! 1支付宝
    AIIPayTypeWechat,                 //<! 2微信
};

@interface AIIPayRequestQuery : AIIQuery

@property (nonatomic, assign) AIIPayType type;
@property (nonatomic, assign) float amount;
/** 交易流水号. */
@property (nonatomic, copy) NSString *transferNo;

@end


@interface AIIPayResponseQuery : AIIQuery

/**
 微信支付.商户服务器返回数据.参考:【微信支付】APP支付(IOS)接口文档V1.7.pdf
 格式如下:
 {
 "retcode": " 0",
 "retmsg": "ok",
 "appid": "wx7bac48b024ec1dff",
 "noncestr": "5ce54b25d1b85be35d5a828be8a4cd4f",
 "package": "Sign=WXpay",
 "partnerid": "1236281601",
 "prepayid": "120100000015040919b6274fd924f60d",
 "sign": "2ac3abc19911eba5ece127672ce6cfa93d53dd9c",
 "timestamp": "1428553134"
 }
 */
@property (nonatomic, strong) NSDictionary *wxpay;

@end


@interface AIIPayRequest : AIIRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIPayRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AIIPayResponse : AIIResponse

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIPayResponseQuery *query;
#pragma clang diagnostic pop

@end