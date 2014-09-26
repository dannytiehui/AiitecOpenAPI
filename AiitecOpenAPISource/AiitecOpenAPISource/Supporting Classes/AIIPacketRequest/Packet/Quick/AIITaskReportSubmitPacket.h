//
//  AIITaskReportSubmitPacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

/** 任务状态. */
typedef NS_ENUM(NSUInteger, AIITaskReportType) {
    AIITaskReportTypeFirst = 1,       //!< 1联系电话虚假
    AIITaskReportTypeSecond,      //!< 2虚假违法信息
};

@interface AIITaskReportSubmitRequestQuery : AIIQuery

@property (nonatomic, assign) AIITaskReportType type;

@end



@interface AIITaskReportSubmitRequest : AIIRequest

@property (nonatomic, strong) AIITaskReportSubmitRequestQuery *query;

@end



@interface AIITaskReportSubmitResponse : AIIResponse

@end

