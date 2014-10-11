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
    AIIDeviceTypeIos           = 1 << 0,
    AIIDeviceTypeAndroid       = 1 << 1,
    AIIDeviceTypeWindowsPhone  = 1 << 2
};

@interface AIISessionRequestQuery : AIIQuery

@property (nonatomic, copy) NSString *version;          //!< 协议版本
@property (nonatomic, assign) AIILANG lang;             //!< 语言
@property (nonatomic, copy) NSString *model;            //!< 手机型号:如iphone4,ipad2,android.
@property (nonatomic, copy) NSString *resolution;       //!< 手机屏幕分辨率:640*1136
@property (nonatomic, copy) NSString *screenSize;       //!< 屏幕尺寸
@property (nonatomic, copy) NSString *deviceToken;      //!< 设备号
@property (nonatomic, assign) AIIDeviceType deviceType; //!< 设备类型
@property (nonatomic, copy) NSString *info;             //!< 设备信息字符串

@end



@interface AIISessionResponseQuery : AIIQuery

@property (nonatomic, copy) NSDate *expire;

@end



@interface AIISessionRequest : AIIRequest

@property (nonatomic, strong) AIISessionRequestQuery *query;

@end



@interface AIISessionResponse : AIIResponse

@property (nonatomic, copy) NSString *sessionId;
@property (nonatomic, strong) AIISessionResponseQuery *query;

@end
