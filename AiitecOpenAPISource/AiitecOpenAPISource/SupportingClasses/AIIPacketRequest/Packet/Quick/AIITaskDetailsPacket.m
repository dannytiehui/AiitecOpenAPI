//
//  AIITaskDetailsPacket.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIITaskDetailsPacket.h"

@implementation AIITaskDetailsRequestQuery
@end


@implementation AIITaskDetailsResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.entity = [[AIITask alloc] init];
    }
    return self;
}

@end


@implementation AIITaskDetailsRequest
@end


@implementation AIITaskDetailsResponse
@end
