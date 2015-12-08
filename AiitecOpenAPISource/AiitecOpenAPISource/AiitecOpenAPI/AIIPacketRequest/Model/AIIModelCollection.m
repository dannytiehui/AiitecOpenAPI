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
            _key = [className hasSuffix:@"s"] ? [className stringByAppendingString:@"es"].lowercaseString.lowercaseString : [className stringByAppendingString:@"s"].lowercaseString;
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

- (id)initWithContentsOfFile
{
    if (self = [super init]) {
        NSFileManager *fm = [NSFileManager defaultManager];
        BOOL isDir;
        BOOL fileExists = [fm fileExistsAtPath:self.filePath isDirectory:&isDir];
        BOOL isCachesFileExists = !isDir && fileExists;
        
        if (isCachesFileExists) {
            NSArray *array = [NSArray arrayWithContentsOfFile:self.filePath];
            [self setObjectWithArray:array];
        }
        else {
            NSLog(@"initWithContentsOfFile (缓存文件不存在). %@", self.filePath);
        }
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    AIIModelCollection *modelCollection = [super copyWithZone:zone];
    modelCollection.key = [_key copy];
    return modelCollection;
}

#pragma mark - NSMutableCopying

- (id)mutableCopyWithZone:(NSZone *)zone
{
    AIIModelCollection *modelCollection = [super mutableCopyWithZone:zone];
    modelCollection.key = [_key mutableCopy];
    return modelCollection;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.key forKey:@"ModelCollectionKey"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    self.key = [aDecoder decodeObjectForKey:@"ModelCollectionKey"];
    return self;
}

#pragma mark - ValueToArray

- (NSArray *)arrayWithObject
{
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    
    /// 快速枚举（父类需实现NSFastEnumeration协议）
    for (AIIEntity *entity in self) {
        entity.properties = self.entityProperties;
        
        if (self.entityKey) {
            entity.key = self.entityKey;
        }

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
        
        if (self.entityKey) {
            entity.key = self.entityKey;
        }
        
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

- (NSString *)filePath
{
    return [NSString stringWithFormat:@"%@/%@.plist", [AIIUtility cachesPacketPath], NSStringFromClass(self.class)];
}

- (BOOL)writeToFile
{
    NSArray *array = [self arrayWithObject];
    return [array writeToFile:self.filePath atomically:YES];
}

@end
