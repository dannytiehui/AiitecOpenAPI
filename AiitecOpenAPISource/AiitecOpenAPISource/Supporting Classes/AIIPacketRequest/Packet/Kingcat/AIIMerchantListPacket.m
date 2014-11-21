//
//  AIIMerchantListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIMerchantListPacket.h"

@implementation AIIMerchantListWhere
@end


@implementation AIIMerchantListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIMerchantCollection alloc] init];
    }
    return self;
}

@end


@implementation AIIMerchantListRequest
@end


@implementation AIIMerchantListResponse
@end
