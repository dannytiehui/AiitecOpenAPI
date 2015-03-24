//
//  AIIRankListPacket.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-12.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRankListPacket.h"

@implementation AIIRankListRequestQuery
@end


@implementation AIIRankListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIUserCollection alloc] init];
    }
    return self;
}

@end



@implementation AIIRankListRequest
@end



@implementation AIIRankListResponse
@end
