//
//  AIIRankDetailsPacket.m
//  Quick
//
//  Created by iMac on 14/10/21.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRankDetailsPacket.h"

@implementation AIIRankDetailsResponseQuery
@end



@implementation AIIRankDetailsRequest
@end



@implementation AIIRankDetailsResponse

#pragma mark - super

- (Class)queryClass
{
    return [AIIRankDetailsResponseQuery class];
}

@end