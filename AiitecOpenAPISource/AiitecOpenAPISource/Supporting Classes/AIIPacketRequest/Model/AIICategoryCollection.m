//
//  AIICategoryCollection.m
//  AII
//
//  Created by iMac on 13-11-15.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIICategoryCollection.h"

@implementation AIICategoryCollection

- (Class)objectClass
{
    return [AIICategory class];
}

- (AIICategoryCollection *)recursive;
{
    AIICategoryCollection *rc = [[AIICategoryCollection alloc] init];
    [self recursive:rc parentId:0];
    return rc;
}

- (void)recursive:(AIICategoryCollection *)collection parentId:(NSUInteger)pId
{
    for (AIICategory *entity in self) {
        if (entity.parentId == pId) {
            [collection addObject:entity];
            entity.children = [[AIICategoryCollection alloc] init];
            [self recursive:entity.children parentId:entity.identifier];
        }
    }
}

@end
