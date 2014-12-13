//
//  AIITaskListPacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIITaskCollection.h"

@interface AIITaskListWhere : AIIWhere

@property (nonatomic, assign) AIITaskStatus status;
/** 标签id. */
@property (nonatomic, assign) NSUInteger labelId;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

@end



@interface AIITaskListRequestQuery : AIIListRequestQuery

@property (nonatomic, assign) AIITaskType type;
@property (nonatomic, assign) NSUInteger identifier;

@end


@interface AIITaskListResponseQuery : AIIListResponseQuery
@end



@interface AIITaskListRequest : AIIListRequest

@property (nonatomic, strong) AIITaskListRequestQuery *query;

@end



@interface AIITaskListResponse : AIIListResponse
@end
