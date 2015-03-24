//
//  AIIArticleDetailsPacket.m
//  AII
//
//  Created by iMac on 14-2-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIArticleDetailsPacket.h"

@implementation AIIArticleDetailsRequest

- (NSString *)nameSpace
{
    return @"ArticleDetails";
}

- (NSString *)packetNickname
{
    return @"文章详情";
}

@end


@implementation AIIArticleDetailsResponse
@end
