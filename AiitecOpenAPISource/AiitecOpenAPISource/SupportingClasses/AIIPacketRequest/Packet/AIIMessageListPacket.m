//
//  AIIMessageListPacket.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-10.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIMessageListPacket.h"

@implementation AIIMessageListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIMessageCollection alloc] init];
    }
    return self;
}

@end


@implementation AIIMessageListRequest
@end


@implementation AIIMessageListResponse
@end
