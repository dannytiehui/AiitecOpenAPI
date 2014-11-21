//
//  AIIMerchant.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIUser.h"

@interface AIIMerchant : AIIUser

/** 移动电话(可以随便改,不需要短信验证). */
@property (nonatomic, copy) NSString *phone;
/** 商家名称. */
@property (nonatomic, copy) NSString *companyName;
/** 分类Id. */
@property (nonatomic, assign) NSUInteger categoryId;
/** 商家收入. */
@property (nonatomic, assign) float incomeGoldenCat;
/** 返利所得（金猫）. */
@property (nonatomic, assign) float rebatesGoldenCat;
/** 返利所得（银猫）. */
@property (nonatomic, assign) float rebatesSilverCat;
/** 商家星级. */
@property (nonatomic, assign) NSUInteger stars;
/** 评价总数. */
@property (nonatomic, assign) NSUInteger evaluationNumber;
/** 距离. */
@property (nonatomic, assign) float distance;
/** 营业额. */
@property (nonatomic, assign) float turnover;
/** 行业. */
@property (nonatomic, copy) NSString *industry;

@end
