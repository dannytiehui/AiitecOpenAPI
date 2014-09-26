//
//  AIIQuery.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-8-27.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIJSONModel.h"

typedef NS_ENUM(NSUInteger, AIIQueryAction) {
    AIIQueryActionDefault,
    AIIQueryActionFirst,
    AIIQueryActionSecond,
    AIIQueryActionThird,
    AIIQueryActionFourth,
    AIIQueryActionFifth,
    AIIQueryActionSixth,
    AIIQueryActionSeventh,
    AIIQueryActionEighth,
    AIIQueryActionNinth
};

@interface AIIQuery : AIIJSONModel <ValueToDictionary>

@property (nonatomic, assign) AIIQueryAction action;
@property (nonatomic, assign) NSUInteger identifier;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *timestamp;

@end
