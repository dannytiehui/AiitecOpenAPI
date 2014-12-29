//
//  ViewController.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14-9-26.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "ViewController.h"
#import "AIIFileCache.h"

#include <stdlib.h>
#include <stdio.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    [[NSUserDefaults standardUserDefaults] setObject:@"py108ouc7comfaqjfst8w4fd5gze4221" forKey:@"sessionId"];
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"sessionId"];
    
//    [[NSUserDefaults standardUserDefaults] setObject:@"20141111111111000" forKey:DeviceTokenKey];
    
//    [self testModelCollection];
    
//    [self testRegionListRequest];
//    [self testCacheRegionListRequest];

//    [self testDeviceTokenSwitchRequest];
//    [self testMessageSubmitRequest];
//    [self testMessageListRequest];
//    [self testSMSCodeRequest];
//    [self testAdListRequest];
//    [self testSettingRequest];
//    [self testReferenceItemListRequest];
//    [self testUploadImageRequest];//!< Collection
//    [self testUploadFilesRequest];//!< Collection
//    [self testDeleteActionRequest];
//    [self testCategoryListRequest];

//    [self testUserLoginRequest];
//    [self testUserLogoutRequest];
//    [self testUserRegisterSubmitRequest];//!< Entity
//    [self testUserBindMobileRequest];
//    [self testUserUploadImageRequest];
//    [self testUserUpdatePasswordRequest];
//    [self testUserOperateListRequest];
//    [self testUserResetPasswordRequest];
    
//    [self testSynchronousUserDetailsRequest];//!< 测试同步请求.
//    [self testUserDetailsRequest];
    [self testUserUpdateRequest];
//    [self testRankListRequest];
//    [self testRecordListRequest];

//    [self testArticleListRequest];

//    [self testPaySubmitRequest];
//    [self testPointExchangeSubmitRequest];

//    [self testEventListRequest];
//    [self testEventJoinRequest];

//    [self testTaskListRequest];//!< List
//    [self testTaskDetailsRequest];//!< Details
//    [self testTaskSubmitRequest];
//    [self testTaskEvaluateCollectionSubmitRequest];
//    [self testTaskStatusUpdateRequest];
//    [self testTaskReportSubmitRequest];
//    [self testFetchRankRequest];
//
//    [self testOrderStatusUpdateRequest];
//    [self testOrderCommentSubmitRequest];
//    [self testOrderComplaintSubmitRequest];
//
//    [self testPointSubmitRequest];
//    [self testPointDetailsRequest];
//
//    [self testWishSubmitRequest];
//    [self testPositionUpdateRequest];
//    [self testFetchPositionRequest];
//    [self testCoordinateCollectionSubmitRequest];
    
//    NSLog(@"cachesPath:%@", [AIIUtility cachesPath]);
    
//    NSString *randomString = [[NSString alloc] init];
//    NSArray *baseArray = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"];
//    int len = (unsigned int)[baseArray count];
//    NSLog(@"len:%d", len);
//    int length = 32;
//    
//    for (int i = 0; i< length; i ++){
//        int index = arc4random_uniform(len);
//        randomString = [randomString stringByAppendingString:baseArray[index]];
//        NSLog(@"%d, %@, %@", index, baseArray[index], randomString);
//    }
//    NSLog(@"%lu, %@", randomString.length, randomString);

    
//    NSString *randomString;
//    randomString = [AIIUtility arc4random:32 stringType:AIIStringTypeNumber];
//    NSLog(@"1.%@", randomString);
//    randomString = [AIIUtility arc4random:32 stringType:AIIStringTypeUppercase];
//    NSLog(@"2.%@", randomString);
//    randomString = [AIIUtility arc4random:32 stringType:AIIStringTypeLowercase];
//    NSLog(@"3.%@", randomString);
//    randomString = [AIIUtility arc4random:32 stringType:AIIStringTypeNumber | AIIStringTypeUppercase];
//    NSLog(@"4.%@", randomString);
//    randomString = [AIIUtility arc4random:32 stringType:AIIStringTypeNumber | AIIStringTypeLowercase];
//    NSLog(@"5.%@", randomString);
//    randomString = [AIIUtility arc4random:32 stringType:AIIStringTypeUppercase | AIIStringTypeLowercase];
//    NSLog(@"6.%@", randomString);
//    randomString = [AIIUtility arc4random:32 stringType:AIIStringTypeNumber | AIIStringTypeUppercase | AIIStringTypeLowercase];
//    NSLog(@"7.%@", randomString);
    
    // 十进制转二进制
    
//    NSBundle *bundle = [NSBundle mainBundle];
//    NSString *path = [bundle pathForResource:@"AiitecOpenAPI" ofType:@"plist"];
//    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
//    NSArray *list = [dict objectForKey:@"array"];
//    for (NSUInteger i = 0, len = [list count]; i < len; i++) {
//        NSLog(@"%@", [list objectAtIndex:i]);
//    }
//    ;
//    NSError *error;
//    NSString *path2 = [bundle pathForResource:@"AII_Namespace_Packet_h" ofType:@""];
//    NSString *string = [NSString stringWithContentsOfFile:path2 encoding:NSUTF8StringEncoding error:&error];
//    if (error) {
//        NSLog(@"%@", error);
//    }
//    else {
//        NSLog(@"%@", string);
//    }
//    
//    NSString *nameSpace = @"UserDetails";
//    NSString *a = [string stringByReplacingOccurrencesOfString:@"_Namespace_" withString:nameSpace];
//    NSData *data =  [a dataUsingEncoding:NSUTF8StringEncoding];
//    
//    // 写入文件
//    BOOL b = [AIIFileCache createIqPacketAtPath:nameSpace contents:data];
//    NSLog(@"b:%d", b);
    
    
    
    // Entity
//    NSArray *entityArray = @[@"Join", @"Operate", @"Remind"];
//    BOOL b = [AIIFileCache createIqPacketWithEntityArray:entityArray];

    // Default
//    BOOL b = [AIIFileCache createIqPacketWithNamespace:@"TaskJoinSwitch" template:AIITemplateDefault];
//    NSArray *namespaceArray = @[@"TaskOperateSwitch",@"WeiboOperateSwitch",@"FetchExecutingOrders",@"RemindBadgeNumber",@"RemindRemove"];

    // List
//    NSArray *namespaceListArray = @[@"TaskJoin", @"TaskEvaluate", @"TaskComment", @"TaskOperate", @"TaskReport", @"Weibo", @"WeiboOperate", @"WeiboComment", @"Remind"];
//    BOOL b = [AIIFileCache createIqPacketWithNamespaceArray:namespaceListArray template:AIITemplateList];
    
    // Details
//    NSArray *namespaceDetailsArray = @[@"Weibo"];
//    BOOL b = [AIIFileCache createIqPacketWithNamespaceArray:namespaceDetailsArray template:AIITemplateDetails];
    
    // Submit
//    NSArray *namespaceSubmitArray = @[@"TaskComment", @"TaskReport", @"TaskReportReply", @"Weibo"];
//    BOOL b = [AIIFileCache createIqPacketWithNamespaceArray:namespaceSubmitArray template:AIITemplateSubmit];
    
    // CollectionSubmit
//    NSArray *namespaceCollectionSubmitArray = @[@"TaskEvaluate"];
//    BOOL b = [AIIFileCache createIqPacketWithNamespaceArray:namespaceCollectionSubmitArray template:AIITemplateCollectionSubmit];
    
    // Switch
//    NSArray *namespaceSwitchArray = @[@"TaskOperate",@"WeiboOperate"];
//    BOOL b = [AIIFileCache createIqPacketWithNamespaceArray:namespaceSwitchArray template:AIITemplateSwitch];
    
//    NSLog(@"b:%d", b);
    
    

    // 十进制转二进制
//    NSLog(@"%@", [AIIUtility toBinarySystemWithDecimalSystem:@20141209]);
//    NSLog(@"%@", [AIIUtility toDecimalSystemWithBinarySystem:@"1001100110101010010011001"]);
//    
//    NSLog(@"1.%@", [NSDate date]);
//
//    NSString *dateString = [AIIUtility dateStringWithAbbreviation:@"GMT+0800" dateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
//    NSLog(@"5.%@", dateString);
//    dateString = [AIIUtility dateStringWithAbbreviation:@"GMT+0800" dateFormat:@"yyyyMMdd HH:mm:ss zzz"];
//    NSLog(@"5.%@", dateString);
    
    // 加密
//    NSLog(@"6.%@", [AIIUtility iqPacketEncryption]);
    
    // 人性化可读时间.
//    NSLog(@"1- %@", [AIIUtility dateStringToHuman:@"2014-12-13 15:58:00"]);
//    NSLog(@"2- %@", [AIIUtility dateStringToHuman:@"2014-12-13 15:50:00"]);
//    NSLog(@"3- %@", [AIIUtility dateStringToHuman:@"2014-12-13 14:52:00"]);
//    NSLog(@"4- %@", [AIIUtility dateStringToHuman:@"2014-12-12 15:52:00"]);
//    NSLog(@"5- %@", [AIIUtility dateStringToHuman:@"2014-11-13 15:52:00"]);
//    NSLog(@"6- %@", [AIIUtility dateStringToHuman:@"2013-12-13 15:52:00"]);
//    NSLog(@"7- %@", [AIIUtility dateStringToHuman:@"2012-12-13 15:52:00"]);
 
}

+ (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate
{
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testRegionListRequest
{
    AIIRegionListRequest *request = [[AIIRegionListRequest alloc] init];
    request.query.action = AIIQueryActionSecond;
    request.query.parentId = 0;
    request.cacheSupporting = AIICacheSupportingFull;
    [AIIPacketConnection sendAsynchronous:request delegate:self context:nil];
}

- (void)testCacheRegionListRequest
{
    AIIRegionListRequest *request = [[AIIRegionListRequest alloc] init];
    request.query.action = AIIQueryActionFirst;
    [AIIPacketConnection sendAsynchronous:request delegate:self context:nil];
}

- (void)testDeviceTokenSwitchRequest
{
    AIIDeviceTokenSwitchRequest *request = [[AIIDeviceTokenSwitchRequest alloc] init];
    request.query.open = NO;
    [AIIPacketConnection sendAsyn:request delegate:self context:nil];
}

- (void)testMessageSubmitRequest
{
    AIIMessageSubmitRequest *request = [[AIIMessageSubmitRequest alloc] init];
    AIIMessage *message = [[AIIMessage alloc] init];
    message.content = @"给APP点32个赞!";
//    message.properties = @[@"content"];
    request.query.entity = message;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:nil];
}

- (void)testMessageListRequest
{
    AIIMessageListRequest *request = [[AIIMessageListRequest alloc] init];
    
    /// 方案一(推荐)
    AIITable *table = [[AIITable alloc] init];
    table.page = 1;
    table.limit = 3;
    table.orderBy = AIIOrderByFirst;
    table.orderType = AIIOrderTypeDESC;
    table.properties = @[@"page",@"limit",@"orderBy",@"orderType"];
    
    request.query.table = table;
    request.query.properties = @[@"table"];
    
    /// 方案二
//    request.query.table.page = 1;
//    request.query.table.limit = 3;
//    request.query.table.orderBy = AIIOrderByFirst;
//    request.query.table.orderType = AIIOrderTypeDESC;
//    request.query.table.properties = @[@"page",@"limit",@"orderBy",@"orderType"];
    
    [AIIPacketConnection sendAsyn:request delegate:self context:nil];
}

- (void)testSMSCodeRequest
{
    AIISMSCodeRequest *request = [[AIISMSCodeRequest alloc] init];
    request.query.action = AIIQueryActionFirst;
    request.query.type = AIISMSCodeTypeBindResetPassword;
    request.query.mobile = @"17092087507";
    request.query.where.code = @"8350";

    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testAdListRequest
{
    AIIAdListRequest *request = [[AIIAdListRequest alloc] init];
    request.query.positionId = 1;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testSettingRequest
{
    AIISettingRequest *request = [[AIISettingRequest alloc] init];
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testReferenceItemListRequest
{
    AIIReferenceItemListRequest *request = [[AIIReferenceItemListRequest alloc] init];
    request.query.action = AIIQueryActionFirst;
    
    AIIReferenceItemListWhere *where = [[AIIReferenceItemListWhere alloc] init];
//    where.regionId = 110100;
//    where.searchKey = @"qh";
//    where.searchKey = @"zx";
//    where.schoolId = 2;
    where.identifier = 1;// 用户标签分组id
    where.properties = @[@"regionId", @"searchKey", @"school_id"];
    
    AIITable *table = [[AIITable alloc] init];
    table.where = where;
    
//    request.query.table = table;
    
    request.cacheSupporting = AIICacheSupportingFull;
    
//    request.query.properties = @[@"action"];
//    AIIReferenceItemListResponse *response = [AIIPacketConnection sendAsyn:request delegate:self context:self];
    [AIIPacketConnection sendAsynchronous:request delegate:self context:nil];
}

- (void)testUploadFilesRequest
{
    AIIUploadFilesRequest *request = [[AIIUploadFilesRequest alloc] init];
    
    AIIFileCollection *fileCollection = [[AIIFileCollection alloc] init];
    UIImage *image = [UIImage imageNamed:@"UploadImage"];
    AIIFile *file = [[AIIFile alloc] initWithData:UIImageJPEGRepresentation(image, 0.5) filename:@"UploadImage.png" contentType:@"image/png"];
    [fileCollection addObject:file];
    UIImage *image1 = [UIImage imageNamed:@"yjsk.jpeg"];
    AIIFile *file1 = [[AIIFile alloc] initWithData:UIImageJPEGRepresentation(image1, 1) filename:@"yjsk.jpeg" contentType:@"image/jpg"];
    [fileCollection addObject:file1];
    
    request.query.fileCollection = fileCollection;
    
    fileCollection.entityProperties = @[@"filename", @"contentType"];
    
    NSLog(@"%@", [fileCollection arrayWithObject]);
    NSLog(@"jsonString:%@", [request jsonStringWithObject]);
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testUploadImageRequest
{
    AIIUploadImageRequest *request = [[AIIUploadImageRequest alloc] init];
    
    AIIFileCollection *fileCollection = [[AIIFileCollection alloc] init];
    UIImage *image = [UIImage imageNamed:@"UploadImage"];
    AIIFile *file = [[AIIFile alloc] initWithData:UIImageJPEGRepresentation(image, 0.5) filename:@"UploadImage.png" contentType:@"image/png"];
    [fileCollection addObject:file];
    UIImage *image1 = [UIImage imageNamed:@"yjsk.jpeg"];
    AIIFile *file1 = [[AIIFile alloc] initWithData:UIImageJPEGRepresentation(image1, 1) filename:@"yjsk.jpeg" contentType:@"image/jpg"];
    [fileCollection addObject:file1];
    
    request.query.fileCollection = fileCollection;
    
    fileCollection.entityProperties = @[@"filename", @"contentType"];

    NSLog(@"%@", [fileCollection arrayWithObject]);
    NSLog(@"jsonString:%@", [request jsonStringWithObject]);
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testDeleteActionRequest
{
    AIIDeleteActionRequest *request = [[AIIDeleteActionRequest alloc] init];
    request.query.action = AIIQueryActionFirst;
    request.query.identifier = 1;
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testCategoryListRequest
{
    AIICategoryListRequest *request = [[AIICategoryListRequest alloc] init];
    request.query.action = AIIQueryActionFirst;
    //    request.query.properties = @[@"action"];
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

#pragma mark - 用户

- (void)testUserLoginRequest
{
    AIIUserLoginRequest *request = [[AIIUserLoginRequest alloc] init];
    request.query.action = AIIQueryActionFirst;
    request.query.name = @"17092087507";
    request.query.password = @"123456";
//    NSString *jsonString = [request jsonStringWithObject];
//    NSLog(@"jsonString:%@", jsonString);
    
    [AIIPacketConnection sendAsynchronous:request delegate:self context:self];
}

- (void)testUserLogoutRequest
{
    AIIUserLogoutRequest *request = [[AIIUserLogoutRequest alloc] init];
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testUserRegisterSubmitRequest
{
    AIIUserRegisterSubmitRequest *request = [[AIIUserRegisterSubmitRequest alloc] init];
    
    AIIUser *user = [[AIIUser alloc] init];
    user.name = @"IOS_17092087507";
    user.password = @"123456";
    user.mobile = @"17092087507";
    user.referrer = @"13527262005";
    
    AIIAddress *address = [[AIIAddress alloc] init];
    address.longitude = 113.215485;
    address.latitude = 23.134046;
    address.properties = @[@"longitude", @"latitude"];
    user.address = address;
    
    
    user.properties = @[@"name",@"password",@"mobile",@"referrer",@"address"];
    
    request.query.entity = user;
    request.query.smscodeId = 467;
    
//    NSLog(@"%@", [request jsonStringWithObject]);
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testUserBindMobileRequest
{
    AIIUserBindMobileRequest *request = [[AIIUserBindMobileRequest alloc] init];
    
    request.query.mobile = @"13527261004";
    request.query.smscodeId = 34;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testSynchronousUserDetailsRequest
{
    AIIUserDetailsRequest *request = [[AIIUserDetailsRequest alloc] init];
    AIIUserDetailsResponse *response = (AIIUserDetailsResponse *)[AIIPacketConnection sendSynchronous:request];
    AIIUser *user = (AIIUser *)response.query.entity;
    NSLog(@"user:%@", user);
    ;
}

- (void)testUserDetailsRequest
{
    AIIUserDetailsRequest *request = [[AIIUserDetailsRequest alloc] init];
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testUserUploadImageRequest
{
    AIIUserUploadImageRequest *request = [[AIIUserUploadImageRequest alloc] init];
    request.query.identifier = 1;
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testUserUpdatePasswordRequest
{
    AIIUserUpdatePasswordRequest *request = [[AIIUserUpdatePasswordRequest alloc] init];
    request.query.password = @"123456";
    request.query.passwordNew = @"000000";
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testUserResetPasswordRequest
{
    AIIUserResetPasswordRequest *request = [[AIIUserResetPasswordRequest alloc] init];
    request.query.mobile = @"17092087507";
    request.query.password = @"123456";
    request.query.smscodeId = 474;
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testUserUpdateRequest
{
    AIIUserUpdateRequest *request = [[AIIUserUpdateRequest alloc] init];
    
    AIIUser *user = [[AIIUser alloc] init];
    user.idName = @"IOS idName";
    user.sex = AIISexMale;
    user.schoolId = 1;
    user.idNumber = @"430781198610296519";
    user.studentIdImage = 1;
    user.idImage = 1;
    user.referrer = @"13527262005";
    
    user.properties = @[@"idName", @"sex", @"schoolId", @"idNumber", @"studentIdImage", @"idImage", @"referrer"];
    
    request.query.action = AIIQueryActionFirst;
    request.query.entity = user;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

//- (void)testRankListRequest
//{
//    AIIRankListRequest *request = [[AIIRankListRequest alloc] init];
//    request.query.action = AIIQueryActionFirst;
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];
//}

- (void)testUserOperateListRequest
{
    AIIUserOperateListRequest *request = [[AIIUserOperateListRequest alloc] init];
    request.query.action = AIIQueryActionSecond;
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testRecordListRequest
{
    AIIRecordListRequest *request = [[AIIRecordListRequest alloc] init];
    request.query.action = AIIQueryActionFirst;
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

#pragma mark - 文章

- (void)testArticleListRequest
{
    AIIArticleListRequest *request = [[AIIArticleListRequest alloc] init];
    request.query.action = AIIQueryActionFirst;
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

#pragma mark - 财务

//- (void)testPaySubmitRequest
//{
//    AIIPaySubmitRequest *request = [[AIIPaySubmitRequest alloc] init];
//    request.query.type = AIITradeTypeAlipay;
//    request.query.money = 12.34;
//    request.query.transferNo = @"20140916151800";
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];
//}

//- (void)testPointExchangeSubmitRequest
//{
//    AIIPointExchangeSubmitRequest *request = [[AIIPointExchangeSubmitRequest alloc] init];
//    request.query.action = AIIQueryActionFirst;
//    request.query.money = 1;
//    request.query.account = @"dannytiehui@hotmail.com";
//    request.query.properties = @[@"action", @"money"];
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];
//}

#pragma mark - 活动

//- (void)testEventListRequest
//{
//    AIIEventListRequest *request = [[AIIEventListRequest alloc] init];
//    request.query.action = AIIQueryActionFirst;
//    
//    AIITable *table = [[AIITable alloc] init];
//    table.page = 1;
//    table.limit = 5;
//    
//    AIIEventListWhere *where = [[AIIEventListWhere alloc] init];
//    where.latitude = 23.105407;
//    where.longitude = 113.305758;
//    table.where = where;
//    //    table.properties = @[@"where"];
//    
//    request.query.table = table;
//    
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];
//}

- (void)testEventJoinRequest
{
    AIIEventJoinRequest *request = [[AIIEventJoinRequest alloc] init];
    request.query.identifier = 1;
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

#pragma mark - 任务

- (void)testTaskListRequest
{
    AIITaskListRequest *request = [[AIITaskListRequest alloc] init];
    request.query.action = AIIQueryActionSecond;
    request.query.type = AIITaskTypeFirst;
    
    AIITable *table = [[AIITable alloc] init];
    table.page = 1;
    table.limit = 5;
    table.orderBy = AIIOrderByFirst;
    
    AIITaskListWhere *where = [[AIITaskListWhere alloc] init];
    where.status = AIITaskStatusSecond;
    where.labelId = 1;
    where.latitude = 23.132921;
    where.longitude = 113.252281;
    table.where = where;
    
    request.query.table = table;
    
    [AIIPacketConnection sendAsynchronous:request delegate:self context:self];
}

- (void)testTaskDetailsRequest
{
    AIITaskDetailsRequest *request = [[AIITaskDetailsRequest alloc] init];
    request.query.identifier = 41;//!< 1350935;
//    request.query.latitude = 23.132921;
//    request.query.longitude = 113.252281;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testTaskSubmitRequest
{
    AIITaskSubmitRequest *request = [[AIITaskSubmitRequest alloc] init];
    
    AIITask *task = [[AIITask alloc] init];
//    task.identifier = 1351013;
    task.reward = 0.00;
    task.rewardPlus = 0.0;
    task.limit = 9;
    task.type = AIITaskTypeSecond;
    
    AIIImage *image = [[AIIImage alloc] init];
    image.identifier = 1;
    AIIImage *image2 = [[AIIImage alloc] init];
    image2.identifier = 2;
    AIIImageCollection *imageCollection = [[AIIImageCollection alloc] init];
    [imageCollection addObject:image];
    [imageCollection addObject:image2];
    imageCollection.entityProperties = @[@"identifier"];
    
    task.imageCollection = imageCollection;
    task.deadline = @"2014-09-20 12:59:59";
    task.labelId = 3;
    task.desc = @"发布任务的描述IOS";
    task.latitude = 23.132921;
    task.longitude = 113.252281;
    task.regionId = 440430;
    task.street = @"周门北路38号";
    
    task.properties = @[@"identifier",@"reward", @"rewardPlus", @"limit", @"type", @"imageCollection", @"deadline", @"labelId", @"desc", @"latitude", @"longitude", @"regionId", @"street"];
    request.query.entity = task;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testTaskEvaluateCollectionSubmitRequest
{
    AIITaskEvaluateCollectionSubmitRequest *request = [[AIITaskEvaluateCollectionSubmitRequest alloc] init];
    request.query.action = AIIQueryActionFirst;
    request.query.identifier = 1;

    AIIEvaluateCollection *evaluateCollection = [[AIIEvaluateCollection alloc] init];
    evaluateCollection.entityProperties = @[@"stars", @"content", @"userIdTo"];
    
    AIIEvaluate *evaluate = [[AIIEvaluate alloc] init];
    evaluate.stars = 5;
    evaluate.content = @"内容一";
    evaluate.userIdTo = 1;
    
    AIIEvaluate *evaluate2 = [[AIIEvaluate alloc] init];
    evaluate2.stars = 4;
    evaluate2.content = @"内容二";
    evaluate2.userIdTo = 2;
    
    [evaluateCollection addObject:evaluate];
    [evaluateCollection addObject:evaluate2];
    
    request.query.modelCollection = evaluateCollection;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testTaskStatusUpdateRequest
{
    AIITaskStatusUpdateRequest *request = [[AIITaskStatusUpdateRequest alloc] init];
    request.query.action = AIIQueryActionSecond;
    request.query.identifier = 1351013;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

//- (void)testTaskReportSubmitRequest
//{
//    AIITaskReportSubmitRequest *request = [[AIITaskReportSubmitRequest alloc] init];
//    request.query.type = AIITaskReportTypeFirst;
//    request.query.identifier = 1351012;
//    request.query.desc = @"联系电话虚假!.!.";
//    
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];
//}

//- (void)testFetchRankRequest
//{
//    AIIFetchRankRequest *request = [[AIIFetchRankRequest alloc] init];
//    request.query.reward = 0.99;
//    request.query.labelId = 3;
//    
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];
//}

#pragma mark - 订单

- (void)testOrderStatusUpdateRequest
{
//    AIIOrderStatusUpdateRequest *request = [[AIIOrderStatusUpdateRequest alloc] init];
//    request.query.action = AIIQueryActionThird;
//    request.query.identifier = 1;
//    request.query.code = @"1234";
//    request.query.cancelType = AIIOrderCancelTypeFirst;
//    request.query.reason = @"1已友善协商，不需要服务了;";
    
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testOrderCommentSubmitRequest
{
//    AIIOrderCommentSubmitRequest *request = [[AIIOrderCommentSubmitRequest alloc] init];
//    request.query.identifier = 1;
//    request.query.content = @"订单1的评价。";
    
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

//- (void)testOrderComplaintSubmitRequest
//{
//    AIIOrderComplaintSubmitRequest *request = [[AIIOrderComplaintSubmitRequest alloc] init];
//    request.query.type = AIIOrderComplaintSubmitTypeFirst;
//    request.query.identifier = 1;
//    request.query.desc = @"订单1的投诉。";
//    
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];
//}

#pragma mark - 积分

//- (void)testPointSubmitRequest
//{
//    AIIPointSubmitRequest *request = [[AIIPointSubmitRequest alloc] init];
//    request.query.action = AIIQueryActionFourth;
//    
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];
//}

//- (void)testPointDetailsRequest
//{
//    AIIPointDetailsRequest *request = [[AIIPointDetailsRequest alloc] init];
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];
//}

#pragma mark - 其它

//- (void)testWishSubmitRequest
//{
//    AIIWishSubmitRequest *request = [[AIIWishSubmitRequest alloc] init];
//    request.query.content = @"我种下的第一棵小苹果树";
//    
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];
//}
//
//- (void)testPositionUpdateRequest
//{
//    AIIPositionUpdateRequest *request = [[AIIPositionUpdateRequest alloc] init];
//    request.query.latitude = 23.132922;
//    request.query.longitude = 113.252282;
//    
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];
//}
//
//- (void)testFetchPositionRequest
//{
//    AIIFetchPositionRequest *request = [[AIIFetchPositionRequest alloc] init];
//    request.query.identifier = 100020;
//    
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];
//}
//
//- (void)testCoordinateCollectionSubmitRequest
//{
//    AIICoordinateCollectionSubmitRequest *request = [[AIICoordinateCollectionSubmitRequest alloc] init];
//   
//    AIIAddressCollection *addressCollection = [[AIIAddressCollection alloc] init];
//    AIIAddress *address = [[AIIAddress alloc] init];
//    address.latitude = 23.132911;
//    address.longitude = 113.252211;
//    AIIAddress *address1 = [[AIIAddress alloc] init];
//    address1.latitude = 23.132922;
//    address1.longitude = 113.252222;
//    [addressCollection addObject:address];
//    [addressCollection addObject:address1];
//    addressCollection.entityProperties = @[@"latitude", @"longitude"];
//    
//    request.query.modelCollection = addressCollection;
//    
//    NSLog(@"%@", [addressCollection arrayWithObject]);
//    NSLog(@"%@", [request jsonStringWithObject]);
//    
////    [AIIPacketConnection sendAsyn:request delegate:self context:self];
//}

#pragma mark - PacketHttpConnectionDelegate

- (void)packetConnectionFinished:(AIIPacketConnection *)connection
{
    if ([connection.response isKindOfClass:[AIIReferenceItemListResponse class]]) {
        if (!connection.response.query.status) {
            // 成功
            AIIReferenceItemListResponseQuery *responseQuery = (AIIReferenceItemListResponseQuery *)connection.response.query;
            AIIItemCollection *itemCollection = (AIIItemCollection *)responseQuery.modelCollection;
            NSLog(@"itemCollection:%@", itemCollection);
        }
        else {
            // 失败
            ;
        }
    }
    else if([connection.response isKindOfClass:[AIIUserLoginResponse class]]){
        if (0 == connection.response.query.status) {
            // 成功
            ;
        }
        else {
            // 失败
            ;
        }
    }
    else if ([connection.response isKindOfClass:[AIIUserDetailsResponse class]]) {
        if (!connection.response.query.status) {
            // 成功
            AIIUserDetailsResponseQuery *responseQuery = (AIIUserDetailsResponseQuery *)connection.response.query;
            AIIUser *user = (AIIUser *)responseQuery.entity;
            NSLog(@"user:%@", user);
        }
        else {
            // 失败
            ;
        }
    }

    else if ([connection.response isKindOfClass:[AIIMessageListResponse class]]) {
        if (!connection.response.query.status) {
            // 成功
            AIIListResponseQuery *responseQuery = (AIIListResponseQuery *)connection.response.query;
            AIIMessageCollection *messageCollection = (AIIMessageCollection *)responseQuery.modelCollection;
            NSLog(@"messageCollection:%@", messageCollection);
        }
        else {
            // 失败
            ;
        }
    }
    else if ([connection.response isKindOfClass:[AIIRegionListResponse class]]) {
        if (!connection.response.query.status) {
            // 成功
            AIIRegionListResponseQuery *responseQuery = (AIIRegionListResponseQuery *)connection.response.query;
            AIIRegionCollection *regionCollection = (AIIRegionCollection *)responseQuery.modelCollection;
            NSLog(@"regionCollection:%lu", regionCollection.count);
            AIIRegionCollection *regionCollection2 = [regionCollection recursive];
            NSLog(@"regionCollection2:%lu", regionCollection2.count);
            
//            AIIRegion *region = (AIIRegion *)[regionCollection2 objectAtIndex:10];
//            AIIRegionCollection *childrenCollection = region.children;
//            
//            for (AIIRegion *item in childrenCollection) {
//                NSLog(@"-%lu,%@,%@", item.identifier, item.name, item.pinyin);
//            }
//            
//            AIIRegionCollection *sortedRegionCollection = [childrenCollection sortedCollectionUsingPinyin];
//            for (AIIRegion *item in sortedRegionCollection) {
//                NSLog(@"+%lu,%@,%@", item.identifier, item.name, item.pinyin);
//            }
            
            AIIRegionCollection *regionCollection3 = [regionCollection sortedCollectionUsingPinyin];
            NSLog(@"regionCollection3:%lu", regionCollection3.count);
            
        }
        else {
            // 失败
            ;
        }
    }
    else if ([connection.response isKindOfClass:[AIITaskListResponse class]]) {
        if (!connection.response.query.status) {
            // 成功
            AIITaskListResponseQuery *responseQuery = (AIITaskListResponseQuery*)connection.response.query;
            AIITaskCollection *taskCollection = (AIITaskCollection *)responseQuery.modelCollection;
            NSLog(@"taskCollection:%@", taskCollection);
        }
        else {
            // 失败
            ;
        }
    }
    else if ([connection.response isKindOfClass:[AIITaskDetailsResponse class]]) {
        if (!connection.response.query.status) {
            // 成功
            AIITaskDetailsResponseQuery *responseQuery = (AIITaskDetailsResponseQuery *)connection.response.query;
            AIITask *task = (AIITask *)responseQuery.entity;
            NSLog(@"task:%@", task);
        }
        else {
            // 失败
            ;
        }
    }
}

- (void)testModelCollection
{
    /* 注意:
     * 1. 若:@property (nonatomic, assign) NSUInteger total;
            a)返回的JSONString:"total":16,不需要实现"- (void)setValue:(id)value forKey:(NSString *)key"方法;
            b)返回的JSONString:"total":"16",需要实现"- (void)setValue:(id)value forKey:(NSString *)key"方法;
     * 2. 若:@property (nonatomic, copy) NSString *total;
            返回的JSONString:("total":16)还是("total":"16"),都不需要实现"- (void)setValue:(id)value forKey:(NSString *)key"方法;
     */
    
    // 1.
//    NSString *jsonString = @"{\"n\":\"TaskList\",\"s\":\"5s2tgc8o0wyel5ppf4ny7c5c1gg8dq4x\",\"q\":{\"s\":\"0\",\"d\":\"\u64cd\u4f5c\u6210\u529f\",\"total\":\"16\",\"tasks\":[],\"t\":\"2014-10-02 00:28:07\"}}";

    // 2.
//    NSString *jsonString = @"{\"n\":\"TaskList\",\"s\":\"5s2tgc8o0wyel5ppf4ny7c5c1gg8dq4x\",\"q\":{\"s\":\"0\",\"d\":\"\u64cd\u4f5c\u6210\u529f\",\"total\":16,\"tasks\":[],\"t\":\"2014-10-02 00:28:07\"}}";
    
//    AIITaskListResponse *response = [[AIITaskListResponse alloc] initWithJSONString:jsonString];
//    AIITaskListResponseQuery *query = (AIITaskListResponseQuery *)response.query;
//    NSLog(@"%d", query.total);
}



@end
