//
//  AIICacheManager.m
//  AAClient
//
//  Created by iMac on 13-7-11.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIICacheManager.h"

#import "Table.h"
#import "AIIEntity.h"
#import "AIIListPacket.h"

@interface AIICacheManager ()
@end


@implementation AIICacheManager

+ (AIICacheManager *)defaultManager
{
    static AIICacheManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AIICacheManager alloc] init];
    });
    return instance;
}

//+ (void)begin:(NSString *)sessionId packet:(NSArray *)packetArray
//{
//    NSString *nameSpace;
//    NSString *requestName;
//    NSString *tableName;
//    ListRequest *listRequest;
//    
//    // 1) 是否包含
//    //    BOOL b = NO;
//    // 2) 是否以ListRequest后缀
//    BOOL b2 = NO;
//    // 3) cacheSupporting == CacheSupportingFull ?
//    BOOL b3 = NO;
//    
//    NSUInteger count = [packetArray count];
//    for (NSUInteger i = 0; i<count; i++) {
//        nameSpace = [packetArray objectAtIndex:i];
//        requestName = [nameSpace stringByAppendingString:@"Request"];
//        listRequest = [[NSClassFromString(requestName) alloc] init];
////        b = [packetArray containsObject:nameSpace];
//        b2 = [nameSpace hasSuffix:@"List"];
//        b3 = listRequest.cacheSupporting == CacheSupportingFull ? YES : NO;
//        
//        if (b2 && b3) {
//            tableName = [nameSpace stringByReplacingOccurrencesOfString:@"List" withString:@"Table"];
//            
//            // 1)获取缓存数据的最新[更新时间]
//            Table *table = [[NSClassFromString(tableName) alloc] init];
//            Entity *item = [table latest];
//            NSString *timestampLatest = item.timestampUpdate ? item.timestampUpdate : @"0" ;
//            
//            // 2)获取新增的数据
////            ListRequest *requestInsert = [[NSClassFromString(requestName) alloc] init];
//            listRequest.timestampLatest = timestampLatest;
//            listRequest.CacheGrade = CacheGradeFullThird;
//            [PacketConnection sendAsynchronous:listRequest delegate:[CacheManager defaultManager] context:@"insert"];
//        }
//    }
//}

+ (void)begin:(NSString *)sessionId packet:(PacketNameSpace)nameSpaces
{
    NSString *nameSpace;
    NSString *requestName;
    NSString *tableName;
    AIIListRequest *listRequest;
    
    // 1) 是否包含
    //    BOOL b = NO;
    // 2) 是否以List后缀
    BOOL b2 = NO;
    // 3) cacheSupporting == CacheSupportingFull ?
    BOOL b3 = NO;
    
    NSArray *mArray = @[kPacketNameSpaceArray];
    NSUInteger count = mArray.count;
    for (NSUInteger i = 0; i < count; i++) {
        // 一、全过滤法
        // NSUInteger match = nameSpaces & (1 << i);// 全过滤
        // if (match > 0) { // 或 match == 1 << i
        
        // 二、右移位法
        NSUInteger match = nameSpaces >> i;// 右移位
//        if (match % 2) {
        if (match & 1) {
            nameSpace = mArray[i];
            NSLog(@"nameSpace = %@", nameSpace);
            requestName = [nameSpace stringByAppendingString:@"Request"];
            listRequest = [[NSClassFromString(requestName) alloc] init];
            // b = [packetArray containsObject:nameSpace];
            b2 = [nameSpace hasSuffix:@"List"];
            b3 = listRequest.cacheSupporting == AIICacheSupportingFull ? YES : NO;
            
            if (b2 && b3) {
                tableName = [nameSpace stringByReplacingOccurrencesOfString:@"List" withString:@"Table"];
                
                // 1)获取缓存数据的最新[更新时间]
                Table *table = [[NSClassFromString(tableName) alloc] init];
                AIIEntity *item = [table latest];
                NSString *timestampLatest = item.timestampUpdate ? item.timestampUpdate : @"0" ;
                
                // 2)获取新增的数据
                // ListRequest *requestInsert = [[NSClassFromString(requestName) alloc] init];
                listRequest.timestampLatest = timestampLatest;
                listRequest.cache = AIICacheFullThird;
                [AIIPacketConnection sendAsynchronous:listRequest delegate:[AIICacheManager defaultManager] context:@"insert"];
            }
        }
    }
}

+ (void)beginWithPacket:(PacketNameSpace)nameSpaces
{
    NSString *nameSpace;
    NSString *requestName;
    NSString *tableName;
    AIIListRequest *listRequest;
    
    // 1) 是否包含
    //    BOOL b = NO;
    // 2) 是否以List后缀
    BOOL b2 = NO;
    // 3) cacheSupporting == CacheSupportingFull ?
    BOOL b3 = NO;
    
    NSArray *mArray = @[kPacketNameSpaceArray];
    NSUInteger count = mArray.count;
    for (NSUInteger i = 0; i < count; i++) {
        // 一、全过滤法
        // NSUInteger match = nameSpaces & (1 << i);// 全过滤
        // if (match > 0) { // 或 match == 1 << i
        
        // 二、右移位法
        NSUInteger match = nameSpaces >> i;// 右移位
        //        if (match % 2) {
        if (match & 1) {
            nameSpace = mArray[i];
            NSLog(@"nameSpace = %@", nameSpace);
            requestName = [nameSpace stringByAppendingString:@"Request"];
            listRequest = [[NSClassFromString(requestName) alloc] init];
            // b = [packetArray containsObject:nameSpace];
            b2 = [nameSpace hasSuffix:@"List"];
            b3 = listRequest.cacheSupporting == AIICacheSupportingFull ? YES : NO;
            
            if (b2 && b3) {
                tableName = [nameSpace stringByReplacingOccurrencesOfString:@"List" withString:@"Table"];
                
                // 1)获取缓存数据的最新[更新时间]
                Table *table = [[NSClassFromString(tableName) alloc] init];
                AIIEntity *item = [table latest];
                NSString *timestampLatest = item.timestampUpdate ? item.timestampUpdate : @"0" ;
                
                // 2)获取新增的数据
                // ListRequest *requestInsert = [[NSClassFromString(requestName) alloc] init];
                listRequest.timestampLatest = timestampLatest;
                listRequest.cache = AIICacheFullThird;
                [AIIPacketConnection sendAsynchronous:listRequest delegate:[AIICacheManager defaultManager] context:@"insert"];
            }
        }
    }
}

#pragma - mark PacketConnectionDelegate

- (void)packetConnectionFinished:(AIIPacketConnection *)connection
{
    
}

@end
