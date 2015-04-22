//
//  AIIOrderStatusUpdatePacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

/** 取消类型. */
typedef NS_ENUM(NSUInteger, AIIOrderCancelType) {
    AIIOrderCancelTypeFirst = 1,   //!< 1已友善协商
    AIIOrderCancelTypeSecond,      //!< 2对方爽约
    AIIOrderCancelTypeThird,       //!< 3对方态度不友好
};

@interface AIIOrderStatusUpdateRequestQuery : AIIQuery

@property (nonatomic, copy) NSString *code;//!< 快应码
@property (nonatomic, assign) AIIOrderCancelType cancelType;//!< 取消类型
@property (nonatomic, copy) NSString *reason;//!< 取消原因

@end



@interface AIIOrderStatusUpdateRequest : AIIRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIOrderStatusUpdateRequestQuery *query;
#pragma clang diagnostic pop

@end



@interface AIIOrderStatusUpdateResponse : AIIResponse

@end
