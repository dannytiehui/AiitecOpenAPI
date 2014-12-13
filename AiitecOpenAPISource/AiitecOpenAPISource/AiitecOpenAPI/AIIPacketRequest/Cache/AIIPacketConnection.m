//
//  AIIPacketConnection.m
//  AAClient
//
//  Created by iMac on 13-6-27.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIPacketConnection.h"

#import "AIIFileCache.h"

#import "AIIListPacket.h"
#import "AIIDetailsPacket.h"
#import "Table.h"

#import "RegionTable.h"
#import "AIIRegionListPacket.h"
#import "AddressbookTable.h"
#import "AddressbookListPacket.h"

#import "AIIReferenceItemListPacket.h"
#import "SchoolTable.h"
#import "SchoolAliasesTable.h"
#import "DepartmentsTable.h"
#import "ProfessionalTable.h"
#import "IndustryTable.h"
#import "LabelUserGroupTable.h"
#import "LabelUserTable.h"


//#import "LoginViewController.h"

#define QUERY_CACHE request.cacheSupporting == AIICacheSupportingFull && request.cache == AIICacheNone

@interface AIIPacketConnection ()

@property (nonatomic, weak) id target;
@property (nonatomic) SEL action;
@property (nonatomic, weak) id<AIIPacketConnectionDelegate> delegate;
@property (nonatomic, strong) AIIRequest *request;
@property (nonatomic, strong) AIIResponse *response;
@property (nonatomic, weak) id context;
@property (nonatomic, weak) NSString *responseString;

+ (NSString *)responseClassName:(NSString *)className;
+ (NSString *)responseTableClassName:(NSString *)className;
+ (void)_sendAsynchronous:(AIIRequest *)request delegate:(id<PacketHttpConnectionDelegate>)delegate context:(id)context;

- (BOOL)judgeCacheHandle;
- (void)judgeCacheHandleFinished;

+ (AIIResponse *)queryCache:(AIIRequest *)request;
+ (AIIResponse *)queryCacheRegionList:(AIIRegionListRequest *)request table:(RegionTable *)table;
+ (AIIResponse *)queryCacheAddressbookList:(AddressbookListRequest *)request table:(AddressbookTable *)table;

@end


@implementation AIIPacketConnection

static NSMutableArray *_packetConnectionArray;

+ (NSString *)responseClassName:(NSString *)className
{
    return [className stringByReplacingOccurrencesOfString:@"Request" withString:@"Response"];
}

+ (NSString *)responseTableClassName:(NSString *)className
{
    NSString *suffix;
    if ([className hasSuffix:@"List"]) {
        suffix = @"List";
    }
    else if ([className hasSuffix:@"Details"]) {
        suffix = @"Details";
    }
    return [className stringByReplacingOccurrencesOfString:suffix withString:@"Table"];
}

+ (void)_sendAsynchronous:(AIIRequest *)request delegate:(id<PacketHttpConnectionDelegate>)newDelegate context:(id)context
{
    if (!_packetConnectionArray) {
        _packetConnectionArray = [[NSMutableArray alloc] init];
    }
    [_packetConnectionArray addObject:newDelegate];
    
    if (request.cacheSupporting == AIICacheSupportingNormal) {
        request.cache = AIICacheNormalFirst;
    }
    else if (request.cacheSupporting == AIICacheSupportingFull) {
        request.cache = AIICacheFullThird;
    }
    
//    NSLog(@"主线:%@", [request jsonStringWithObject]);
    [AIIPacketHttpConnection sendAsynchronous:request delegate:newDelegate context:context];
}

#pragma mark - Public Method

+ (AIIResponse *)sendSynchronous:(AIIRequest *)request
{
    AIIPacketConnection *connection = [[AIIPacketConnection alloc] init];
    connection.request = request;
    connection.response = [AIIPacketHttpConnection sendSynchronous:request];
    
    [connection judgeCacheHandle];
    
    return connection.response;
}

+ (void)sendAsynchronous:(AIIRequest *)request delegate:(id<AIIPacketConnectionDelegate>)delegate context:(id)context;
{
    AIIPacketConnection *connection = [[AIIPacketConnection alloc] init];
    connection.request = request;
    connection.context = context;
    connection.delegate = delegate;
    
    // 取缓存数据，直接返回
    if (QUERY_CACHE) {
        connection.response = [AIIPacketConnection queryCache:request];
        
        double delayInSeconds = 0.1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [connection.delegate packetConnectionFinished:connection];
        });
    }
    else {
        
//        if (!_packetConnectionArray) {
//            _packetConnectionArray = [[NSMutableArray alloc] init];
//        }
//        [_packetConnectionArray addObject:connection];
//        
//        if (request.cacheSupporting == CacheSupportingNormal) {
//            request.cacheGrade = CacheGradeNormalFirst;
//        }
//        else if (request.cacheSupporting == CacheSupportingFull) {
//            request.cacheGrade = CacheGradeFullThird;
//        }
//        
//        NSLog(@"主线:%@", [request toJSON]);
//        [AIIPacketHttpConnection sendAsynchronous:request delegate:connection context:context];
        
        [AIIPacketConnection _sendAsynchronous:request delegate:connection context:context];
    }
}

+ (void)sendAsynchronous:(AIIRequest *)request target:(id)target action:(SEL)action context:(id)context
{
    AIIPacketConnection *connection = [[AIIPacketConnection alloc] init];
    connection.request = request;
    connection.context = context;
    connection.target = target;
    connection.action = action;
    
    // 取缓存数据，直接返回
    if (QUERY_CACHE) {
        connection.response = [AIIPacketConnection queryCache:request];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [connection.target performSelector:connection.action withObject:connection];
#pragma clang diagnostic pop
    }
    else {
//        if (!_packetConnectionArray) {
//            _packetConnectionArray = [[NSMutableArray alloc] init];
//        }
//        [_packetConnectionArray addObject:connection];
//        
//        if (request.cacheSupporting == CacheSupportingNormal) {
//            request.cacheGrade = CacheGradeNormalFirst;
//        }
//        else if (request.cacheSupporting == CacheSupportingFull) {
//            request.cacheGrade = CacheGradeFullThird;
//        }
//        
//        NSLog(@"主线:%@", [request toJSON]);
//        [AIIPacketHttpConnection sendAsynchronous:request delegate:connection context:context];
        
        [AIIPacketConnection _sendAsynchronous:request delegate:connection context:context];
    }
}

+ (AIIResponse *)sendAsyn:(AIIRequest *)request delegate:(id<AIIPacketConnectionDelegate>)delegate context:(id)context;
{
    // 取缓存数据，直接返回
    if (QUERY_CACHE) {
        return [AIIPacketConnection queryCache:request];
    }
    
    // 1) 发送请求
    [AIIPacketConnection sendAsynchronous:request delegate:delegate context:context];
    
    // 2) 取缓存数据，直接返回
    return [AIIPacketConnection queryCache:request];
}

+ (AIIResponse *)sendAsyn:(AIIRequest *)request target:(id)target action:(SEL)action context:(id)context
{
    // 取缓存数据，直接返回
    if (QUERY_CACHE) {
        return [AIIPacketConnection queryCache:request];
    }
    
    // 1) 发送请求
    [AIIPacketConnection sendAsynchronous:request target:target action:action context:context];
    
    // 2) 取缓存数据，直接返回
    return [AIIPacketConnection queryCache:request];
}

+ (BOOL)removeCache
{
    [SQLiteConnection close];
    return [SQLiteConnection removeSQLiteCache];
}

#pragma mark - LoginDelegate

//- (void)loginDidFinish:(LoginViewController *)controller successfully:(BOOL)flag
//{
//    if (flag) {
//        UIWindow *window = [UIApplication sharedApplication].windows[0];
//        UINavigationController *nav = (UINavigationController *)window.rootViewController;
//        [nav popViewControllerAnimated:YES];
//    }
//}

#pragma mark - PacketHttpConnectionDelegate

- (void)packetRequestFinished:(AIIPacketHttpConnection *)connection
{
    self.response = connection.response;
    
    if ([self judgeCacheHandle]) {
        return;
    }
    
    if (self.delegate) {
//        if ([self.response.status isEqualToString:@"1100"]) {
//            UIWindow *window = [UIApplication sharedApplication].windows[0];
//            UINavigationController *nav = (UINavigationController *)window.rootViewController;
//            [nav popToRootViewControllerAnimated:NO];
//            [Bussiness sharedBussiness].loginUser = nil;
//            LoginViewController *controller = [[LoginViewController alloc] init];
//            controller.delegate = self;
//            [nav pushViewController:controller animated:NO];
//        }
//        else {
            [self.delegate packetConnectionFinished:self];
//        }
    }
    else if ([self.target respondsToSelector:self.action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.action withObject:self];
#pragma clang diagnostic pop
    }
    
    [_packetConnectionArray removeObject:self];
}

#pragma mark - Private

/**
 写入本地缓存
 
 cache=0,不缓存
 cache=1,与本地缓存比较,按需发起第二次请求
 cache=2,写入本地缓存,并获取本地缓存数据供页面使用
 
 获取本地[列表]缓存数据
 1) 得到SQLite表类
 2) 获取Collection集合数据
 3) 集合数据赋值给self.response.modelCollection
 4) 返回
 
 获取本地[明细]缓存数据
 1) 得到SQLite表类
 2) 获取Entity数据
 3) 集合数据赋值给self.response.[Entity]
 4) 返回
 */
- (BOOL)judgeCacheHandle
{
    BOOL b = NO;
    
//    if (self.request.cacheGrade == CacheGradeNone) {
    if (self.request.cacheSupporting == AIICacheSupportingNone) {
        return b;
    }
    
    NSString *className = self.request.nameSpace;
    NSString *suffix;
    if ([className hasSuffix:@"List"]) {
        suffix = @"List";
    }
    else if ([className hasSuffix:@"Details"]) {
        suffix = @"Details";
    }
    NSString *tableClassName = [className stringByReplacingOccurrencesOfString:suffix withString:@"Table"];
    Table *table = [[NSClassFromString(tableClassName) alloc] init];
    
    
    // 针对［闪优客］项目GoodsConditionsList协议文件缓存的特殊处理。
//    NSUInteger requestAction = ((AIIGoodsConditionsListRequest *)self.request).action;
//    if (self.request.cacheWay == CacheWayFile && requestAction != GoodsActionGroupBuying) {
//        NSString *filename = [self.response.nameSpace stringByAppendingString:[NSString stringWithFormat:@"_%d.plist", requestAction]];
//        
//        if ([@"1007" isEqualToString:self.response.status]) {
//            // 缓存可用
//            NSString *JSONString = [AIIFileCache stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:nil];
//
//            NSString *classNameString = NSStringFromClass(self.request.class);
//            classNameString = [classNameString stringByReplacingOccurrencesOfString:@"Request" withString:@"Response"];
//            self.response = [[NSClassFromString(classNameString) alloc] initWithJSONString:JSONString];
//        }
//        else if([@"0" isEqualToString:self.response.status]) {
//            // 写入到Caches/IqPacket/GoodsConditionsList.plist
//            NSData *data = [self.response.JSONString dataUsingEncoding:NSUTF8StringEncoding];
//            [AIIFileCache createIqPacketAtPath:filename contents:data];
//        }
//    }
//    if (self.request.cacheWay == CacheWayFile) {
//        return b;
//    }
    
    if (self.request.cache == AIICacheNormalFirst && [suffix isEqualToString:@"List"]) {
        AIIListResponse *listResponse = (AIIListResponse *)self.response;
        AIIListResponseQuery *listResponseQuery = (AIIListResponseQuery *)listResponse.query;
        NSString *ids = [table diff:listResponseQuery.modelCollection];
        NSLog(@"ids = %@", ids);
        AIIListRequest *listRequest = (AIIListRequest *)self.request;
        AIIListRequestQuery *listRequestQuery = (AIIListRequestQuery *)listRequest.query;
        
        if (listResponseQuery.total == 0) { // 清除全部数据
            [table delete];
        }
        else if (listResponseQuery.modelCollection.count < listRequestQuery.table.limit && listRequestQuery.table.page == 1) { // delete
            [table deleteExcept:listResponseQuery.modelCollection];
        }
        else {
            [table deleteRangeOfIdsExcept:listResponseQuery.modelCollection key:listRequestQuery.table.where.searchKey];
        }
        
        if (ids.length > 0) {
            b = YES;
            listRequest.cache = AIICacheNormalSecond;
            listRequestQuery.ids = ids;
            NSLog(@"List = %@", [listRequest jsonStringWithObject]);
            [self judgeCacheHandleFinished];
        }
        else {
//            listResponse.modelCollection = [table query:listRequest.page limit:listRequest.numberOfPage orderBy:listRequest.orderBy type:@"DESC" key:listRequest.searchKey];
        }
    }
    else if (self.request.cache == AIICacheNormalFirst && [suffix isEqualToString:@"Details"]) {
        AIIDetailsRequest *detailsRequest = (AIIDetailsRequest *)self.request;
        AIIQuery *detailsRequestQuery = (AIIQuery *)detailsRequest.query;
        AIIDetailsResponse *detailsResponse = (AIIDetailsResponse *)self.response;
        AIIEntityQuery *detailsResponseQuery = (AIIEntityQuery *)detailsResponse.query;
        
        AIIEntity *entity = [table query:detailsResponseQuery.entity.identifier timestampUpdate:detailsResponseQuery.entity.timestampUpdate];
        
        // delete
        if (detailsResponseQuery.entity.identifier == 0) {
            [table delete:detailsRequestQuery.identifier];
        }
        
        if (entity.identifier == 0) {
            b = YES;
            self.request.cache = AIICacheNormalSecond;
            NSLog(@"Details = %@", [_request jsonStringWithObject]);
            
            [self judgeCacheHandleFinished];
        }
        else {
            detailsResponseQuery.entity = entity;
        }
    }
    else if (self.request.cache == AIICacheNormalSecond && [suffix isEqualToString:@"List"]) {
        AIIListResponse *listResponse = (AIIListResponse *)self.response;
        AIIListResponseQuery *listResponseQuery = (AIIListResponseQuery *)listResponse.query;
        AIIModelCollection *collection = (AIIModelCollection *)listResponseQuery.modelCollection;
        [table replaceIntoCollection:collection];
        
//        AIIListRequest *listRequest = (AIIListRequest *)_request;
//        listResponse.modelCollection = [table query:listRequest.page limit:listRequest.numberOfPage orderBy:listRequest.orderBy type:@"DESC" key:listRequest.searchKey];
    }
    else if (self.request.cache == AIICacheNormalSecond && [suffix isEqualToString:@"Details"]) {
        AIIDetailsResponse *detailsResponse = (AIIDetailsResponse *)self.response;
        AIIEntityQuery *detailsResponseQuery = (AIIEntityQuery *)detailsResponse.query;
        [table replaceIntoItem:detailsResponseQuery.entity];
    }
    else if (self.request.cache == AIICacheFullThird && [suffix isEqualToString:@"List"]) {
        
        // 3) 获取 > timestampLatest 新数据
        //      3.1有,则把数据进行缓存;并判断total > numberOfPage ? 继续请求YES : 返回NO
        
        AIIListRequest *listRequest = (AIIListRequest *)self.request;
        AIIListRequestQuery *listRequestQuery = (AIIListRequestQuery *)listRequest.query;
        AIIListResponse *listResponse = (AIIListResponse *)self.response;
        AIIListResponseQuery *listResponseQuery = (AIIListResponseQuery *)listResponse.query;
        
        AIIModelCollection *collection = (AIIModelCollection *)listResponseQuery.modelCollection;
        [table replaceIntoCollection:collection];
        
        b = listResponseQuery.total > listRequestQuery.table.limit * listRequestQuery.table.page ? YES : NO;
        
        if (b) {
            listRequestQuery.table.page += 1;
            NSLog(@"3 = %@", [listRequest jsonStringWithObject]);
            [self judgeCacheHandleFinished];
        }
        else {
            b = YES;
            // 3.2获取需要删除的数据
            listRequest.cache = AIICacheFullFourth;
            NSLog(@"4 = %@", [listRequest jsonStringWithObject]);
            [self judgeCacheHandleFinished];
        }
    }
    else if (self.request.cache == AIICacheFullFourth && [suffix isEqualToString:@"List"]) {
        
        // 4) 检查 > timestampLatest 有无delete数据
        //      4.1有,则删除本地数据;并判断total > numberOfPage ? 继续请求YES : 返回NO
        
        AIIListRequest *listRequest = (AIIListRequest *)self.request;
        AIIListRequestQuery *listRequestQuery = (AIIListRequestQuery *)listRequest.query;
        AIIListResponse *listResponse = (AIIListResponse *)self.response;
        AIIListResponseQuery *listResponseQuery = (AIIListResponseQuery *)listResponse.query;
        
        AIIModelCollection *collection = (AIIModelCollection *)listResponseQuery.modelCollection;
        [table deleteInclude:collection];
        
        b = listResponseQuery.total > listRequestQuery.table.limit * listRequestQuery.table.page ? YES : NO;
        
        if (b) {
            listRequestQuery.table.page += 1;
            NSLog(@"4 = %@", [listRequest jsonStringWithObject]);
            [self judgeCacheHandleFinished];
        }
    }
    return b;
}

- (void)judgeCacheHandleFinished
{
    if (self.delegate) {
        [AIIPacketHttpConnection sendAsynchronous:self.request delegate:self context:self.context];
    }
    else if ([self.target respondsToSelector:self.action]) {
        [AIIPacketHttpConnection sendAsynchronous:self.request delegate:self context:self.context];
    }
    else {
        self.response =  [AIIPacketConnection sendSynchronous:self.request];
    }
}

+ (AIIResponse *)queryCache:(AIIRequest *)request
{
    AIIResponse *response = [[AIIResponse alloc] init];
    
    if (request.cache != AIICacheNormalFirst && request.cacheSupporting != AIICacheSupportingFull) {
        return nil;
    }
    
    NSString *className = request.nameSpace;
    NSString *suffix;
    if ([className hasSuffix:@"List"]) {
        suffix = @"List";
    }
    else if ([className hasSuffix:@"Details"]) {
        suffix = @"Details";
    }
    className = [className stringByReplacingOccurrencesOfString:suffix withString:@"Table"];
    Table *table = [[NSClassFromString(className) alloc] init];
    
    if ([request.nameSpace isEqualToString:@"ReferenceItemList"]) {
        response = [AIIPacketConnection queryCacheSchoolList:(AIIReferenceItemListRequest *)request table:(SchoolTable *)table];
    }
    else if ([request.nameSpace isEqualToString:@"RegionList"]) {
        response = [AIIPacketConnection queryCacheRegionList:(AIIRegionListRequest *)request table:(RegionTable *)table];
    }
    else if ([request.nameSpace isEqualToString:@"AddressbookList"]) {
        response = [AIIPacketConnection queryCacheAddressbookList:(AddressbookListRequest *)request table:(AddressbookTable *)table];
    }
//    else if ([request.nameSpace isEqualToString:@"SchoolList"] && [((SchoolListRequest *)request).city length]) {
//        response = [AIIPacketConnection queryCacheSchoolList:(SchoolListRequest *)request table:(SchoolTable *)table];
//    }
    else if ([suffix isEqualToString:@"List"]) {
//        AIIListRequest *listRequest = (AIIListRequest *)request;
        NSString *listResponseClassName = [AIIPacketConnection responseClassName:NSStringFromClass(request.class)];
        AIIListResponse *listResponse = [[NSClassFromString(listResponseClassName) alloc] init];
        AIIListResponseQuery *listResponseQuery = (AIIListResponseQuery *)listResponse.query;
//        listResponse.modelCollection = [table query:listRequest.page limit:listRequest.numberOfPage orderBy:listRequest.orderBy type:@"DESC" key:listRequest.searchKey];
        listResponseQuery.total = listResponseQuery.modelCollection.count;
        response = listResponse;
    }
    else if ([suffix isEqualToString:@"Details"]) {
        AIIDetailsRequest *detailsRequest = (AIIDetailsRequest *)request;
        AIIQuery *detailsRequestQuery = (AIIQuery *)detailsRequest.query;
        NSString *detailsResponseClassName = [AIIPacketConnection responseClassName:NSStringFromClass(request.class)];
        AIIDetailsResponse *detailsResponse = [[NSClassFromString(detailsResponseClassName) alloc] init];
        AIIEntityQuery *detailsResponseQuery = (AIIEntityQuery *)detailsResponse.query;
        
        detailsResponseQuery.entity = [table query:detailsRequestQuery.identifier];
        response = detailsResponse;
    }
    
//    response.nameSpace = request.nameSpace;
//    response.sessionId = request.sessionId;
    response.query.status = 0;
    response.query.desc = @"获取缓存数据成功";
    NSDate *now = [NSDate date];
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger interval = [timeZone secondsFromGMTForDate:now];
    NSDate *localeDate = [now dateByAddingTimeInterval:interval];
    response.query.timestamp = [NSString stringWithFormat:@"%@", localeDate];
    
    return response;
}

+ (AIIResponse *)queryCacheRegionList:(AIIRegionListRequest *)request table:(RegionTable *)table
{
    AIIRegionListResponse *response = [[AIIRegionListResponse alloc] init];
    
    if (request.query.parentId != 0) {
        response.query.modelCollection = [table queryWithParentId:request.query.parentId];
    }
    else if (request.query.identifier != 0) {
        response.query.modelCollection = [table queryWithIdentifier:request.query.identifier];
    }
    else if (request.query.name.length) {
        response.query.modelCollection = [table queryWithName:request.query.name];
    }
    else {
        response.query.modelCollection = [table query];
    }
    
    response.query.total = response.query.modelCollection.count;
    return response;
}

+ (AIIResponse *)queryCacheAddressbookList:(AddressbookListRequest *)request table:(AddressbookTable *)table
{
    AddressbookListResponse *response = [[AddressbookListResponse alloc] init];
//    response.modelCollection = (AIIModelCollection *)[table query:request.page limit:request.numberOfPage orderBy:request.orderBy type:@"DESC" key:request.searchKey groupId:request.addressbookGroupId];
    return response;
}

+ (AIIResponse *)queryCacheSchoolList:(AIIReferenceItemListRequest *)request table:(SchoolTable *)table
{
    AIIReferenceItemListResponse *response = [[AIIReferenceItemListResponse alloc] init];
    
    switch (request.query.action) {
        case AIIQueryActionFirst:
        {
            SchoolTable *t = [[SchoolTable alloc] init];
            response.query.modelCollection = [t queryWithTable:request.query.table];
        }
            
            break;
        case AIIQueryActionSecond:
        {
            SchoolAliasesTable *t = [[SchoolAliasesTable alloc] init];
            response.query.modelCollection = [t queryWithTable:request.query.table];
        }
            break;
        case AIIQueryActionThird:
        {
            DepartmentsTable *t = [[DepartmentsTable alloc] init];
            response.query.modelCollection = [t queryWithTable:request.query.table];
        }
            break;
        case AIIQueryActionFourth:
        {
            ProfessionalTable *t = [[ProfessionalTable alloc] init];
            response.query.modelCollection = [t queryWithTable:request.query.table];
        }
            break;
        case AIIQueryActionFifth:
        {
            IndustryTable *t = [[IndustryTable alloc] init];
            response.query.modelCollection = [t queryWithTable:request.query.table];
        }
            break;
        case AIIQueryActionSixth:
        {
            LabelUserGroupTable *t = [[LabelUserGroupTable alloc] init];
            response.query.modelCollection = [t queryWithTable:request.query.table];
        }
            break;
        case AIIQueryActionSeventh:
        {
            LabelUserTable *t = [[LabelUserTable alloc] init];
            response.query.modelCollection = [t queryWithTable:request.query.table];
        }
            break;
        default:
            break;
    }
    
    response.query.total = response.query.modelCollection.count;
    return response;
}

@end
