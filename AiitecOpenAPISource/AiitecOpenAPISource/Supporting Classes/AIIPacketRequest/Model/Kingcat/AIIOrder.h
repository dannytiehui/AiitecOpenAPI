//
//  AIIOrder.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIGoods.h"
#import "AIIMerchant.h"
#import "AIIUserCollection.h"

/** 订单状态. */
typedef NS_ENUM(NSUInteger, AIIOrderStatus) {
    AIIOrderStatusFirst = 1, //!< 1待发货
    AIIOrderStatusSecond,    //!< 2已发货
    AIIOrderStatusThird,     //!< 3已收货
};

/** 评价状态. */
typedef NS_ENUM(NSUInteger, AIICommentStatus) {
    AIICommentStatusDefault,     //!< 0正常/未确认
    AIICommentStatusFirst,       //!< 1维权中
    AIICommentStatusSecond,      //!< 2已解决
};

/** 维权等级. */
typedef NS_ENUM(NSUInteger, AIICommentStars) {
    AIICommentStarsFirst = 1,   //!< 1一星
    AIICommentStarsSecond,      //!< 2二星
    AIICommentStarsThird,       //!< 3三星
    AIICommentStarsFourth,      //!< 4四星
    AIICommentStarsFifth,       //!< 5五星
};

@interface AIIOrder : AIIEntity

/** 订单编号. */
@property (nonatomic, assign) NSUInteger orderSn;
/** 金猫. */
@property (nonatomic, assign) float goldenCat;
/** 银猫. */
@property (nonatomic, assign) float silverCat;
/** 订单总金额. */
@property (nonatomic, assign) float amount;
/** 订单状态. */
@property (nonatomic, assign) AIIOrderStatus status;
/** 评价状态. */
@property (nonatomic, assign) AIICommentStatus commentStatus;
/** 评价等级. */
@property (nonatomic, assign) AIICommentStars commentStars;
/** 评价内容. */
@property (nonatomic, copy) NSString *commentContent;
/** 消费状态:NO0未消费(默认);YES1已消费. */
@property (nonatomic, assign) BOOL spendingStatus;
/** 中奖状态:0未中奖(默认),1已中奖. */
@property (nonatomic, assign) BOOL winningStatus;
/** 收货地址id. */
@property (nonatomic, assign) NSUInteger contactsId;

/** 商品Id. */
@property (nonatomic, assign) NSUInteger goodsId;
/** 商品数量. */
@property (nonatomic, assign) NSUInteger number;

@property (nonatomic, strong) AIIGoods *goods;
@property (nonatomic, strong) AIIMerchant *merchant;
@property (nonatomic, strong) AIIUserCollection *winners;

#pragma mark - Option
/** 商家id. */
@property (nonatomic, assign) NSUInteger merchantId;

@end
