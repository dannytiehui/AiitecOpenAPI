//
//  AIIUploadFilesPacket.m
//  AAClient
//
//  Created by iMac on 13-6-28.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIUploadFilesPacket.h"

@implementation AIIUploadFilesRequestQuery

- (id)init
{
    if (self = [super init]) {
        self.fileCollection = [[AIIFileCollection alloc] init];
    }
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:self.fileCollection.key]) {
        [self.fileCollection setObjectWithArray:value];
    }
    else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"fileCollection";
    if (![[dict objectForKey:k] isKindOfClass:[AIIModelCollection class]]) {
        [mutableDictionary setObject:[self.fileCollection arrayWithObject] forKey:self.fileCollection.key];
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    return dict;
}

@end


@implementation AIIUploadFilesResponseQuery
@end


@implementation AIIUploadFilesRequest

#pragma mark - super

- (Class)queryClass
{
    /// 子类实现
    return [AIIUploadFilesRequestQuery class];
}

@end


@implementation AIIUploadFilesResponse

#pragma mark - super

- (Class)queryClass
{
    /// 子类实现
    return [AIIUploadFilesResponseQuery class];
}

@end
