//
//  AIIOrder.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIOrder.h"

@implementation AIIOrder

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"commentStatus"]) {
        self.commentStatus = [value boolValue];
    }
    else {
        [super setValue:value forKey:key];
    }
}


@end
