//
//  AIIFileCache.h
//  AAClient
//
//  Created by iMac on 13-7-11.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@end
