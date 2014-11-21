//
//  AIIMerchantDetailsPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIMerchantDetailsPacket.h"

@implementation AIIMerchantDetailsResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.entity = [[AIIMerchant alloc] init];
    }
    return self;
}

@end


@implementation AIIMerchantDetailsRequest
@end


@implementation AIIMerchantDetailsResponse
@end

