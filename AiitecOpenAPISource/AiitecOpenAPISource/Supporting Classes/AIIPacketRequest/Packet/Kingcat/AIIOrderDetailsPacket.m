//
//  AIIOrderDetailsPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIOrderDetailsPacket.h"

@implementation AIIOrderDetailsResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.entity = [[AIIOrder alloc] init];
    }
    return self;
}

@end


@implementation AIIOrderDetailsRequest
@end


@implementation AIIOrderDetailsResponse
@end
