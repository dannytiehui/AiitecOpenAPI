//
//  AIIReport.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/8.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"

/** 来自. */
typedef NS_ENUM(NSUInteger, AIIReportFrom) {
    AIIReportFromFirst = 1,   //!< 1举报
    AIIReportFromSecond,      //!< 2投诉
};

/** 举报类型. */
typedef NS_ENUM(NSUInteger, AIIReportType) {
    AIIReportTypeFirst,       //!< 1联系电话虚假
    AIIReportTypeSecond,      //!< 2虚假违法信息
    AIIReportTypeSixth,       //!< 6任务与描述不符合
    AIIReportTypeSeventh,     //!< 7对方恶意取消任务
    AIIReportTypeEighth,      //!< 8参与人虚假点击已完成
};


@interface AIIReport : AIIEntity

@property (nonatomic, assign) AIIReportFrom from;
@property (nonatomic, assign) AIIReportType type;

@end
