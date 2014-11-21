//
//  AIISessionPacket.h
//  AAClient
//
//  Created by iMac on 13-5-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

typedef NS_ENUM(NSUInteger, AIILANG){
    AIILANGzh_CN = 2502,
    AIILANGzh_HK = 3076,
    AIILANGen_US = 1033
};

typedef NS_ENUM(NSUInteger, AIIDeviceType){
    AIIDeviceTypeUnknown       = 0,
    AIIDeviceTypeIOS           = 1 << 0,
    AIIDeviceTypeAndroid       = 1 << 1,
    AIIDeviceTypeWindowsPhone  = 1 << 2
};

@interface AIISessionRequestQuery : AIIQuery

/** 协议版本. */
@property (nonatomic, copy) NSString *version;
/** 语言. */
@property (nonatomic, assign) AIILANG lang;
/** 手机型号:如iPhone4,iPad2,Android. */
@property (nonatomic, copy) NSString *model;
/** 手机屏幕分辨率:320*640,640*1136,750*1334,1242*2208. */
@property (nonatomic, copy) NSString *resolution;
/** 屏幕尺寸. */
@property (nonatomic, copy) NSString *screenSize;
/** 设备号. */
@property (nonatomic, copy) NSString *deviceToken;
/** 设备类型. */
@property (nonatomic, assign) AIIDeviceType deviceType;
/** 设备信息字符串. */
@property (nonatomic, copy) NSString *info;

@end



@interface AIISessionResponseQuery : AIIQuery

@property (nonatomic, copy) NSString *expire;

@end



@interface AIISessionRequest : AIIRequest

@property (nonatomic, strong) AIISessionRequestQuery *query;

@end



@interface AIISessionResponse : AIIResponse

@property (nonatomic, copy) NSString *sessionId;
@property (nonatomic, strong) AIISessionResponseQuery *query;

@end
