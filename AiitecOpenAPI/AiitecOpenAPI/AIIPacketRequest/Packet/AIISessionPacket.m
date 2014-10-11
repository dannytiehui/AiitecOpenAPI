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
        self.deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:DeviceTokenKey];
        self.deviceType = AIIDeviceTypeIos;
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
    }
    else {
        [super setValue:value forKey:key];
    }
}

@end
