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

+ (BOOL)createIqPacketWithEntity:(NSString *)entity
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *templateEntityHPath = [bundle pathForResource:@"AII_Entity_h" ofType:@""];;
    NSString *templateEntityMPath = [bundle pathForResource:@"AII_Entity_m" ofType:@""];;
    NSString *templateEntityCollectionHPath = [bundle pathForResource:@"AII_Entity_Collection_h" ofType:@""];;
    NSString *templateEntityCollectionMPath = [bundle pathForResource:@"AII_Entity_Collection_m" ofType:@""];;
    NSString *replaceString = @"_Entity_";
   
    NSString *entityHPath = [AIIFileCache iqPacketCachePath:[NSString stringWithFormat:@"AII%@.h", entity]];
    NSString *entityMPath = [AIIFileCache iqPacketCachePath:[NSString stringWithFormat:@"AII%@.m", entity]];
    NSString *entityCollectionHPath = [AIIFileCache iqPacketCachePath:[NSString stringWithFormat:@"AII%@Collection.h", entity]];
    NSString *entityCollectionMPath = [AIIFileCache iqPacketCachePath:[NSString stringWithFormat:@"AII%@Collection.m", entity]];
    
    NSError *entityHError;
    NSError *entityMError;
    NSError *entityCollectionHError;
    NSError *entityCollectionMError;
    NSString *entityHString = [NSString stringWithContentsOfFile:templateEntityHPath encoding:NSUTF8StringEncoding error:&entityHError];
    NSString *entityMString = [NSString stringWithContentsOfFile:templateEntityMPath encoding:NSUTF8StringEncoding error:&entityMError];
    NSString *entityCollectionHString = [NSString stringWithContentsOfFile:templateEntityCollectionHPath encoding:NSUTF8StringEncoding error:&entityCollectionHError];
    NSString *entityCollectionMString = [NSString stringWithContentsOfFile:templateEntityCollectionMPath encoding:NSUTF8StringEncoding error:&entityCollectionMError];
    
    if (entityHError || entityMError || entityCollectionHError || entityCollectionMError) {
        NSLog(@"entityHError:%@", entityHError);
        NSLog(@"entityMError:%@", entityMError);
        NSLog(@"entityCollectionHError:%@", entityCollectionHError);
        NSLog(@"entityCollectionMError:%@", entityCollectionMError);
        return NO;
    }
    
    entityHString = [entityHString stringByReplacingOccurrencesOfString:replaceString withString:entity];
    entityMString = [entityMString stringByReplacingOccurrencesOfString:replaceString withString:entity];
    entityCollectionHString = [entityCollectionHString stringByReplacingOccurrencesOfString:replaceString withString:entity];
    entityCollectionMString = [entityCollectionMString stringByReplacingOccurrencesOfString:replaceString withString:entity];
    NSData *entityHData =  [entityHString dataUsingEncoding:NSUTF8StringEncoding];
    NSData *entityMData =  [entityMString dataUsingEncoding:NSUTF8StringEncoding];
    NSData *entityCollectionHData =  [entityCollectionHString dataUsingEncoding:NSUTF8StringEncoding];
    NSData *entityCollectionMData =  [entityCollectionMString dataUsingEncoding:NSUTF8StringEncoding];

    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSArray *listItems = [entityHPath componentsSeparatedByString:@"/"];
    NSString *fileName = [listItems lastObject];
    NSString *pathDirectories = [entityHPath stringByReplacingOccurrencesOfString:fileName withString:@""];
    BOOL isDir;
    if (!([fm fileExistsAtPath:pathDirectories isDirectory:&isDir] && isDir)) {
        [fm createDirectoryAtPath:pathDirectories withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return [fm createFileAtPath:entityHPath contents:entityHData attributes:nil] && [fm createFileAtPath:entityMPath contents:entityMData attributes:nil] && [fm createFileAtPath:entityCollectionHPath contents:entityCollectionHData attributes:nil] && [fm createFileAtPath:entityCollectionMPath contents:entityCollectionMData attributes:nil];
}

+ (BOOL)createIqPacketWithEntityArray:(NSArray *)entityArray
{
    BOOL b = NO;
    for (NSString *entity in entityArray) {
        b = [AIIFileCache createIqPacketWithEntity:entity];
        if (!b) {
            break;
        }
    }
    return b;
}


+ (BOOL)createIqPacketWithNamespace:(NSString *)nameSpace template:(AIITemplate)aTemplate
{
    NSString *fileSuffix = @"";
    NSString *templateHPath;
    NSString *templateMPath;
    NSString *replaceString = @"_Entity_";
    NSBundle *bundle = [NSBundle mainBundle];
    
    switch (aTemplate) {
        case AIITemplateDefault:
            replaceString = @"_Namespace_";
            templateHPath = [bundle pathForResource:@"AII_Namespace_Packet_h" ofType:@""];
            templateMPath = [bundle pathForResource:@"AII_Namespace_Packet_m" ofType:@""];
            break;
        case AIITemplateList:
            fileSuffix = @"List";
            templateHPath = [bundle pathForResource:@"AII_Entity_ListPacket_h" ofType:@""];
            templateMPath = [bundle pathForResource:@"AII_Entity_ListPacket_m" ofType:@""];
            break;
        case AIITemplateDetails:
            fileSuffix = @"Details";
            templateHPath = [bundle pathForResource:@"AII_Entity_DetailsPacket_h" ofType:@""];
            templateMPath = [bundle pathForResource:@"AII_Entity_DetailsPacket_m" ofType:@""];
            break;
        case AIITemplateSubmit:
            fileSuffix = @"Submit";
            templateHPath = [bundle pathForResource:@"AII_Entity_SubmitPacket_h" ofType:@""];
            templateMPath = [bundle pathForResource:@"AII_Entity_SubmitPacket_m" ofType:@""];
            break;
        case AIITemplateCollectionSubmit:
            fileSuffix = @"CollectionSubmit";
            templateHPath = [bundle pathForResource:@"AII_Entity_CollectionSubmitPacket_h" ofType:@""];
            templateMPath = [bundle pathForResource:@"AII_Entity_CollectionSubmitPacket_m" ofType:@""];
            break;
        case AIITemplateSwitch:
            fileSuffix = @"Switch";
            replaceString = @"_Namespace_";
            templateHPath = [bundle pathForResource:@"AII_Namespace_SwitchPacket_h" ofType:@""];
            templateMPath = [bundle pathForResource:@"AII_Namespace_SwitchPacket_m" ofType:@""];
            break;
        default:
            replaceString = @"_Namespace_";
            templateHPath = [bundle pathForResource:@"AII_Namespace_Packet_h" ofType:@""];
            templateMPath = [bundle pathForResource:@"AII_Namespace_Packet_m" ofType:@""];
            break;
    }
    
    NSString *hPath = [AIIFileCache iqPacketCachePath:[NSString stringWithFormat:@"AII%@%@Packet.h", nameSpace, fileSuffix]];
    NSString *mPath = [AIIFileCache iqPacketCachePath:[NSString stringWithFormat:@"AII%@%@Packet.m", nameSpace, fileSuffix]];
    
    NSError *hError;
    NSError *mError;
    NSString *hString = [NSString stringWithContentsOfFile:templateHPath encoding:NSUTF8StringEncoding error:&hError];
    NSString *mString = [NSString stringWithContentsOfFile:templateMPath encoding:NSUTF8StringEncoding error:&mError];
    
    if (hError || mError) {
        NSLog(@"hError:%@", hError);
        NSLog(@"mError:%@", mError);
        return NO;
    }
    
    NSString *h = [hString stringByReplacingOccurrencesOfString:replaceString withString:nameSpace];
    NSString *m = [mString stringByReplacingOccurrencesOfString:replaceString withString:nameSpace];
    NSData *hData =  [h dataUsingEncoding:NSUTF8StringEncoding];
    NSData *mData =  [m dataUsingEncoding:NSUTF8StringEncoding];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSArray *listItems = [hPath componentsSeparatedByString:@"/"];
    NSString *fileName = [listItems lastObject];
    NSString *pathDirectories = [hPath stringByReplacingOccurrencesOfString:fileName withString:@""];
    BOOL isDir;
    if (!([fm fileExistsAtPath:pathDirectories isDirectory:&isDir] && isDir)) {
        [fm createDirectoryAtPath:pathDirectories withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return [fm createFileAtPath:hPath contents:hData attributes:nil] && [fm createFileAtPath:mPath contents:mData attributes:nil];
}

+ (BOOL)createIqPacketWithNamespaceArray:(NSArray *)namespaceArray template:(AIITemplate)aTemplate
{
    BOOL b = NO;
    for (NSString *nameSpace in namespaceArray) {
        b = [AIIFileCache createIqPacketWithNamespace:nameSpace template:aTemplate];
        if (!b) {
            break;
        }
    }
    return b;
}

@end
