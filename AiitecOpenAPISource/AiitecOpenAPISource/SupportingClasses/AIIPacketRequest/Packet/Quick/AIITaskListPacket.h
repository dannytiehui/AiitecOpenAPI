//
//  AIITaskListPacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIITaskCollection.h"

/** 筛选类型. */
typedef NS_ENUM(NSUInteger, AIITaskConditionType) {
    AIITaskConditionTypeDefault,    //!< 0全部
    AIITaskConditionTypeFirst,      //!< 1我发布的
    AIITaskConditionTypeSecond,     //!< 2我报名的
};


@interface AIITaskListWhere : AIIWhere

@property (nonatomic, assign) AIITaskStatus status;
@property (nonatomic, assign) AIITaskConditionType myStatus;
/** 标签id. */
@property (nonatomic, assign) NSUInteger labelId;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

@end



@interface AIITaskListRequestQuery : AIIListRequestQuery

@property (nonatomic, assign) AIITaskType type;

@end


@interface AIITaskListResponseQuery : AIIListResponseQuery
@end



@interface AIITaskListRequest : AIIListRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIITaskListRequestQuery *query;
#pragma clang diagnostic pop

@end



@interface AIITaskListResponse : AIIListResponse
@end
