//
//  AIIPacketJSONCacheObject.h
//  XGXSeller
//
//  Created by iMac on 16/3/11.
//  Copyright © 2016年 aiitec. All rights reserved.
//

#import "AIIEntity.h"

/** AIIPacketJSONCacheObject.
 *
 *  JSON缓存对象模型.缓存对象共分为三种:SQLiteCache(SQLite数据库缓存),FileCache(文件缓存),JSONCache(数据缓存).
 */
@interface AIIPacketJSONCacheObject : AIIEntity

/** 通讯协议真实发起网络请求的次数. */
@property (nonatomic, assign) NSUInteger count;
/** 特指界面调用通讯协议的次数. */
@property (nonatomic, assign) NSUInteger countOfRequest;

/** 子文件夹名称,也就是当前登录用户id. */
@property (nonatomic, copy) NSString *subfolder;
/** 私有的加密值（不含timestampLatest）.唯一. */
@property (nonatomic, copy) NSString *md5RemoveTimestampLatest;

/** 完整请求参数.jsonString JSON格式的字符串. */
@property (nonatomic, copy) NSString *jsonString;
/** 数据文件缓存的路径. */
@property (nonatomic, copy) NSString *cachesJSONPacketPath;

#pragma mark - Option 
/** 通讯协议命名空间. */
@property (nonatomic, copy) NSString *packetNameSpace;
/** 私有的加密值.唯一. */
@property (nonatomic, copy) NSString *md5;
/// timestampLatest:上一次请求时间,第一次初始化值为0; eg. @"2014-08-27 18:59:59"
@property (nonatomic, copy) NSString *timestampLatest;//!< timestampLatest:上一次缓存时间,第一次初始化值为0; eg. @"2014-08-31

@end
