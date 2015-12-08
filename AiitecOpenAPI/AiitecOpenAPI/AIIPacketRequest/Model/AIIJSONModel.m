//
//  AIIJSONModel.m
//  AAClient
//
//  Created by iMac on 13-5-13.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIJSONModel.h"

@interface AIIJSONModel ()
{
    NSArray *_defaultProperties;
    NSDictionary *_propertysAttributes;
}

@end


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
    return [[[self class] allocWithZone:zone] init];
}

#pragma mark - NSMutableCopying

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return [[[self class] allocWithZone:zone] init];
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
#if AiitecOpenAPI_DEBUG
    NSLog(@"%@, %@, %@", [self class], key, [[self propertysAttributes] objectForKey:key]);
#endif
    
    BOOL isNumber;
    NSArray *array = (NSArray *)[[self propertysAttributes] objectForKey:key];
    
    if (array.count) {
        isNumber = [@[@"TQ",@"TB",@"Tc",@"Tf",@"Td"] containsObject:array[0]];//!< 判断属性的类型是否为:NSInteger/NSUInteger,BOOL,float,double.
    }
    
    if (!isNumber) {
        [super setValue:value forKey:key];
        return;
    }
    
//    if ([@[@"description"] containsObject:key]) {
//        [super setValue:value forKey:key];
//        return;
//    }
    
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
#ifdef AiitecOpenAPI_DEBUG
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
    if(_defaultProperties) {
        return _defaultProperties;
    }
    
    _defaultProperties = [AIIUtility classPropertys:self.class];
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
    [mutableArray removeObject:@"propertysAttributes"];
    [mutableArray removeObjectsInArray:@[@"abbreviationKeys", @"hash",@"superclass",@"description",@"debugDescription"]];
    
    _defaultProperties = mutableArray;
    return _defaultProperties;
}

- (NSArray *)keys
{
    return self.properties ? self.properties : self.defaultProperties;
}

- (NSDictionary *)propertysAttributes
{
    if (_propertysAttributes) {
        return _propertysAttributes;
    }
    
    _propertysAttributes = [AIIUtility classPropertysAttributes:[self class]];
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:_propertysAttributes];

    NSObject *object = self;
    do {
        NSString *className = NSStringFromClass(object.superclass);
        object = [[NSClassFromString(className) alloc] init];
        NSDictionary *temp = [AIIUtility classPropertysAttributes:object.class];
        [mutableDictionary addEntriesFromDictionary:temp];
    } while ([object class] != [AIIJSONModel class]);
    
    _propertysAttributes = mutableDictionary;
    
//    NSLog(@"_propertysAttributes:%@, %@", NSStringFromClass(self.class), _propertysAttributes);
    return _propertysAttributes;
}

- (NSDictionary *)abbreviationKeys
{
//    NSDictionary *dict = @{@"namespace": @"n", @"sessionId": @"s", @"timestampLatest": @"t", @"cache": @"c", @"query": @"q", @"action": @"a", @"table": @"ta", @"page": @"pa", @"limit": @"li", @"orderBy": @"ob", @"orderType": @"ot", @"where": @"w", @"searchKey": @"sk", @"status": @"s", @"desc": @"description", @"timestamp": @"t", @"identifier": @"id"};
    NSDictionary *dict = @{@"n": @"nameSpace", @"s": @"sessionId", @"t": @"timestampLatest", @"c": @"cache", @"q": @"query", @"a": @"action", @"ta": @"table", @"pa": @"page", @"li": @"limit", @"ob": @"orderBy", @"ot": @"orderType", @"w": @"where", @"sk": @"searchKey", @"s": @"status", @"description": @"desc", @"t": @"timestamp", @"id": @"identifier"};
    return dict;
}

//- (void)print
//{
//    NSLog(@"_sString:%@, %p, %p", _sString, _sString, &_sString);
//    NSLog(@"_cString:%@, %p, %p", _cString, _cString, &_cString);
//}

@end
