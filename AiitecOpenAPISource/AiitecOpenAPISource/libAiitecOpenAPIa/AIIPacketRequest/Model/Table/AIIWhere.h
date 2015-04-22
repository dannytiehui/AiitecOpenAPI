//
//  AIIWhere.h
//  AII
//
//  Created by iMac on 13-12-13.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"

typedef NS_ENUM(NSUInteger, AIIWhereStatus) {
    WhereStatusDefault,     //!< 0全部（默认）
    WhereStatusFirst,       //!< 1
    WhereStatusSecond,      //!<
    WhereStatusThird,       //!< 
    WhereStatusFourth,      //!<
    WhereStatusFifth,       //!<
    WhereStatusSixth,       //!<
};

/// AIIWhere.
@interface AIIWhere : AIIEntity

@property (nonatomic, copy) NSString *ids;
@property (nonatomic, copy) NSString *searchKey;

@end
