//
//  ViewController.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14-9-26.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    [[NSUserDefaults standardUserDefaults] setObject:@"py108ouc7comfaqjfst8w4fd5gze4221" forKey:@"sessionId"];
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"sessionId"];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"20140930172259" forKey:DeviceTokenKey];

//    [self testDeviceTokenSwitchRequest];
//    [self testMessageSubmitRequest];
//    [self testMessageListRequest];
//    [self testSMSCodeRequest];
//    [self testAdListRequest];
//    [self testSettingRequest];
//    [self testReferenceItemListRequest];
//    [self testUploadImageRequest];
//    [self testDeleteActionRequest];
//    [self testCategoryListRequest];

//    [self testUserLoginRequest];
//    [self testUserLogoutRequest];
//    [self testUserRegisterRequest];
//    [self testUserBindMobileRequest];
//    [self testUserUploadImageRequest];
//    [self testUserUpdatePasswordRequest];
//    [self testUserResetPasswordRequest];
    [self testUserDetailsRequest];
//    [self testUserUpdateRequest];
//    [self testRankListRequest];
//    [self testRecordListRequest];

//    [self testArticleListRequest];

//    [self testPaySubmitRequest];
//    [self testPointExchangeSubmitRequest];

//    [self testEventListRequest];
//    [self testEventJoinRequest];
//
//    [self testTaskListRequest];//!< List
//    [self testTaskDetailsRequest];//!< Details
//    [self testTaskSubmitRequest];
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    request.query.type = AIISMSCodeTypeRegister;
    request.query.mobile = @"13527262005";
    request.query.where.code = @"1234";
    
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
    request.query.action = AIIQueryActionSecond;
    request.query.properties = @[@"action"];
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testUploadImageRequest
{
    AIIUploadImageRequest *request = [[AIIUploadImageRequest alloc] init];
    
    AIIFileCollection *fileCollection = [[AIIFileCollection alloc] init];
    UIImage *image = [UIImage imageNamed:@"UploadImage"];
    AIIFile *file = [[AIIFile alloc] initWithData:UIImageJPEGRepresentation(image, 0.5) filename:@"UploadImage.jpg" contentType:@"image/jpg"];
    [fileCollection addObject:file];
    
    request.query.fileCollection = fileCollection;
    
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
    request.query.name = @"13527262005";
    request.query.password = @"123456";
//    NSString *jsonString = [request jsonStringWithObject];
//    NSLog(@"jsonString:%@", jsonString);
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testUserLogoutRequest
{
    AIIUserLogoutRequest *request = [[AIIUserLogoutRequest alloc] init];
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testUserRegisterRequest
{
    AIIUserRegisterRequest *request = [[AIIUserRegisterRequest alloc] init];
    
    AIIUser *user = [[AIIUser alloc] init];
    user.name = @"IOS测试用户2";
    user.password = @"123456";
    user.mobile = @"13527261002";
    user.referrer = @"13527262005";
    
    user.properties = @[@"name",@"password",@"mobile",@"referrer"];
    
    request.query.entity = user;
    request.query.smscodeId = 34;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testUserBindMobileRequest
{
    AIIUserBindMobileRequest *request = [[AIIUserBindMobileRequest alloc] init];
    
    request.query.mobile = @"13527261004";
    request.query.smscodeId = 34;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
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
    request.query.mobile = @"13527261000";
    request.query.password = @"123456";
    request.query.smscodeId = 34;
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
    
    request.query.entity = user;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testRankListRequest
{
    AIIRankListRequest *request = [[AIIRankListRequest alloc] init];
    request.query.action = AIIQueryActionFirst;
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

- (void)testPaySubmitRequest
{
    AIIPaySubmitRequest *request = [[AIIPaySubmitRequest alloc] init];
    request.query.type = AIITradeTypeAlipay;
    request.query.money = 12.34;
    request.query.transferNo = @"20140916151800";
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testPointExchangeSubmitRequest
{
    AIIPointExchangeSubmitRequest *request = [[AIIPointExchangeSubmitRequest alloc] init];
    request.query.action = AIIQueryActionFirst;
    request.query.money = 1;
    request.query.account = @"dannytiehui@hotmail.com";
    request.query.properties = @[@"action", @"money"];
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

#pragma mark - 活动

- (void)testEventListRequest
{
    AIIEventListRequest *request = [[AIIEventListRequest alloc] init];
    request.query.action = AIIQueryActionFirst;
    
    AIITable *table = [[AIITable alloc] init];
    table.page = 1;
    table.limit = 5;
    
    AIIEventListWhere *where = [[AIIEventListWhere alloc] init];
    where.latitude = 23.105407;
    where.longitude = 113.305758;
    table.where = where;
    //    table.properties = @[@"where"];
    
    request.query.table = table;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

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
    request.query.action = AIIQueryActionThird;
    
    AIITable *table = [[AIITable alloc] init];
    table.page = 1;
    table.limit = 5;
    table.orderBy = AIIOrderByFirst;
    
    AIITaskListWhere *where = [[AIITaskListWhere alloc] init];
    where.orderStatus = AIITaskStatusSecond;
    where.labelId = 1;
    where.latitude = 23.132921;
    where.longitude = 113.252281;
//    table.where = where;
    
//    request.query.table = table;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testTaskDetailsRequest
{
    AIITaskDetailsRequest *request = [[AIITaskDetailsRequest alloc] init];
    request.query.identifier = 1350935;
    request.query.latitude = 23.132921;
    request.query.longitude = 113.252281;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testTaskSubmitRequest
{
    AIITaskSubmitRequest *request = [[AIITaskSubmitRequest alloc] init];
    
    AIITask *task = [[AIITask alloc] init];
    //    task.identifier = 1351013;
    task.reward = 1.25;
    task.rewardPlus = 0.0;
    
    AIIImage *image = [[AIIImage alloc] init];
    image.identifier = 1;
    image.properties = @[@"identifier"];//!<
    AIIImage *image2 = [[AIIImage alloc] init];
    image2.identifier = 2;
    image2.properties = @[@"identifier"];//!<
    AIIImageCollection *imageCollection = [[AIIImageCollection alloc] init];
    [imageCollection addObject:image];
    [imageCollection addObject:image2];
    
    task.imageCollection = imageCollection;
    task.deadline = @"2014-09-20 12:59:59";
    task.labelId = 3;
    task.desc = @"发布任务的描述IOS";
    task.latitude = 23.132921;
    task.longitude = 113.252281;
    task.regionId = 440430;
    task.street = @"周门北路38号";
    
    task.properties = @[@"identifier",@"reward", @"rewardPlus", @"imageCollection", @"deadline", @"labelId", @"desc", @"latitude", @"longitude", @"regionId", @"street"];
    request.query.entity = task;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testTaskStatusUpdateRequest
{
    AIITaskStatusUpdateRequest *request = [[AIITaskStatusUpdateRequest alloc] init];
    request.query.action = AIIQueryActionSecond;
    request.query.identifier = 1351013;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testTaskReportSubmitRequest
{
    AIITaskReportSubmitRequest *request = [[AIITaskReportSubmitRequest alloc] init];
    request.query.type = AIITaskReportTypeFirst;
    request.query.identifier = 1351012;
    request.query.desc = @"联系电话虚假!.!.";
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testFetchRankRequest
{
    AIIFetchRankRequest *request = [[AIIFetchRankRequest alloc] init];
    request.query.reward = 0.99;
    request.query.labelId = 3;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

#pragma mark - 订单

- (void)testOrderStatusUpdateRequest
{
    AIIOrderStatusUpdateRequest *request = [[AIIOrderStatusUpdateRequest alloc] init];
    request.query.action = AIIQueryActionThird;
    request.query.identifier = 1;
    request.query.code = @"1234";
    request.query.cancelType = AIIOrderCancelTypeFirst;
    request.query.reason = @"1已友善协商，不需要服务了;";
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testOrderCommentSubmitRequest
{
    AIIOrderCommentSubmitRequest *request = [[AIIOrderCommentSubmitRequest alloc] init];
    request.query.identifier = 1;
    request.query.content = @"订单1的评价。";
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testOrderComplaintSubmitRequest
{
    AIIOrderComplaintSubmitRequest *request = [[AIIOrderComplaintSubmitRequest alloc] init];
    request.query.type = AIIOrderComplaintSubmitTypeFirst;
    request.query.identifier = 1;
    request.query.desc = @"订单1的投诉。";
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

#pragma mark - 积分

- (void)testPointSubmitRequest
{
    AIIPointSubmitRequest *request = [[AIIPointSubmitRequest alloc] init];
    request.query.action = AIIQueryActionFourth;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testPointDetailsRequest
{
    AIIPointDetailsRequest *request = [[AIIPointDetailsRequest alloc] init];
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

#pragma mark - 其它

- (void)testWishSubmitRequest
{
    AIIWishSubmitRequest *request = [[AIIWishSubmitRequest alloc] init];
    request.query.content = @"我种下的第一棵小苹果树";
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testPositionUpdateRequest
{
    AIIPositionUpdateRequest *request = [[AIIPositionUpdateRequest alloc] init];
    request.query.latitude = 23.132922;
    request.query.longitude = 113.252282;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testFetchPositionRequest
{
    AIIFetchPositionRequest *request = [[AIIFetchPositionRequest alloc] init];
    request.query.identifier = 100020;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

#pragma mark - PacketHttpConnectionDelegate

- (void)packetConnectionFinished:(AIIPacketConnection *)connection
{
    if([connection.response isKindOfClass:[AIIUserLoginResponse class]]){
        if (0 == connection.response.query.status) {
            // 成功
            ;
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
}



@end
