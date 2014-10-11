//
//  AIIModelCollection.m
//  AAClient
//
//  Created by iMac on 13-5-15.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIModelCollection.h"

@implementation AIIModelCollection

- (id)init
{
    if (self = [super init]) {
        /** 注意:self.key等同于[self key],不能用 _key 替换,原因是程序的执行先后顺序,[self key]是调用的子类方法. */
        if ([self key].length) {
            _key = [self key];
        }
        else {
            NSString *className = NSStringFromClass(self.entityClass);
            className = [className stringByReplacingOccurrencesOfString:@"AII" withString:@""];
            _key = [className hasSuffix:@"s"] ? className.lowercaseString : [className stringByAppendingString:@"s"].lowercaseString;
        }
    }
    return self;
}

- (id)initWithJSONArray:(NSString *)jsonArray
{
    self = [self init];
    [self setObjectWithArray:[AIIUtility arrayWithJSONString:jsonArray]];
    return self;
}

#pragma mark - ValueToArray

- (NSArray *)arrayWithObject
{
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    
    /// 快速枚举（父类需实现NSFastEnumeration协议）
    for (AIIEntity *entity in self) {
        entity.properties = self.entityProperties;

        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        dict[entity.key] = [entity dictionaryWithValuesForKeys:entity.keys];
        [mutableArray addObject:dict];
    }
    
    return mutableArray;
}

#pragma mark - ValueFromArray

- (void)setObjectWithArray:(NSArray *)array
{
    for (NSDictionary *item in array) {
        AIIEntity *entity = [[self.entityClass alloc] init];
        [entity setValuesForKeysWithDictionary:[item objectForKey:entity.key]];
        [self addObject:entity];
    }
}

#pragma mark - self

- (NSArray *)entityIds
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        if([obj isKindOfClass:[AIIEntity class]]) {
            [array addObject:[NSNumber numberWithUnsignedInteger:((AIIEntity *)obj).identifier]];
        }
    }
    return array;
}

@end
