//
//  AIICollectionPacket.m
//  AII
//
//  Created by iMac on 14-3-27.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIICollectionPacket.h"

@implementation AIICollectionRequest

#pragma mark - super

- (Class)queryClass
{
    /// 子类实现
    return [AIIModelCollectionQuery class];
}

@end



@implementation AIICollectionResponse
@end
