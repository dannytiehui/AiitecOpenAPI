//
//  AIIPacketRequest.m
//  AII
//
//  Created by iMac on 13-12-21.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIPacketRequest.h"
#import "AIIFileCache.h"

@interface AIIPacketRequest ()

@property (nonatomic, strong) NSMutableDictionary *settingDictionary;

+ (NSString *)settingPlistPath;

@end



@implementation AIIPacketRequest

+ (AIIPacketRequest *)sharedAIIPacketRequest
{
    static AIIPacketRequest *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AIIPacketRequest alloc] init];
    });
    return instance;
}

+ (NSString *)settingPlistPath
{
    static NSString *path = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        path = [[AIIUtility cachesPacketPath] stringByAppendingPathComponent:@"packetsetting.plist"];
    });
    return path;
}

#pragma -mark setting.plist
+ (id)packetSetting:(AIIPacketSetting)key;
{
    AIIPacketRequest *packetRequest = [AIIPacketRequest sharedAIIPacketRequest];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[AIIPacketRequest settingPlistPath]];
        if (dic) {
            packetRequest.settingDictionary = [dic mutableCopy];
        }
        else {
            // Default
            packetRequest.settingDictionary = [[NSMutableDictionary alloc] init];
            [AIIPacketRequest packetSetting:AIIPacketSettingNotification value:[NSNumber numberWithBool:YES]];
            [AIIPacketRequest packetSetting:AIIPacketSettingViaWWAN value:[NSNumber numberWithBool:YES]];
        }
    });
    return packetRequest.settingDictionary[[NSString stringWithFormat:@"%lu", (unsigned long)key]];
}

+ (void)packetSetting:(AIIPacketSetting)key value:(id)value;
{
    AIIPacketRequest *packetRequest = [AIIPacketRequest sharedAIIPacketRequest];
    packetRequest.settingDictionary[[NSString stringWithFormat:@"%lu", (unsigned long)key]] = value;
    [packetRequest.settingDictionary writeToFile:[AIIPacketRequest settingPlistPath] atomically:YES];
}

@end
