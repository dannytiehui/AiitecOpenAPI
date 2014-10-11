//
//  AIIFileCache.m
//  AAClient
//
//  Created by iMac on 13-7-11.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIFileCache.h"
#import "AIIUtility.h"

@interface AIIFileCache ()

+ (NSString *)fileCachePath:(NSString *)path;
+ (NSString *)iqPacketCachePath:(NSString *)path;

@end


@implementation AIIFileCache

#pragma - mark Private

+ (NSString *)fileCachePath:(NSString *)path
{
    path = [path stringByReplacingOccurrencesOfString:@"http://" withString:@""];

    NSString *cache = [AIIUtility cachesPacketPath];
    NSString *fileDirectories = [cache stringByAppendingPathComponent:@"file"];
    return [fileDirectories stringByAppendingPathComponent:path];
}

+ (NSString *)iqPacketCachePath:(NSString *)path
{
    NSString *cache = [AIIUtility cachesPacketPath];
    NSString *dir = [cache stringByAppendingPathComponent:@"IqPacket"];
    return [dir stringByAppendingPathComponent:path];
}

#pragma - mark File

+ (BOOL)fileExistsAtPath:(NSString *)path
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *cachePath = [AIIFileCache fileCachePath:path];
    BOOL isDir;
    BOOL fileExists = [fm fileExistsAtPath:cachePath isDirectory:&isDir];
    return !isDir && fileExists;
}

+ (NSData *)dataWithContentsOfFile:(NSString *)path
{
    BOOL exists = [AIIFileCache fileExistsAtPath:path];
    return exists ? [NSData dataWithContentsOfFile:[AIIFileCache fileCachePath:path]] : nil;
}

+ (BOOL)createFileAtPath:(NSString *)path contents:(NSData *)data
{
    path = [AIIFileCache fileCachePath:path];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *listItems = [path componentsSeparatedByString:@"/"];
    NSString *fileName = [listItems lastObject];
    NSString *pathDirectories = [path stringByReplacingOccurrencesOfString:fileName withString:@""];
    BOOL isDir;
    if (!([fm fileExistsAtPath:pathDirectories isDirectory:&isDir] && isDir)) {
        [fm createDirectoryAtPath:pathDirectories withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return [fm createFileAtPath:path contents:data attributes:nil];
}

+ (BOOL)removeItemAtPath:(NSString *)path
{
    NSFileManager *fm = [NSFileManager defaultManager];
    return [fm removeItemAtPath:[AIIFileCache fileCachePath:path] error:nil];
}

+ (unsigned long long)fileSizeAtPath:(NSString*)path
{
    unsigned long long size = 0;
    NSString *absolutePath = [AIIFileCache fileCachePath:path];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:absolutePath]){
        size = [[fm attributesOfItemAtPath:absolutePath error:nil] fileSize];
//        NSLog(@"%llu, %@", size, absolutePath);
    }
    return size;
}

+ (unsigned long long)folderSizeAtPath:(NSString*)path
{
    unsigned long long size = 0;
    NSFileManager *fm = [NSFileManager defaultManager];
    path = [AIIFileCache fileCachePath:path];
    NSEnumerator *childFilesEnumerator = [[fm subpathsAtPath:path] objectEnumerator];
    NSString *fileName;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        size += [self fileSizeAtPath:fileName];
    }
    return size;
}

#pragma -mark IqPacket

+ (NSString *)stringWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error
{
    return [NSString stringWithContentsOfFile:[AIIFileCache iqPacketCachePath:path] encoding:enc error:error];
}

+ (BOOL)createIqPacketAtPath:(NSString *)path contents:(NSData *)data
{
    path = [AIIFileCache iqPacketCachePath:path];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *listItems = [path componentsSeparatedByString:@"/"];
    NSString *fileName = [listItems lastObject];
    NSString *pathDirectories = [path stringByReplacingOccurrencesOfString:fileName withString:@""];
    BOOL isDir;
    if (!([fm fileExistsAtPath:pathDirectories isDirectory:&isDir] && isDir)) {
        [fm createDirectoryAtPath:pathDirectories withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return [fm createFileAtPath:path contents:data attributes:nil];
}

+ (NSString *)iqPacketModificationDateAtPath:(NSString *)path
{
    NSString *iqPacketPath = [AIIFileCache iqPacketCachePath:path];
    NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:iqPacketPath error:nil];
    NSLog(@"fileAttributes = %@", fileAttributes);
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *modificationDate = [[NSDate alloc] initWithTimeIntervalSince1970:0];
    if (fileAttributes) {
        modificationDate = (NSDate *)[fileAttributes objectForKey:NSFileModificationDate];
    }
    return [df stringFromDate:modificationDate];
}

@end
