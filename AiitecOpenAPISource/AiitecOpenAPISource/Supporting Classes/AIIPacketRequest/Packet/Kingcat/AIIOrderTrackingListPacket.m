//
//  AIIOrderTrackingListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIOrderTrackingListPacket.h"

@implementation AIIOrderTrackingListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIOrderCollection alloc] init];
        self.modelCollection.key = @"trackings";
        self.modelCollection.entityKey = @"tracking";
        self.modelCollection.entityProperties = @[@"identifier", @"status", @"desc", @"timestamp"];
    }
    return self;
}

@end


@implementation AIIOrderTrackingListRequest
@end


@implementation AIIOrderTrackingListResponse
@end