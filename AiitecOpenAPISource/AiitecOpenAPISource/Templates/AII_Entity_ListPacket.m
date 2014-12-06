//
//  AII_Entity_ListPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AII_Entity_ListPacket.h"

@implementation AII_Entity_ListWhere
@end


@implementation AII_Entity_ListRequestQuery
@end


@implementation AII_Entity_ListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AII_Entity_Collection alloc] init];
    }
    return self;
}

@end


@implementation AII_Entity_ListRequest
@end


@implementation AII_Entity_ListResponse
@end
