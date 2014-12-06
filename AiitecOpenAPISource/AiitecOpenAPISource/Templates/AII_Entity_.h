//
//  AII_Entity_.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"
#import "AIIModelCollection.h"

@interface AII_Entity_ : AIIEntity

@property (nonatomic, assign) NSUInteger *integer;
@property (nonatomic, assign) BOOL b;
@property (nonatomic, copy) NSString *string;

@property (nonatomic, strong) AIIEntity *entity;
@property (nonatomic, strong) AIIModelCollection *modelCollection;

@end