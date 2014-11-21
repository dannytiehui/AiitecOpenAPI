//
//  AIIGoodsListPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIIGoodsCollection.h"

@interface AIIGoodsListWhere: AIIWhere

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
/** 审核状态. */
@property (nonatomic, assign) AIIGoodsAuditStatus auditStatus;
/** 状态:YES1上架;NO2下架. */
@property (nonatomic, assign) BOOL status;

@end


@interface AIIGoodsListResponseQuery : AIIListResponseQuery
@end


@interface AIIGoodsListRequest : AIIListRequest
@end


@interface AIIGoodsListResponse : AIIListResponse
@end
