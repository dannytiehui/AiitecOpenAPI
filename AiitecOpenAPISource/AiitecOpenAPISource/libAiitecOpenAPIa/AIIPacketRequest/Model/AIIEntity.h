//
//  AIIEntity.h
//  AAClient
//
//  Created by iMac on 13-5-13.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIJSONModel.h"

/** AIIEntity.
 *
 *  对象模型基类.
 *  内置规则(仅对继承Entity的子类):
 *  - 关于属性key的值:
 *  1. 属性key的值为去掉AII前缀后的小写字符串。如:AIIUser类,则其key属性值默认为user.
 *  2. 如果用户明确设置:`user.key = @"userkey";`则以用户设置为准.
 */
@interface AIIEntity : AIIJSONModel <ValueToDictionary>

@property (nonatomic, assign) NSUInteger identifier;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, assign) BOOL deleted;
@property (nonatomic, copy) NSString *timestampUpdate;
@property (nonatomic, copy) NSString *timestamp;

/**
 * @brief 将JSON格式的字符串转换为self(Entity)对象
 *
 * @param jsonString JSON格式的字符串.
 *
 * @return 返回self.
 */
- (id)initWithJSONString:(NSString *)jsonString;

@end
