//
//  AII_Entity_.h
//  AiitecOpenAPISource
//
//  Created by iMac on 15/03/04.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"
#import "AIIModelCollection.h"

@interface AII_Entity_ : AIIEntity

@property (nonatomic, assign) NSUInteger integer;
@property (nonatomic, assign) BOOL b;
@property (nonatomic, copy) NSString *str;

@property (nonatomic, strong) AIIEntity *entity;
@property (nonatomic, strong) AIIModelCollection *modelCollection;

@end
