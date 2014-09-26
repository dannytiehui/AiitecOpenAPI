//
//  RegionTable.h
//  AAClient
//
//  Created by iMac on 13-7-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "Table.h"

@class AIIRegionCollection;

@interface RegionTable : Table

- (AIIRegionCollection *)queryWithParentId:(NSUInteger)parentId;

/** 
 根据identifier查询当前区域及全部父区域信息
 @param identifier 区域id
 @return RegionCollection
 */
- (AIIRegionCollection *)queryWithIdentifier:(NSUInteger)identifier;

/**
 根据name查询当前区域及全部父区域信息
 @param name 区域名称
 @return RegionCollection
 */
- (AIIRegionCollection *)queryWithName:(NSString *)name;

@end
