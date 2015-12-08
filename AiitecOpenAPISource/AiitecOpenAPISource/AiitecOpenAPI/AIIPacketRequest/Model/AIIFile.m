//
//  AIIFile.m
//  AAClient
//
//  Created by iMac on 13-6-28.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIFile.h"

@implementation AIIFile

- (id)initWithData:(NSData *)data filename:(NSString *)filename contentType:(NSString *)contentType
{
    if (self = [super init]) {
        _data = data;
        _filename = filename;
        _contentType = contentType;
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    AIIFile *file = [super copyWithZone:zone];

    file.data = [_data copy];
    file.filename = [_filename copy];
    file.contentType = [_contentType copy];
    file.path = [_path copy];
    file.size = _size;
    file.extension = [_extension copy];
    
    return file;
}

#pragma mark - NSMutableCopying

- (id)mutableCopyWithZone:(NSZone *)zone
{
    AIIFile *file = [super mutableCopyWithZone:zone];
    
    file.data = [_data mutableCopy];
    file.filename = [_filename mutableCopy];
    file.contentType = [_contentType mutableCopy];
    file.path = [_path mutableCopy];
    file.size = _size;
    file.extension = [_extension mutableCopy];
    
    return file;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.data forKey:@"FileData"];
    [aCoder encodeObject:self.filename forKey:@"FileFilename"];
    [aCoder encodeObject:self.contentType forKey:@"FileContentType"];
    [aCoder encodeObject:self.path forKey:@"FilePath"];
    [aCoder encodeFloat:self.size forKey:@"FileSize"];
    [aCoder encodeObject:self.extension forKey:@"FileExtension"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    self.data = [aDecoder decodeObjectForKey:@"FileData"];
    self.filename = [aDecoder decodeObjectForKey:@"FileFilename"];
    self.contentType = [aDecoder decodeObjectForKey:@"FileContentType"];
    self.path = [aDecoder decodeObjectForKey:@"FilePath"];
    self.size = [aDecoder decodeFloatForKey:@"FileSize"];
    self.extension = [aDecoder decodeObjectForKey:@"FileExtension"];
    return self;
}

//- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
//{
//    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
//    
//    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
//    NSString *k = @"data";
//    if ([dict objectForKey:k]) {
//
//    }
////    [mutableDictionary removeObjectForKey:k];
//    
//    dict = mutableDictionary;
//    
//    return dict;
//}

@end
