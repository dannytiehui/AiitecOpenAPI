//
//  AIITaskReportListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIITaskReportListPacket.h"

@implementation AIITaskReportListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIICommentCollection alloc] init];
    }
    return self;
}

@end


@implementation AIITaskReportListRequest
@end


@implementation AIITaskReportListResponse
@end
