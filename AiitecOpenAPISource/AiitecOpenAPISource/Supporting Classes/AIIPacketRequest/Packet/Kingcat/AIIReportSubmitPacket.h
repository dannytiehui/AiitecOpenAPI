//
//  AIIReportSubmitPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntityPacket.h"

@interface AIIReportSubmitRequestQuery : AIIQuery

@property (nonatomic, copy) NSString *content;

@end


@interface AIIReportSubmitRequest : AIIRequest

@property (nonatomic, strong) AIIReportSubmitRequestQuery *query;

@end


@interface AIIReportSubmitResponse : AIIEntityResponse
@end