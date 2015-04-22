//
//  AIIResponse.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "AIIResponse.h"
#import "AIIPacketManager.h"

@interface AIIResponse ()

@property (nonatomic, copy) NSString *JSONString;
@property (nonatomic, copy) NSString *JSONFormatString;
@property (nonatomic, readonly) NSString *cachesPacketFilePath;

@end



@implementation AIIResponse

- (id)initWithJSONString:(NSString *)jsonString
{
    NSError *error;
    NSDictionary *dict = [AIIUtility dictionaryWithJSONString:jsonString error:&error];
    
    if (self = [super init]) {
        if (![AIIPacketManager defaultManager].sessionResponseNotNil) {
            NSLog(@"sessionResponseNotNil = 0");
            self.query.status = SESSION_Nil_STATUS;
            self.query.desc = SESSION_Nil_DESC;
        }
        if (![ReachabilityUtility defaultManager].isReachable) {
            NSLog(@"[ReachabilityUtility defaultManager].isReachable: %d", [ReachabilityUtility defaultManager].isReachable);
            self.query.status = NotReachable_STATUS;
            self.query.desc = NotReachable_DESC;
        }
        else if (error) {
            NSLog(@"Error! initWithJSONString: %@", [error localizedDescription]);
            self.query.status = NotReachable_STATUS;
            self.query.desc = NotReachable_DESC;
        }
        else {
            [self setValuesForKeysWithDictionary:dict];
            
            self.JSONString = jsonString;
            self.JSONFormatString = [AIIUtility stringWithDictionary:dict];
        }
    }
    
    return self;
}

- (id)initWithCachesPacketFile
{
    if (self = [super init]) {
        NSFileManager *fm = [NSFileManager defaultManager];
        BOOL isDir;
        BOOL fileExists = [fm fileExistsAtPath:self.cachesPacketFilePath isDirectory:&isDir];
        BOOL isCachesPacketFileExists = !isDir && fileExists;

        if (isCachesPacketFileExists) {
            NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:self.cachesPacketFilePath];
            [self setValuesForKeysWithDictionary:dict];
        }
        else {
            NSLog(@"initWithCachesPacketFile (协议缓存文件不存在). %@", self.cachesPacketFilePath);
        }
        
        self.query.status = Cache_Packet_STATUS;
        self.query.desc = Cache_Packet_DESC;
    }
    return self;
}

- (NSString *)cachesPacketFilePath
{
    return [NSString stringWithFormat:@"%@/%@.plist", [AIIUtility cachesPacketPath], self.nameSpace];
}

- (BOOL)writeToFile
{
    NSDictionary *dict = [AIIUtility dictionaryWithJSONString:self.JSONString];
    return [dict writeToFile:self.cachesPacketFilePath atomically:YES];
}

@end
