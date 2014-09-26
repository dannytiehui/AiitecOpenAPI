//
//  AIIMessageListPacket.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-10.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIMessageListPacket.h"

//@implementation AIIMessageListRequestQuery
//@end


@implementation AIIMessageListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIIMessageCollection alloc] init];
    }
    return self;
}

//#pragma mark - NSObject(NSKeyValueCoding)
//
//- (void)setValue:(id)value forKey:(NSString *)key
//{
//    NSLog(@"AIIMessageListResponseQuery.setValue:%@ forKey:%@", value, key);
//    if ([key isEqualToString:self.modelCollection.key]) {
//        [self.modelCollection setObjectWithArray:value];
//    }
//    else {
//        [super setValue:value forKey:key];
//    }
//}

@end


@implementation AIIMessageListRequest
@end


@implementation AIIMessageListResponse
@end
