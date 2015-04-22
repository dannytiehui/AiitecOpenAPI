//
//  AIIRemindListPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIIRemindCollection.h"
#import "AIITask.h"

@interface AIIRemindListWhere: AIIWhere
@end


@interface AIIRemindListRequestQuery : AIIListRequestQuery

@property (nonatomic, assign) AIITaskType type;

@end


@interface AIIRemindListResponseQuery : AIIListResponseQuery
@end


@interface AIIRemindListRequest : AIIListRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIRemindListRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AIIRemindListResponse : AIIListResponse
@end