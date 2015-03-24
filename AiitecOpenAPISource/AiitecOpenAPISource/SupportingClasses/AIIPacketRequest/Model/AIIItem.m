//
//  AIIItem.m
//  AII
//
//  Created by iMac on 13-11-15.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIItem.h"

@implementation AIIItem

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.key forKey:@"ItemKey"];
    [aCoder encodeObject:self.value forKey:@"ItemValue"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    self.key = [aDecoder decodeObjectForKey:@"ItemKey"];
    self.value = [aDecoder decodeObjectForKey:@"ItemValue"];
    return self;
}

@end
