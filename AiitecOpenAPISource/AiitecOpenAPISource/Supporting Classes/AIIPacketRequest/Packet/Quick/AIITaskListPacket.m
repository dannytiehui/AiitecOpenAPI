//
//  AIITaskListPacket.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIITaskListPacket.h"

@implementation AIITaskListWhere

//#pragma mark - super
//
//- (NSArray *)properties
//{
//    /// 子类可重写
//    return [[super properties] arrayByAddingObjectsFromArray:[AIIUtility classPropertys:[AIITaskListWhere class]]];
//}

@end



@implementation AIITaskListRequestQuery
@end


@implementation AIITaskListResponseQuery

- (id)init
{
    if (self = [super init]) {
        self.modelCollection = [[AIITaskCollection alloc] init];
    }
    return self;
}

@end



@implementation AIITaskListRequest
@end



@implementation AIITaskListResponse
@end