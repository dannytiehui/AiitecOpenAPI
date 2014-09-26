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
        self.data = data;
        self.filename = filename;
        self.contentType = contentType;
    }
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
