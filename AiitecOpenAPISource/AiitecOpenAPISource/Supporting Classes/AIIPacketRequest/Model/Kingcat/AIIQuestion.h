//
//  AIIQuestion.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/6.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIItemCollection.h"

@interface AIIQuestion : AIIEntity

/** 标题. */
@property (nonatomic, copy) NSString *title;
/** 答案. */
@property (nonatomic, assign) NSUInteger answer;

@property (nonatomic, strong) AIIItemCollection *options;

@end
