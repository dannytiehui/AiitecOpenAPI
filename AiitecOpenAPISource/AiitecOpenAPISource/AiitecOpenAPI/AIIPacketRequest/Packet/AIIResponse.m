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

/// 重写父类方法
- (id)initWithContentsOfFile
{
    if (self = [super initWithContentsOfFile]) {
        self.query.status = Cache_Packet_STATUS;
        self.query.desc = Cache_Packet_DESC;
    }
    return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    /// 子类实现
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    /// 子类实现
    return self;
}

#pragma mark - Public

/**
 *  @brief 「重写父类方法」将服务器响应的数据(self.JSONString)写入(缓存)到文件.
 *
 *  @return 写入(缓存)状态.
 */
- (BOOL)writeToFile
{
    NSDictionary *dict = [AIIUtility dictionaryWithJSONString:self.JSONString];
    return [dict writeToFile:self.filePath atomically:YES];
}

- (NSString *)filePathWithSubfolder:(NSString *)userId filename:(NSString *)md5
{
    return [NSString stringWithFormat:@"%@/%@_%@.json", [AIIUtility cachesPacketPathWithSubfolder:userId], self.nameSpace, md5];
}

- (BOOL)writeToFileWithSubfolder:(NSString *)userId filename:(NSString *)md5
{
    NSDictionary *dict = [AIIUtility dictionaryWithJSONString:self.JSONString];
    return [dict writeToFile:[self filePathWithSubfolder:userId filename:md5] atomically:YES];
}

@end
