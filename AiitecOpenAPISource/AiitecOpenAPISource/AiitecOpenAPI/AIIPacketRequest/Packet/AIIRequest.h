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

/** AIIPacketType.
 *
 *  通讯协议类型.
 *
 */
typedef NS_ENUM(NSUInteger, AIIPacketType){
    AIIPacketTypeDefault,           //!< 默认.
    AIIPacketTypeList,              //!< 列表List.
    AIIPacketTypeDetails,           //!< 详情Details.
    AIIPacketTypeSubmit,            //!< 提交Submit.
    AIIPacketTypeCollectionSubmit,  //!< 数组提交CollectionSubmit.
    AIIPacketTypeUpdate,            //!< 更新Update.
    AIIPacketTypeSwitch,            //!< 开关Switch.
    //    AIIPacketTypeUpload,            //!< 上传Upload(图片/视频等).
};

/** AIIJSONCache.
 *
 *  查询类型通讯协议缓存级别.
 *
 */
typedef NS_ENUM(NSUInteger, AIIJSONCacheLevel){
    AIIJSONCacheLevelNone,          //!< 0不缓存。默认。
    AIIJSONCacheLevelFirst,         //!< 1完全缓存。数据量大，更新频繁1。仅安装APP后初始化时（或者版本升级）需要请求网络一次。例如：省市区。(暂不考虑)
    AIIJSONCacheLevelSecond,        //!< 2不完全缓存。数据量小，更新频繁2。APP每次启动或者从后台切换到前台时。如：CategoryList等。
    AIIJSONCacheLevelThird,         //!< 3按需缓存。数据量小，更新频繁3。每次都需要网络探测。如：以Details后缀的协议（包括：用户详情协议）
};

typedef NS_ENUM(NSUInteger, AIIJSONCacheReadWay){
    AIIJSONCacheReadWayDefault,       //!< 0 默认。
    AIIJSONCacheReadWayFirst,         //!< 1 不发起网络请求,直接读取「JSONCache文件缓存数据」.
    AIIJSONCacheReadWaySecond,        //!< 2 发起网络请求,若返回1020,再读取「JSONCache文件缓存数据」.
};


/// AIIRequest
/**  协议请求基类.
 *
 *  全部请求协议（Request后缀）都继承此基类.
 */
@interface AIIRequest : AIIIqPacket <ValueToDictionary>

/// timestampLatest:上一次请求时间,第一次初始化值为0; eg. @"2014-08-27 18:59:59"
@property (nonatomic, copy) NSString *timestampLatest;//!< timestampLatest:上一次请求时间,第一次初始化值为0; eg. @"2014-08-31 01:29:59"
/** 私有的加密值. */
@property (nonatomic, copy) NSString *md5;
@property (nonatomic, assign) AIICache cache;
@property (nonatomic, assign) AIICacheSupporting cacheSupporting;
@property (nonatomic, assign) AIIJSONCacheReadWay jsonCacheReadWay;

//- (AIICacheSupporting)cacheSupporting;
- (AIICacheWay)cacheWay;
- (AIIJSONCacheLevel)jsonCacheLevel;
- (NSString *)packetNickname;
- (NSString *)md5IncludeTimestampLatest:(BOOL)flag;


#pragma mark - Private

/**  把私有属性_jsonStringWithObjectString重置为空.
 *
 *  当发起协议请求时,请求队列中有一个或多个AIIRequest对象,当第一个AIIRequest协议请求返回状态为1002时,则需要重新获取SessionId,成功获取SessionId后队列中的全部AIIRequest对象需要重新加密、组包,所以需要将私有属性_jsonStringWithObjectString重置为空.
 */
- (void)jsonStringWithObjectStringSetNull;

@end
