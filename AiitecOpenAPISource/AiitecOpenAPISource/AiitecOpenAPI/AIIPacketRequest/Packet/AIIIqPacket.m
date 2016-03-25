//
//  AIIIqPacket.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "AIIIqPacket.h"
#import "AIIPacketManager.h"

@interface AIIIqPacket ()

@property (nonatomic, copy) NSString *nameSpace;

@end


@implementation AIIIqPacket

- (id)init
{
    if (self = [super init]) {
        NSString *className = NSStringFromClass(self.class);
        _queryClass = NSClassFromString([className stringByAppendingString:@"Query"]);
        _query = [[_queryClass alloc] init];
        
        if (_queryClass) {
            _query = [[_queryClass alloc] init];
        }
        else if(self.queryClass) {
            _query = [[self.queryClass alloc] init];
        }
        else {
            _query = [[AIIQuery alloc] init];
        }
        
    }
    return self;
}

- (id)initWithJSONString:(NSString *)jsonString
{
    self = [self init];
    /// 子类实现
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
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.query forKey:@"IqPacketQuery"];
    [aCoder encodeObject:self.nameSpace forKey:@"IqPacketNameSpace"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    /// 子类实现
    self = [super initWithCoder:aDecoder];
    self.query = [aDecoder decodeObjectForKey:@"IqPacketQuery"];
    self.nameSpace = [aDecoder decodeObjectForKey:@"IqPacketNameSpace"];
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

//- (id)valueForKey:(NSString *)key
//{
//    if ([key isEqualToString:@"q"]) {
//        return [self.query dictionaryWithValuesForKeys:self.query.keys];
//    }
//    else {
//        return [super valueForKey:key];
//    }
//}

//- (void)setValue:(id)value forKey:(NSString *)key
//{
//    if ([key isEqualToString:@"query"]) {
//        [self.query setValuesForKeysWithDictionary:value];
//    }
//    else {
//        [super setValue:value forKey:key];
//    }
//}

- (id)valueForUndefinedKey:(NSString *)key
{
    id value;
    if([key isEqualToString:@"n"]) {
        value = [self valueForKey:@"nameSpace"];
    }
    else if([key isEqualToString:@"s"]) {
//        [[NSUserDefaults standardUserDefaults] setObject:value forKey:@"sessionId"];
    }
    else if([key isEqualToString:self.query.key]) {
        value = [self valueForKey:@"query"];
    }
    else {
        value = [super valueForUndefinedKey:key];
    }
    return value;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"n"]) {
        self.nameSpace = value;
    }
    else if([key isEqualToString:@"s"]) {
        
    }
    else if([key isEqualToString:self.query.key]) {
        [self.query setValuesForKeysWithDictionary:value];
    }
    else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"nameSpace";
    if (![[dict objectForKey:k] isKindOfClass:[NSNull class]]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"n"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    NSString *sessionId = [[NSUserDefaults standardUserDefaults] objectForKey:@"sessionId"];
    sessionId = sessionId ? sessionId : @"";
    [mutableDictionary setObject:sessionId  forKey:@"s"];
    
    k = @"query";
    if ([[dict objectForKey:k] isKindOfClass:[AIIQuery class]]) {
//        NSLog(@"AIIIqPacket self.query.keys:%@", self.query.keys);
        [mutableDictionary setObject:[self.query dictionaryWithValuesForKeys:self.query.keys] forKey:@"q"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    return dict;
}

#pragma mark - self

- (NSString *)nameSpace
{
    if (!_nameSpace) {
        _nameSpace = [NSStringFromClass(self.class) stringByReplacingOccurrencesOfString:@"AII" withString:@""];
        _nameSpace = [_nameSpace stringByReplacingOccurrencesOfString:@"Request" withString:@""];
        _nameSpace = [_nameSpace stringByReplacingOccurrencesOfString:@"Response" withString:@""];
    }
    return _nameSpace;
}

+ (id)findProperty:(NSDictionary *)properties path:(NSString *)path {
    NSArray *chunks = [path componentsSeparatedByString: @"/"];
    NSDictionary *currentElement = properties;
    
    for (NSString *elementName in chunks) {
        id valueObject = currentElement[elementName];
        
        if (![valueObject isKindOfClass:[NSDictionary class]]) {
            currentElement = nil;
            break;
        }
        currentElement = valueObject;
    }
    return currentElement;
}

#pragma mark - super

/**
 *  @brief  组包时,获取对象的默认属性.默认不包含queryClass.
 *
 *  @return 组包时包含的属性.
 */
- (NSArray *)defaultProperties
{
    NSArray *_defaultProperties = [super defaultProperties];
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray:_defaultProperties];
    [mutableArray removeObject:@"queryClass"];
    _defaultProperties = mutableArray;
    return _defaultProperties;
}

@end
