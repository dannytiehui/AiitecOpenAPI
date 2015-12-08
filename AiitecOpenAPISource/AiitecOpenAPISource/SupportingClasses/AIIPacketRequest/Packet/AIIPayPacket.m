//
//  AIIPayPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 15/03/04.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIPayPacket.h"

@implementation AIIPayRequestQuery

- (void)setValue:(id)value forKey:(NSString *)key
{
    if([key isEqualToString:@"amount"]) {
        self.amount = [value floatValue];
    }
    else {
        [super setValue:value forKey:key];
    }
}

@end


@implementation AIIPayResponseQuery
@end


@implementation AIIPayRequest
@end


@implementation AIIPayResponse
@end
