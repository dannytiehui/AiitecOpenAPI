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
/** 私有的加密值. */
@property (nonatomic, copy) NSString *md5;
@property (nonatomic, assign) AIICache cache;
@property (nonatomic, assign) AIICacheSupporting cacheSupporting;

//- (AIICacheSupporting)cacheSupporting;
- (AIICacheWay)cacheWay;
- (NSString *)packetNickname;


#pragma mark - Private

/**  把私有属性_jsonStringWithObjectString重置为空.
 *
 *  当发起协议请求时,请求队列中有一个或多个AIIRequest对象,当第一个AIIRequest协议请求返回状态为1002时,则需要重新获取SessionId,成功获取SessionId后队列中的全部AIIRequest对象需要重新加密、组包,所以需要将私有属性_jsonStringWithObjectString重置为空.
 */
- (void)jsonStringWithObjectStringSetNull;

@end
