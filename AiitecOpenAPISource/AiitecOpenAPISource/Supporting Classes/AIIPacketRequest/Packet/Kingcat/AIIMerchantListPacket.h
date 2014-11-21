//
//  AIIMerchantListPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIIMerchantCollection.h"

@interface AIIMerchantListWhere: AIIWhere

/** 分类id. */
@property (nonatomic, assign) NSUInteger categoryId;
/** 地区id. */
@property (nonatomic, assign) NSUInteger regionId;
/** 商家id. */
@property (nonatomic, assign) NSUInteger merchantId;
/** 经度. */
@property (nonatomic, assign) double longitude;
/** 纬度. */
@property (nonatomic, assign) double latitude;

@end


@interface AIIMerchantListResponseQuery : AIIListResponseQuery
@end


@interface AIIMerchantListRequest : AIIListRequest
@end


@interface AIIMerchantListResponse : AIIListResponse
@end