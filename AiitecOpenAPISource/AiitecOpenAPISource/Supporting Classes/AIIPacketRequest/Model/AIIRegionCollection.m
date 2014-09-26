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

- (Class)objectClass
{
    return [AIIRegion class];
}

- (NSString *)key
{
    return @"regionInfo";
}

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

//    NSUInteger count = [self count];
//    for (NSUInteger i = 0; i < count; i ++) {
//        AIIRegion *entity = [self objectAtIndex:i];
//        if (entity.parentId == pId) {
//            [collection addObject:entity];
//            entity.children = [[RegionCollection alloc] init];
//            [self recursive:entity.children parentId:entity.identifier];
//        }
//    }
}

@end
