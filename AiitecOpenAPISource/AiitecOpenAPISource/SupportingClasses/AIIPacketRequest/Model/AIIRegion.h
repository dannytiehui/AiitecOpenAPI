//
//  AIIRegion.h
//  AAClient
//
//  Created by iMac on 13-7-1.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"

@class AIIRegionCollection;

@interface AIIRegion : AIIEntity

@property (nonatomic, assign) NSUInteger parentId;
@property (nonatomic, copy) NSString *pinyin;
@property (nonatomic, strong) AIIRegionCollection *children;

@end
