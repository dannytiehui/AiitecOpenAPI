//
//  AIIFetchPositionPacket.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIFetchPositionPacket.h"

@implementation AIIFetchPositionResponseQuery
@end



@implementation AIIFetchPositionRequest
@end



@implementation AIIFetchPositionResponse

#pragma mark - super

- (Class)queryClass
{
    return [AIIFetchPositionResponseQuery class];
}

@end
