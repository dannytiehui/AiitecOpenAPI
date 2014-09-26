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

@property (nonatomic, assign) AIITaskStatus orderStatus;
@property (nonatomic, assign) NSUInteger labelId;//!< 标签id
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

@end



@interface AIITaskListResponseQuery : AIIListResponseQuery
@end



@interface AIITaskListRequest : AIIListRequest
@end



@interface AIITaskListResponse : AIIListResponse
@end
