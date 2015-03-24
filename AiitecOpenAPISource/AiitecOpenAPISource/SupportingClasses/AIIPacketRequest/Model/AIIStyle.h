//
//  AIIStyle.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/9.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"

@interface AIIStyle : AIIEntity

/** 响铃：1开；2关；. */
@property (nonatomic, assign) BOOL sound;
/** 振动：1开；2关；. */
@property (nonatomic, assign) BOOL vibrate;
/** 免打扰开始时间.如 22:00:00. */
@property (nonatomic, copy) NSString *quietStartTime;
/** 免打扰结束时间.如 08:00:00. */
@property (nonatomic, copy) NSString *quietEndTime;

@end
