//
//  AIIArticleListPacket.m
//  AII
//
//  Created by iMac on 14-2-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIArticleListPacket.h"

@implementation AIIArticleListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIArticleCollection alloc] init];
    }
    return self;
}

@end


@implementation AIIArticleListRequest

//- (NSString *)packetNickname
//{
//    return @"文章列表";
//}

@end



@implementation AIIArticleListResponse
@end
