//
//  AIIRegionCollection.m
//  AAClient
//
//  Created by iMac on 13-7-1.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIRegionCollection.h"

@interface AIIRegionCollection ()

- (void)recursive:(AIIRegionCollection *)collection parentId:(NSUInteger)pId;

@end

@implementation AIIRegionCollection

//- (Class)objectClass
//{
//    return [AIIRegion class];
//}

//- (NSString *)key
//{
//    return @"regionInfo";
//}

- (AIIRegionCollection *)recursive;
{
    AIIRegionCollection *rc = [[AIIRegionCollection alloc] init];
    [self recursive:rc parentId:1];
    return rc;
}

- (void)recursive:(AIIRegionCollection *)collection parentId:(NSUInteger)pId
{
    for (AIIRegion *entity in self) {
        if (entity.parentId == pId) {
            [collection addObject:entity];
            entity.children = [[AIIRegionCollection alloc] init];
            [self recursive:entity.children parentId:entity.identifier];
        }
    }
}

- (AIIRegionCollection *)filterWithParentId:(NSUInteger)pId
{
    AIIRegionCollection *regionCollection = [[AIIRegionCollection alloc] init];
    for (AIIRegion *entity in self) {
        if (entity.parentId == pId) {
            [regionCollection addObject:entity];
        }
    }
    return regionCollection;
}

- (AIIRegionCollection *)sortedCollectionUsingPinyin
{
    AIIRegionCollection *regionCollection = [[AIIRegionCollection alloc] init];
    
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    for (AIIRegion *item in self) {
        [mutableArray addObject:item];
    }
    
    NSArray *tempArray = [mutableArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [((AIIRegion *)obj1).pinyin localizedCompare:((AIIRegion *)obj2).pinyin];
    }];
    
    for (id item in tempArray) {
        [regionCollection addObject:item];
    }
    return regionCollection;
}

@end
