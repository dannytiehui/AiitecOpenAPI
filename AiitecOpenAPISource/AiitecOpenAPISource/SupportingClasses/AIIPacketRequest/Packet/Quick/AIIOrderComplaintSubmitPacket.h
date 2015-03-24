//
//  AIIOrderComplaintSubmitPacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

/// 订单投诉类型
typedef NS_ENUM(NSUInteger, AIIOrderComplaintSubmitType){
    AIIOrderComplaintSubmitTypeFirst = 1,   //!<1任务与描述不符合
    AIIOrderComplaintSubmitTypeSecond       //!<2对方恶意取消任务
};

@interface AIIOrderComplaintSubmitRequestQuery : AIIQuery

@property (nonatomic, assign) AIIOrderComplaintSubmitType type;

@end



@interface AIIOrderComplaintSubmitRequest : AIIRequest

@property (nonatomic, strong) AIIOrderComplaintSubmitRequestQuery *query;

@end



@interface AIIOrderComplaintSubmitResponse : AIIResponse
@end

