//
//  AIISessionPacket.m
//  AAClient
//
//  Created by iMac on 13-5-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIISessionPacket.h"

@implementation AIISessionRequestQuery

- (id)init
{
    if (self = [super init]) {
        NSDictionary *infoDictionary = [NSBundle mainBundle].infoDictionary;
        CGSize size = [UIScreen mainScreen].bounds.size;
        float scale = [UIScreen mainScreen].scale;
        CGSize resolution = CGSizeApplyAffineTransform(size, CGAffineTransformMakeScale(scale, scale));
        
        NSString *screenSize = @"3.5";
        if (size.height == 568) {
            screenSize = @"4.0";
        }
        else if (size.height == 1334) {
            screenSize = @"4.7";
        }
        else if (size.height == 2208) {
            screenSize = @"5.5";
        }
        
        self.version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        self.lang = AIILANGzh_CN;
        self.model = [UIDevice currentDevice].model;
        self.resolution = [NSString stringWithFormat:@"%.0f*%.0f", resolution.width, resolution.height]; //!> @"640*1136";
        self.screenSize = screenSize;
        self.deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceId"];
        self.deviceType = AIIDeviceTypeIOS;
        if (!self.deviceToken) {
            self.deviceToken = [AIIUtility arc4random:32 stringType:(AIIStringTypeNumber | AIIStringTypeUppercase | AIIStringTypeLowercase)];
            self.deviceType = AIIDeviceTypeTemporary;
            
            // 修复:当升级后,新版本无法获取旧版本存储的设备号问题.注意,一定要用@"deviceId",不能用DeviceTokenKey常量,否则也无法获取. 2016-02-22 Danny.
            [[NSUserDefaults standardUserDefaults] setObject:self.deviceToken forKey:@"deviceId"];
        }
    }
    return self;
}

@end



@implementation AIISessionResponseQuery
@end



@implementation AIISessionRequest
@end


@implementation AIISessionResponse

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"s"]) {
        [self setValue:value forKey:@"sessionId"];
        
        /// sessionId保存方案.
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:@"sessionId"];
        
        /// version需要同时保存,用于在启动APP时判断当前版本号是否与保存的版本号相等,否则重新获取sessionId.
        /// 解决的问题:当版本号从1.0升级到2.0时,需要重新获取sessionId,用于防止服务器对应的协议接口发生重大变化时无法识别的严重BUG(2015-12-02).
        [[NSUserDefaults standardUserDefaults] setObject:[AIIUtility currentVersion] forKey:@"version"];
    }
    else {
        [super setValue:value forKey:key];
    }
}

@end
