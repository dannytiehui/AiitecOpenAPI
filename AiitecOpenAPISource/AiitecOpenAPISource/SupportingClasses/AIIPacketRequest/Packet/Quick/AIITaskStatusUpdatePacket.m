//
//  AIITaskStatusUpdatePacket.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIITaskStatusUpdatePacket.h"

@implementation AIITaskStatusUpdateRequestQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIUserCollection alloc] init];
    }
    return self;
}

@end


@implementation AIITaskStatusUpdateRequest
@end


@implementation AIITaskStatusUpdateResponse
@end
