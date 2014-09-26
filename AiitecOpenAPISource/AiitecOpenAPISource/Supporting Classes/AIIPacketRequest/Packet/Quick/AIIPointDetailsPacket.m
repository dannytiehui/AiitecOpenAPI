//
//  AIIPointDetailsPacket.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-24.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIPointDetailsPacket.h"

@implementation AIIPointDetailsResponseQuery

@end


@implementation AIIPointDetailsRequest

@end



@implementation AIIPointDetailsResponse

#pragma mark - super

- (Class)queryClass
{
    return [AIIPointDetailsResponseQuery class];
}

@end
