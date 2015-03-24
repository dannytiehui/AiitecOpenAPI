//
//  AIIRegionCollection.h
//  AAClient
//
//  Created by iMac on 13-7-1.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIModelCollection.h"
#import "AIIRegion.h"

@interface AIIRegionCollection : AIIModelCollection

- (AIIRegionCollection *)recursive;

- (AIIRegionCollection *)filterWithParentId:(NSUInteger)pId;

/**
 * @brief 按拼音排序.
 *
 * @return 返回按拼音排序后的AIIRegionCollection集合对象.
 */
- (AIIRegionCollection *)sortedCollectionUsingPinyin;

@end
