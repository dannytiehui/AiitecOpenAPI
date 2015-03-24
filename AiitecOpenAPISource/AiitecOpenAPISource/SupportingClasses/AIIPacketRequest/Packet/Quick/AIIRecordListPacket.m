//
//  AIIRecordListPacket.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-12.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRecordListPacket.h"

@implementation AIIRecordListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIRecordCollection alloc] init];
    }
    return self;
}

@end



@implementation AIIRecordListRequest
@end



@implementation AIIRecordListResponse
@end
