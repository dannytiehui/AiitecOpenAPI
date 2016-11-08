//
//  AIIPacketJSONCacheObjectManager.m
//  XGXSeller
//
//  Created by iMac on 16/3/14.
//  Copyright © 2016年 aiitec. All rights reserved.
//

#import "AIIPacketJSONCacheObjectManager.h"

@interface AIIPacketJSONCacheObjectManager ()

/**
 * @brief 判断AIIPacketJSONCacheObjectCollection对象中，是否包含AIIPacketJSONCacheObject？若包含，则更新；否则，添加一条新数据.
 *
 * @param packetJSONCacheObject AIIPacketJSONCacheObject对象.
 *
 */
- (void)updatePacketJSONCacheObjectCollection:(AIIPacketJSONCacheObject *)packetJSONCacheObject;

@end


@implementation AIIPacketJSONCacheObjectManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _subfolder = @"0";
        _finishedJSONCacheLevelSecondPacketRequestMutableArray = [[NSMutableArray alloc] init];
        _md5AndTimestampLatestMutableDictionary = [[NSMutableDictionary alloc] init];
        _packetJSONCacheObjectCollection = [[AIIPacketJSONCacheObjectCollection alloc] init];
        
        _packetJSONCacheObjectCollection.entityProperties = @[@"count", @"countOfRequest", @"subfolder", @"md5RemoveTimestampLatest",
                                                              @"jsonString", @"cachesJSONPacketPath",
                                                              @"packetNameSpace", @"md5", @"timestampLatest"];
        self.properties = @[@"subfolder", @"md5AndTimestampLatestMutableDictionary", @"packetJSONCacheObjectCollection"];
    }
    
    return self;
}

static NSMutableArray *_packetRequestArray;

+ (AIIPacketJSONCacheObjectManager *)shareInstance
{
    static AIIPacketJSONCacheObjectManager *instance = nil;
    
    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"AIIUserId"];
    if (![instance.subfolder isEqualToString:userId]) {
        NSLog(@"-_-%@, %@, %d", instance.subfolder, userId, [instance.subfolder isEqualToString:userId]);
        NSString *jsonCachePath = [NSString stringWithFormat:@"%@/%@.plist", [AIIUtility cachesPacketPathWithSubfolder:userId], NSStringFromClass(self.class)];
        instance = [[AIIPacketJSONCacheObjectManager alloc] initWithContentsOfFile:jsonCachePath];
        instance.subfolder = userId;
    }
    
    return instance;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:self.packetJSONCacheObjectCollection.key]) {
        [self.packetJSONCacheObjectCollection setObjectWithArray:value];
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"";
    
    k = @"packetJSONCacheObjectCollection";
    if ([dict objectForKey:k]) {
        [mutableDictionary setObject:[self.packetJSONCacheObjectCollection arrayWithObject] forKey:self.packetJSONCacheObjectCollection.key];
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    return dict;
}

#pragma mark - Public

- (void)beginWithPacketRequestArray:(NSMutableArray *)packetRequestArray
{
    _packetRequestArray = [packetRequestArray mutableCopy];
    
    for (AIIRequest *request in packetRequestArray) {
        request.timestampLatest = [_md5AndTimestampLatestMutableDictionary objectForKey:[request md5IncludeTimestampLatest:NO]];
        [AIIPacketConnection sendAsynchronous:request delegate:self context:nil];
    }
}

- (void)updatePacketJSONCacheObjectCollection:(AIIPacketJSONCacheObject *)packetJSONCacheObject
{
    BOOL includeObject = NO;
    AIIPacketJSONCacheObject *object = packetJSONCacheObject;
    
    for (AIIPacketJSONCacheObject *o in self.packetJSONCacheObjectCollection) {
        /// 我也不知道为什么要这样比较，总之用 [o.subfolder isEqualToString:object.subfolder] 会报错.
        BOOL bSubfolder = [[NSString stringWithFormat:@"%@", o.subfolder] isEqualToString:[NSString stringWithFormat:@"%@", object.subfolder]];
        if ([o.md5RemoveTimestampLatest isEqualToString:packetJSONCacheObject.md5RemoveTimestampLatest] && bSubfolder) {
            o.count ++;
            o.countOfRequest ++;
            o.timestampLatest = packetJSONCacheObject.timestampLatest;
            
            object = o;
            includeObject = YES;
            break;
        }
    }
    
    if (!includeObject) {
        object.count ++;
        object.countOfRequest ++;
        
        [self.packetJSONCacheObjectCollection addObject:object];
    }
}

- (void)updatePacketJSONCacheObjectCollectionWithPacketConnection:(AIIPacketConnection *)connection
{
    AIIPacketJSONCacheObject *object = [[AIIPacketJSONCacheObject alloc] init];
    object.subfolder = self.subfolder;
    object.md5RemoveTimestampLatest = [connection.request md5IncludeTimestampLatest:NO];

    NSUInteger status = connection.response.query.status;
    AIIJSONCacheReadWay jsonCacheReadWay = connection.request.jsonCacheReadWay;

    AIIJSONCacheLevel jsonCacheLevel = connection.request.jsonCacheLevel;
//    NSLog(@"jsonCacheLevel: %@, %lu", connection.request.nameSpace, (unsigned long)jsonCacheLevel);
    if (status == 0 && (jsonCacheLevel == AIIJSONCacheLevelSecond || jsonCacheLevel == AIIJSONCacheLevelThird)) { //!< 0.进行缓存.
        
        /** a) 获取缓存数据存储的文件名称.
         *
         *  文件缓存命名规则：“请求参数（去掉timestampLatest）md5加密后得到的32位字符串”+ “.json”。如：27ABD31D6E7DCFBA4F0A124C800982E0.json.
         *
         */
        
        /** b) 写入缓存文件.
         *
         *  存储目录为:/userId/xxxxx.json.
         *  注意：若用户未登录，则userId = 0; userId = subfolder.
         *
         */
        BOOL b = [connection.response writeToFileWithSubfolder:self.subfolder filename:[connection.request md5IncludeTimestampLatest:NO]];
        NSLog(@"JSONCache, writeToFile: %@, %d", connection.request.nameSpace, b);
        
        /// c) 更新缓存管理集合.
//        AIIPacketJSONCacheObject *object = [[AIIPacketJSONCacheObject alloc] init];
//        object.subfolder = self.subfolder;
//        object.md5RemoveTimestampLatest = [connection.request md5IncludeTimestampLatest:NO];
        
        object.jsonString = [connection.request jsonStringWithObject];
        object.cachesJSONPacketPath = [connection.response filePathWithSubfolder:self.subfolder filename:object.md5RemoveTimestampLatest];
        
        object.packetNameSpace = connection.request.nameSpace;
        object.md5 = connection.request.md5;
//        object.timestampLatest = [AIIUtility dateStringWithAbbreviation:@"GMT+0800" dateFormat:@"yyyy-MM-dd HH:mm:ss"];
        object.timestampLatest = connection.response.query.timestamp;
        
        [self updatePacketJSONCacheObjectCollection:object];
        
        /// d) 更新md5AndtimestampLatest.
        NSString *key = [connection.request md5IncludeTimestampLatest:NO];
        [self.md5AndTimestampLatestMutableDictionary setObject:object.timestampLatest forKey:key];
    }
    //!< 1.更新:页面调用计数器 || 2.更新:页面调用计数器、网络请求计数器.
    else if (jsonCacheReadWay == AIIJSONCacheReadWayFirst || jsonCacheReadWay == AIIJSONCacheReadWaySecond) {
        for (AIIPacketJSONCacheObject *o in self.packetJSONCacheObjectCollection) {
            /// 我也不知道为什么要这样比较，总之用 [o.subfolder isEqualToString:object.subfolder] 会报错.
            BOOL bSubfolder = [[NSString stringWithFormat:@"%@", o.subfolder] isEqualToString:[NSString stringWithFormat:@"%@", object.subfolder]];
            if ([o.md5RemoveTimestampLatest isEqualToString:object.md5RemoveTimestampLatest] && bSubfolder) {
                o.count ++;
                if (jsonCacheReadWay == AIIJSONCacheReadWaySecond) {
                    o.countOfRequest ++;
                }
                break;
            }
        }
    }
    else { //!< 3.请求数据出现异常,未知错误.
//        NSLog(@"updatePacketJSONCacheObjectCollectionWithPacketConnection,缓存失败.%@, %lu. \r\n%@", connection.request.nameSpace, connection.response.query.status, connection.response.query.desc);
    }
}

- (void)save
{
    // 1.保存到文件.
    BOOL b = [self writeToFile];
    NSLog(@"savePacketJSONCacheObjectManager:%d", b);
    
    // 2.执行相关清理及初始化操作.
    [self.finishedJSONCacheLevelSecondPacketRequestMutableArray removeAllObjects];
    
    // 3.当用户登出时，若重新登录的用户为之前的用户，则缓存时间继续有效；若为不同的用户，则在shareInstance方法中会初始化.
//    [self.md5AndTimestampLatestMutableDictionary removeAllObjects];
}

- (BOOL)writeToFile
{
    NSDictionary *dict = [self dictionaryWithValuesForKeys:self.keys];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@.plist", [AIIUtility cachesPacketPathWithSubfolder:[self subfolder]], NSStringFromClass(self.class)];
    return [dict writeToFile:filePath atomically:YES];
}

- (BOOL)clear
{
    [self.finishedJSONCacheLevelSecondPacketRequestMutableArray removeAllObjects];
    [self.md5AndTimestampLatestMutableDictionary removeAllObjects];
    
    return [AIIUtility removeItemAtPath:[AIIUtility cachesPacketPathWithSubfolder:@""]];
}

+ (unsigned long long)folderSize
{
    NSString *subfolder = [AIIUtility cachesPacketPathWithSubfolder:@""];
    return [AIIUtility folderSizeAtPath:subfolder];
}

#pragma mark - AIIPacketConnectionDelegate

- (void)packetConnectionFinished:(AIIPacketConnection *)connection
{
    [_packetRequestArray removeObject:connection.request];
    
    if (!_packetRequestArray.count) {
        
    }
}

@end
