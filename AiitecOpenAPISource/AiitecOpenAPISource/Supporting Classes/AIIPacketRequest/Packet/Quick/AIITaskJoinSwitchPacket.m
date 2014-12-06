//
//  AIITaskJoinSwitchPacket.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIITaskJoinSwitchPacket.h"

@implementation AIITaskJoinSwitchRequestQuery

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"open"]) {
        self.open = [value isEqualToString:@"1"] ? YES : NO;
    }
    else {
        [super setValue:value forKey:key];
    }
}

@end


@implementation AIITaskJoinSwitchRequest
@end


@implementation AIITaskJoinSwitchResponse
@end
