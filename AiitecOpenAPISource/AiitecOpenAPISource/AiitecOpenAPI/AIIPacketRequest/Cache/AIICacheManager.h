//
//  AIICacheManager.h
//  AAClient
//
//  Created by iMac on 13-7-11.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIPacketConnection.h"

typedef NS_OPTIONS(NSUInteger, PacketNameSpace) {
    PacketNameSpaceNone                 = 0,
    PacketNameSpaceNotificationList     = 1 << 0,
    PacketNameSpaceRegionList           = 1 << 1,
    PacketNameSpaceAddressbookList      = 1 << 2,
    PacketNameSpaceLandscapeList        = 1 << 3,
    PacketNameSpaceMotorcadeList        = 1 << 4,
    PacketNameSpaceVehicleList          = 1 << 5,
    PacketNameSpaceLineList             = 1 << 6,
    PacketNameSpaceSchedulingList       = 1 << 7,
    PacketNameSpaceOrderList            = 1 << 8,
    PacketNameSpaceFileList             = 1 << 9,
    PacketNameSpaceNewsList             = 1 << 10,
    PacketNameSpaceSchoolList           = 1 << 11,
    PacketNameSpaceSourceList           = 1 << 12,
    PacketNameSpaceCategoryList         = 1 << 13
};

#define kPacketNameSpaceArray   @"NotificationList", @"RegionList", @"AddressbookList", @"LandscapeList", @"MotorcadeList", \
                                @"VehicleList", @"LineList", @"SchedulingList", @"OrderList", @"FileList", \
                                @"NewsList",@"SchoolList",@"ConditionList",@"CategoryList"

#define START_CACHE YES

/** 缓存管理类.
 *
 *  1. 开关.开启/关闭缓存.
 *  2. 同步缓存(完全缓存).
 *  3. 按需缓存.支持离线下载(指定时间段).
 */
@interface AIICacheManager : NSObject <AIIPacketConnectionDelegate>

/// 1. 开关.开启/关闭缓存.
@property (nonatomic, assign) BOOL start;//!< 开启/关闭 缓存.


/// 2. 同步缓存(完全缓存).
///+ (void)begin:(NSString *)sessionId packet:(NSArray *)packetArray;
+ (void)begin:(NSString *)sessionId packet:(PacketNameSpace)nameSpaces;
+ (void)beginWithPacket:(PacketNameSpace)nameSpaces;

/// 3. 按需缓存.支持离线下载(指定时间段).



@end
