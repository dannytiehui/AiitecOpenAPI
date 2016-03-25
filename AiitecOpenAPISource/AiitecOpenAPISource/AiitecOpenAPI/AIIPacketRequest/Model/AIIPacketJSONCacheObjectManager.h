//
//  AIIPacketJSONCacheObjectManager.h
//  XGXSeller
//
//  Created by iMac on 16/3/14.
//  Copyright © 2016年 aiitec. All rights reserved.
//

#import "AIIPacketJSONCacheObjectCollection.h"
#import "AIIPacketConnection.h"

/** AIIPacketJSONCacheObjectManager（单例）
 *
 *  通讯协议缓存管理类.
 *
 *  注意事项:
 *  1.APP激活时(或安装后第一次启动).
 *  2.切换用户后,对缓存数据的影响及处理.
 *  3.发起请求时,缓存协议的检测:
 *      a)判断缓存是否存在?存在则获取TimestampLatest
 *      b)判断 (AIIJSONCacheLevel == AIIJSONCacheLevelSecond && AIIPacketJSONCacheObject的finishedJSONCacheLevelSecondPacketRequestMutableArray是否包含)
 *             若结果为:YES发起网络请求,NO则直接读取缓存.
 *      c)若无网络，则直接读取缓存.
 *  4.获取到网络响应数据后，默认对查询类型(List/Details)的通讯协议全部进行文件缓存.
 *
 */
@interface AIIPacketJSONCacheObjectManager : AIIEntity <AIIPacketConnectionDelegate>

/** 子文件夹名称，用于根据用户id，进行分开缓存. 也就是当前登录用户id.默认@"0",当切换用户时需要重新赋值. */
@property (nonatomic, copy) NSString *subfolder;
/** 第一次启动APP(或从后台切换到前台)时,已经完成的「不完全缓存」通讯协议的网络请求 的数组. */
@property (nonatomic, strong) NSMutableArray *finishedJSONCacheLevelSecondPacketRequestMutableArray;
@property (nonatomic, strong) NSMutableDictionary *md5AndTimestampLatestMutableDictionary;

@property (nonatomic, strong) AIIPacketJSONCacheObjectCollection *packetJSONCacheObjectCollection;

+ (AIIPacketJSONCacheObjectManager *)shareInstance;

/**
 * @brief 执行需要进行「不完全缓存」的全部通讯协议,此处特指:AIIJSONCacheLevelSecond级别的协议对象.
 *
 * @param packetRequestArray AIIRequest对象的数组.
 *
 */
- (void)beginWithPacketRequestArray:(NSMutableArray *)packetRequestArray;

/**
 * @brief 更新packetJSONCacheObjectCollection. 
 *      判断AIIPacketJSONCacheObjectCollection对象中，是否包含AIIPacketJSONCacheObject？若包含，则更新；否则，添加一条新数据.
 *
 * @param packetJSONCacheObject AIIPacketJSONCacheObject对象.
 *
 */
- (void)updatePacketJSONCacheObjectCollectionWithPacketConnection:(AIIPacketConnection *)packetConnection;

/**
 * @brief 读取缓存数据.
 *
 * @param packetJSONCacheObject AIIPacketJSONCacheObject对象.
 *
 * @return 返回JSON格式的字符串.
 *
 */
//- (NSString *)stringWithJSONCacheContentsOfFile:(AIIPacketJSONCacheObject *)packetJSONCacheObject;

/**
 *  @brief 保存AIIPacketJSONCacheObjectManager对象. 执行相应操作:1)保存当前对象到文件;2)执行相关清理及初始化操作.
 *
 */
- (void)save;

/**
 *  @brief  将AIIPacketJSONCacheObjectCollection集合对象写入(缓存)到文件.
 *
 *  @return 写入(缓存)状态.
 */
- (BOOL)writeToFile;

/**
 *  @brief  清空缓存数据.
 *
 *  @return 清空(缓存)状态.
 */
- (BOOL)clear;

/**
 *  @brief  获取JSONCache大小.
 *
 *  @return 缓存JSONCache大小.
 */
+ (unsigned long long)folderSize;

@end
