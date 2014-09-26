//
//  AIICategory.h
//  AII
//
//  Created by iMac on 13-11-15.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"

@class AIICategoryCollection;

@interface AIICategory : AIIEntity

@property (nonatomic, assign) NSUInteger parentId;
@property (nonatomic, strong) AIICategoryCollection *children;
/** FM频道. */
@property (nonatomic, copy) NSString *channel;
/** mms地址. */
@property (nonatomic, copy) NSString *mmsLink;
/** 收藏统计数量. */
@property (nonatomic, assign) NSUInteger regionId;

@end

