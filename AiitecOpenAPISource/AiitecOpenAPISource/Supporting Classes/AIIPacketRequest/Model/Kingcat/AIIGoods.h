//
//  AIIGoods.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIMerchant.h"
#import "AIIImageCollection.h"

/** 商品审核状态. */
typedef NS_ENUM(NSUInteger, AIIGoodsAuditStatus) {
    AIIGoodsAuditStatusWaitingForReview,    //!< 0待审核
    AIIGoodsAuditStatusThrough,             //!< 1审核通过（默认）
    AIIGoodsAuditStatusReject               //!< 2审核不通过
};

@interface AIIGoods : AIIEntity

/** 金猫. */
@property (nonatomic, assign) float goldenCat;
/** 银猫. */
@property (nonatomic, assign) float silverCat;
/** 商品数量. */
@property (nonatomic, assign) NSUInteger number;
/** 已出售数量. */
@property (nonatomic, assign) NSUInteger saleNumber;
/** 图像路径. */
@property (nonatomic, copy) NSString *imagePath;
/** 开始时间,秒杀商品专用. */
@property (nonatomic, copy) NSString *startTime;
/** 截止时间,秒杀商品专用. */
@property (nonatomic, copy) NSString *deadline;
/** 开奖时间,抽奖商品专用. */
@property (nonatomic, copy) NSString *drawDate;
/** 中奖名额,抽奖商品专用. */
@property (nonatomic, assign) NSUInteger winningQuota;
/** 状态:YES1上架;NO2下架. */
@property (nonatomic, assign) BOOL status;
/** 分类id. */
@property (nonatomic, assign) NSUInteger categoryId;
/** 审核拒绝原因. */
@property (nonatomic, copy) NSString *reason;
/** 距离.单位:米. */
@property (nonatomic, assign) float distance;

/** 商家图像数组. */
@property (nonatomic, strong) AIIImageCollection *imageCollection;
/** 商家对象. */
@property (nonatomic, strong) AIIMerchant *merchant;

@end
