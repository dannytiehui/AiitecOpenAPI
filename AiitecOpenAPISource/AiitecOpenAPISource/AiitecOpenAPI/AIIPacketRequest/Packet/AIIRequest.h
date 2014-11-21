//
//  AIIRequest.h
//  AAClient
//
//  Created by iMac on 13-5-13.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIIqPacket.h"

typedef NS_ENUM(NSUInteger, AIICacheSupporting){
    AIICacheSupportingNone,    //!< 0不缓存.
    AIICacheSupportingNormal,  //!< 1按需缓存.
    AIICacheSupportingFull,    //!< 2完全缓存.
    AIICacheSupportingFile     //!< 3文件缓存（富媒体:图片/视频/音频...）.
};

typedef NS_ENUM(NSUInteger, AIICacheWay){
    AIICacheWayFile = 1,       //!< 1文件(如:plist.系统暂只支持完全更新缓存).
    AIICacheWaySQLite          //!< 2SQLite(默认).
};

typedef NS_ENUM(NSUInteger, AIICache){
    AIICacheNone,             //!< 0默认.
    AIICacheNormalFirst,      //!< 1[按需缓存]获取id/timestamp_update数组.
    AIICacheNormalSecond,     //!< 2[按需缓存]获取ids数据明细.
    AIICacheFullThird,        //!< 3[完全缓存]获取 > timestampLatest 新数据[仅针对列表].
    AIICacheFullFourth        //!< 4[完全缓存]获取 > timestampLatest且delete数据[仅针对列表].
};

/// AIIRequest
/**  协议请求基类.
 *
 *  全部请求协议（Request后缀）都继承此基类.
 */
@interface AIIRequest : AIIIqPacket <ValueToDictionary>

/// timestampLatest:上一次请求时间,第一次初始化值为0; eg. @"2014-08-27 18:59:59"
@property (nonatomic, copy) NSString *timestampLatest;//!< timestampLatest:上一次请求时间,第一次初始化值为0; eg. @"2014-08-31 01:29:59"
@property (nonatomic, assign) AIICache cache;
@property (nonatomic, assign) AIICacheSupporting cacheSupporting;

//- (AIICacheSupporting)cacheSupporting;
- (AIICacheWay)cacheWay;
- (NSString *)packetNickname;

@end
