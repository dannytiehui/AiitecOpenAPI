//
//  AIIModelCollection.h
//  AAClient
//
//  Created by iMac on 13-5-15.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIJSONCollection.h"
#import "AIIJSONValueConvert.h"
#import "AIIEntity.h"

/** AIIModelCollection.
 *
 *  集合对象模型基类.
 *  内置规则(仅对继承ModelCollection的子类):
 *    1.关于属性key的值:
 *      a)属性key的值为entityClass的key加"s"。如:AIIUserCollection类,则其key属性值默认为users.
 *      b)如果用户明确设置:userCollection.key = @"userskey";则以用户设置为准.
 */
@interface AIIModelCollection : AIIJSONCollection <ValueToArray, ValueFromArray>

/**
 *  @brief  获取当前AIIModelCollection对象的key键值.
 *
 *  @return 对象的key键值.
 */
@property (nonatomic, copy) NSString *key;

/**
 *  @brief  获取AIIEntity对象的key键值.
 *
 *  @return 对象的key键值.
 */
@property (nonatomic, copy) NSString *entityKey;

/**
 *  @brief  组包时,设置／获取集合中每一个实例类的必须属性.默认不包含properties本身、key, 若不设置则默认用entityClass的properties.
 *
 *  @return 组包时必须包含的属性.
 */
@property (nonatomic, copy) NSArray *entityProperties;

/**
 * @brief 将JSON格式的数组转换为self(ModelCollection)对象
 *
 * @param jsonArray JSON格式的数组字符串.
 *
 * @return 返回self.
 */
- (id)initWithJSONArray:(NSString *)jsonArray;

/**
 *  @brief  获取集合的identifier数组.
 *
 *  @return 集合的identifier数组.
 */
- (NSArray *)entityIds;

@end
