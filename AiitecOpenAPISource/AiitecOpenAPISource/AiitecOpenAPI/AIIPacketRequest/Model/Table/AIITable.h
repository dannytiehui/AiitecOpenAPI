//
//  AIITable.h
//  AII
//
//  Created by iMac on 14-1-21.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"
#import "AIIWhere.h"

typedef NS_ENUM(NSUInteger, AIIOrderBy) {
    AIIOrderByDefault,     //!< 0全部（默认）
    AIIOrderByFirst,       //!< 1
    AIIOrderBySecond,      //!<
    AIIOrderByThird,       //!<
    AIIOrderByFourth,      //!<
    AIIOrderByFifth,       //!<
    AIIOrderBySixth,       //!<
};

/// AIITable 
@interface AIITable : AIIEntity

@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, assign) NSUInteger limit;
@property (nonatomic, assign) AIIOrderBy orderBy;
@property (nonatomic, assign) AIIOrderType orderType;
@property (nonatomic, strong) AIIWhere *where;

@end
