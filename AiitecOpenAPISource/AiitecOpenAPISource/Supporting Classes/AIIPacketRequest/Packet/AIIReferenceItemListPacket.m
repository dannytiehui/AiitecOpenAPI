//
//  AIIReferenceItemListPacket.m
//  AII
//
//  Created by iMac on 14-2-28.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIReferenceItemListPacket.h"

@implementation AIIReferenceItemListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIItemCollection alloc] init];
    }
    return self;
}

@end



@implementation AIIReferenceItemListRequest

- (NSString *)packetNickname
{
    return @"参照项列表";
}

@end



@implementation AIIReferenceItemListResponse
@end
