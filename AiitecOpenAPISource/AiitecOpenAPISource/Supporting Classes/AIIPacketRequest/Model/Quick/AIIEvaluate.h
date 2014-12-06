//
//  AIIEvaluate.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"

@interface AIIEvaluate : AIIEntity

@property (nonatomic, assign) NSUInteger stars;
@property (nonatomic, assign) NSUInteger userIdTo;
@property (nonatomic, copy) NSString *content;

@end
