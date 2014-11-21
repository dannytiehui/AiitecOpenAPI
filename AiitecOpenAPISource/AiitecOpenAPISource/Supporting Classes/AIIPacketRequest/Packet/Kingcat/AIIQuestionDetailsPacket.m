//
//  AIIQuestionDetailsPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIQuestionDetailsPacket.h"

@implementation AIIQuestionDetailsResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.entity = [[AIIQuestion alloc] init];
    }
    return self;
}

@end


@implementation AIIQuestionDetailsRequest
@end


@implementation AIIQuestionDetailsResponse
@end
