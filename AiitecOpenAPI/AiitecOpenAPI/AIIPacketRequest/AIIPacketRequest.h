//
//  AIIPacketRequest.h
//  AAClient
//
//  Created by iMac on 13-6-18.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIPacketConfig.h"
#import "AIIPacketManager.h"
#import "AIIUtility.h"

#import "AIISessionPacket.h"

#pragma mark - 基本
#import "AIIFileHttpConnection.h"
#import "AIIPacketHttpConnection.h"

#import "AIICacheManager.h"
#import "AIIFileConnection.h"
#import "AIIPacketConnection.h"

#pragma mark - Setting.plist
typedef NS_ENUM(NSUInteger, AIIPacketSetting){
    AIIPacketSettingDefault,
    AIIPacketSettingNotification,    //!< 通知推送（默认开启）
    AIIPacketSettingViaWWAN,         //!< 启用蜂窝网络（2G／3G／4G）加载图片（默认开启）
    AIIPacketSettingAutoShare        //!< (下订单后)自动分享
};

/**
 
 */
@interface AIIPacketRequest : NSObject

+ (id)packetSetting:(AIIPacketSetting)key;
+ (void)packetSetting:(AIIPacketSetting)key value:(id)value;

@end



