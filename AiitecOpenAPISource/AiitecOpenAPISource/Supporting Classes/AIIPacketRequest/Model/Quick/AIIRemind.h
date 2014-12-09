//
//  AIIRemind.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIUser.h"
#import "AIITask.h"

@interface AIIRemind : AIIEntity

@property (nonatomic, strong) AIIUser *user;
@property (nonatomic, strong) AIITask *task;

@end
