//
//  AIIJSONModel.m
//  AAClient
//
//  Created by iMac on 13-5-13.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIJSONModel.h"

@implementation AIIJSONModel

- (id)init
{
    if (self = [super init]) {
        /** 注意:self.key等同于[self key],不能用 _key 替换,原因是程序的执行先后顺序,[self key]是调用的子类方法. */
        if (!self.key.length) {
            NSString *className = NSStringFromClass(self.class);
            className = [className stringByReplacingOccurrencesOfString:@"AII" withString:@""];
            _key = className.lowercaseString;
        }
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    return [[self class] allocWithZone:zone];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    /// 子类实现
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    /// 子类实现
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    @try {
        /// 解决返回数字(整型/浮点型)包含双引号的情况.
        NSString *regexFloat = @"^-?([1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*|0?\\.0+|0)$";//!< 匹配浮点数
        NSString *regexInt = @"^-?[1-9]\\d*$";//!< 匹配整数
        
        NSPredicate *predicateFloat = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexFloat];
        NSPredicate *predicateInt = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexInt];
        BOOL isMatchFloat = [predicateFloat evaluateWithObject:value];
        BOOL isMatchInt = [predicateInt evaluateWithObject:value];
        
//        NSLog(@"AIIJSONModel.regex. %@:%@, %d, %d", value, key, isMatchFloat, isMatchInt);
        
        if (isMatchFloat) {
            value = [NSNumber numberWithFloat:[value floatValue]];
        }
        else if (isMatchInt) {
            value = [NSNumber numberWithInteger:[value integerValue]];
        }
    }
    @catch (NSException *exception) {
#ifdef DEBUG
        NSLog(@"AIIJSONModel.NSException:%@", exception.description);
#endif
    }
    @finally {
        
    }
    
    [super setValue:value forKey:key];
}

#pragma mark - self

- (NSArray *)defaultProperties
{
    NSArray *_defaultProperties = [AIIUtility classPropertys:self.class];
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray:_defaultProperties];
    
    NSObject *object = self;
    do {
        NSString *className = NSStringFromClass(object.superclass);
        object = [[NSClassFromString(className) alloc] init];
//        [mutableArray addObjectsFromArray:[AIIUtility classPropertys:object.class]];//!< 需要考虑排序
        NSArray *temp = [AIIUtility classPropertys:object.class];
        for (NSInteger i = temp.count - 1; i >= 0; i --) {
            [mutableArray insertObject:[temp objectAtIndex:i] atIndex:0];
        }
    } while ([object class] != [AIIJSONModel class]);
    
    [mutableArray removeObject:@"key"];
    [mutableArray removeObject:@"properties"];
    [mutableArray removeObjectsInArray:@[@"hash",@"superclass",@"description",@"debugDescription"]];
    
    _defaultProperties = mutableArray;
    return _defaultProperties;
}

- (NSArray *)keys
{
    return self.properties ? self.properties : self.defaultProperties;
}

@end
