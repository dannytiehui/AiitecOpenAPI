//
//  AIIGoodsDetailsPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIGoodsDetailsPacket.h"

@implementation AIIGoodsDetailsResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.entity = [[AIIGoods alloc] init];
    }
    return self;
}

@end


@implementation AIIGoodsDetailsRequest
@end


@implementation AIIGoodsDetailsResponse
@end
