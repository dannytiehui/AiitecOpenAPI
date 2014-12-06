//
//  AIIFileCache.h
//  AAClient
//
//  Created by iMac on 13-7-11.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 通讯协议模版类型. */
typedef NS_ENUM(NSUInteger, AIITemplate) {
    AIITemplateDefault,
    AIITemplateList,
    AIITemplateDetails,
    AIITemplateSubmit,
    AIITemplateCollectionSubmit,
    AIITemplateSwitch,
};

@interface AIIFileCache : NSObject

#pragma mark - File

+ (BOOL)fileExistsAtPath:(NSString *)path;
+ (NSData *)dataWithContentsOfFile:(NSString *)path;
+ (BOOL)createFileAtPath:(NSString *)path contents:(NSData *)data;
+ (BOOL)removeItemAtPath:(NSString *)path;
+ (unsigned long long)fileSizeAtPath:(NSString*)path;
+ (unsigned long long)folderSizeAtPath:(NSString*)path;


#pragma mark - IqPacket

+ (NSString *)stringWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error;
+ (BOOL)createIqPacketAtPath:(NSString *)path contents:(NSData *)data;
+ (NSString *)iqPacketModificationDateAtPath:(NSString *)path;

#pragma mark - Entity

+ (BOOL)createIqPacketWithEntity:(NSString *)entity;
+ (BOOL)createIqPacketWithEntityArray:(NSArray *)entityArray;

#pragma mark - Namespace

+ (BOOL)createIqPacketWithNamespace:(NSString *)nameSpace template:(AIITemplate)aTemplate;
+ (BOOL)createIqPacketWithNamespaceArray:(NSArray *)namespaceArray template:(AIITemplate)aTemplate;

@end
