//
//  AIIAddressListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/4.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIAddressListPacket.h"

@implementation AIIAddressListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIAddressCollection alloc] init];
    }
    return self;
}

@end


@implementation AIIAddressListRequest
@end


@implementation AIIAddressListResponse
@end
