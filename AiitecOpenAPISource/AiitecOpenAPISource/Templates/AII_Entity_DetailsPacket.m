//
//  AII_Entity_DetailsPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 15/03/04.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AII_Entity_DetailsPacket.h"

@implementation AII_Entity_DetailsResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.entity = [[AII_Entity_ alloc] init];
    }
    return self;
}

@end


@implementation AII_Entity_DetailsRequest

- (NSString *)packetNickname
{
    return @"";
}

@end


@implementation AII_Entity_DetailsResponse

@end