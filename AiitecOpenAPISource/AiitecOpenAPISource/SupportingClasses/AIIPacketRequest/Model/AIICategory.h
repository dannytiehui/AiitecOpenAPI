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

@end

