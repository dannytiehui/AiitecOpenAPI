//
//  AIIEvaluate.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"
#import "AIIUser.h"

@interface AIIEvaluate : AIIEntity

@property (nonatomic, assign) NSUInteger stars;
@property (nonatomic, copy) NSString *content;

@property (nonatomic, strong) AIIUser *user;
@property (nonatomic, strong) AIIUser *userTo;

#pragma mark - Option
@property (nonatomic, assign) NSUInteger userIdTo;

@end
