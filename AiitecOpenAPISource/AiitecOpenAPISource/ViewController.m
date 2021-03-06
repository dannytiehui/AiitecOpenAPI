//
//  ViewController.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14-9-26.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "ViewController.h"
#import "AIIFileCache.h"
#import "AIIUtility.h"

#import "Fraction.h"
#import "ABC.h"

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
//    [self testUserUpdateRequest];
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
    
    
//    BOOL b;
//     Entity
//    NSArray *entityArray = @[@"AttrCategory"];
//    b = [AIIFileCache createIqPacketWithEntityArray:entityArray];

    // Default
//    b = [AIIFileCache createIqPacketWithNamespace:@"ExpressSearch" template:AIITemplateDefault];
//    NSArray *namespaceArray = @[@"Pay"];
//    b = [AIIFileCache createIqPacketWithNamespaceArray:namespaceArray template:AIITemplateDefault];
    
    // List
//    NSArray *namespaceListArray = @[@"Apply", @"Goods", @"Remind", @"Position", @"Rank"];
//    b = [AIIFileCache createIqPacketWithNamespaceArray:namespaceListArray template:AIITemplateList];
    
    // Details
//    NSArray *namespaceDetailsArray = @[@"Apply", @"Goods"];
//    b = [AIIFileCache createIqPacketWithNamespaceArray:namespaceDetailsArray template:AIITemplateDetails];
    
    // Submit
//    NSArray *namespaceSubmitArray = @[@"Apply", @"Order", @"Remind", @"Financial"];
//    b = [AIIFileCache createIqPacketWithNamespaceArray:namespaceSubmitArray template:AIITemplateSubmit];

    // CollectionSubmit
//    NSArray *namespaceCollectionSubmitArray = @[@"TaskEvaluate"];
//    b = [AIIFileCache createIqPacketWithNamespaceArray:namespaceCollectionSubmitArray template:AIITemplateCollectionSubmit];
    
    // Update
//    NSArray *namespaceUpdateArray = @[@"Apply", @"Position"];
//    b = [AIIFileCache createIqPacketWithNamespaceArray:namespaceUpdateArray template:AIITemplateUpdate];
    
    // Switch
//    NSArray *namespaceSwitchArray = @[@"Remind"];
//    b = [AIIFileCache createIqPacketWithNamespaceArray:namespaceSwitchArray template:AIITemplateSwitch];
    
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
 
    
    
    
    
    
    // 2015-03-13 复制对象
//    Fraction *f1 = [[Fraction alloc] init];
//    Fraction *f2;
//    
//    [f1 setTo:2 over:5];
////    f2 = f1;
//    f2 = [f1 copy];
//    [f2 setTo:1 over:3];
//    [f1 print];
//    [f2 print];
    
//    NSString *str = @"a";
//    NSString *str2;
//    
//    NSLog(@"str:%@", str);
//    
//    str2 = str;
////    str2 = [str copy];
////    str2 = [str mutableCopy];
//    
//    NSLog(@"str:%@", str);
//    NSLog(@"str2:%@", str2);

//    AIIJSONModel *user = [[AIIUser alloc] init];
//    AIIJSONModel *user2;
//    NSMutableString *mString;
    
//    NSMutableString *mString = [NSMutableString stringWithFormat:@"%@",@"abc"];
//    user.sString = mString;
//    user.cString = mString;
//    NSLog(@" mString:%@, %p, %p",  mString, mString, &mString);
//    [user print];
//    
//    [mString appendString:@"de"];
//    
//    NSLog(@" mString:%@, %p, %p",  mString, mString, &mString);
//    [user print];
    
//    user.identifier = 1;
//    user.name = @"用户一";
//    user.mutableString = [NSMutableString stringWithFormat:@"%@",@"100"];
//    [user.mutableString appendString:@"9"];
//    NSLog(@"%@", user.mutableString);
//    
////    user2 = user;
////    user2 = [user copy];
////    user2 = [user mutableCopy];
//    mString = user.mutableString;
//    [mString appendString: @"ONE"];
//    
////    user2.identifier = 2;
////    user2.name = @"用户二";
//    user2.mutableString = [NSMutableString stringWithString:@"200"];
//    
//    NSLog(@"%@", user.mutableString);
//    NSLog(@"%@", user2.mutableString);
//    NSLog(@"---\r\n");
    
    
    
//    NSLog(@"%lu,%@,%@", user.identifier, user.name, user.mutableString);
//    NSLog(@"%lu,%@,%@", user2.identifier, user2.name, user2.mutableString);
//    NSLog(@"---\r\n");
//
//    AIIUserCollection *userCollection = [[AIIUserCollection alloc] init];
//    [userCollection addObject:user];
//    [userCollection addObject:user2];
//    
//    AIIUserCollection *userCollection2;
    
//    userCollection2 = userCollection;
//    userCollection2 = [userCollection copy];
//    userCollection2 = [userCollection mutableCopy];
//    
//    AIIUser *user3 = [[AIIUser alloc] init];
//    user3.identifier = 3;
//    user3.name = @"用户三";
//    [userCollection2 addObject:user3];
//    
//    for (AIIUser *item in userCollection) {
//        NSLog(@"%lu,%@", item.identifier, item.name);
//    }
//    
//    NSLog(@"\r\n");
//    
//    for (AIIUser *item2 in userCollection2) {
//        NSLog(@"%lu,%@", item2.identifier, item2.name);
//    }

//    NSString *string = @"dddd";
//    NSString *stringCopy = [string copy];
////    stringCopy = @"aaa";
//    NSMutableString *stringMCopy = [string mutableCopy];
//    [stringMCopy appendString:@"!!"];
//    
//    NSLog(@"%p, %@", string, string);
//    NSLog(@"%p, %@", stringCopy, stringCopy);
//    NSLog(@"%p, %@", stringMCopy, stringMCopy);
//    NSLog(@"-");
//    
//    AIIUser *user = [[AIIUser alloc] init];
//    user.identifier = 34;
//    user.name = @"习大大";
//    user.nickname = @"老大";
//    user.address.identifier = 440000;
//    user.address.name = @"广东省";
//    user.mutableString = [NSMutableString stringWithString:@"User对象"];
//    user.dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"34", @"number", nil];
//    user.mutableArray = [NSMutableArray arrayWithObjects:[NSMutableString stringWithFormat:@"one"], @"two", @"three", @"four", nil];
//    [self AIINSLog:user];
    
    // 第一种情况: user2的改变会完完全全影响到user
//    AIIUser *user2 = user;
//    user2.name = @"=第二个用户";
//    NSMutableString *mStr = [NSMutableString stringWithString:[user.mutableArray objectAtIndex:0]];
//    [mStr appendString:@"100"];
//    [user2.mutableArray replaceObjectAtIndex:0 withObject:mStr];

    // 第二种情况: userCopy为不可变副本,user的改变不会不会影响到userCopy.
//    AIIUser *userCopy = [user copy];
//    user.name = @"习大大+";
//    [user.mutableString appendString:@"+"];
//    AIIAddress *address = [[AIIAddress alloc] init];
//    address.identifier = 440010;
//    address.name = @"广东省2";
//    userCopy.address = address;
//    userCopy.address.name = @"广东省2";
//    userCopy.dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"35", @"number2", nil];
//    [user.dictionary setValue:@"第二个值" forKey:@"two"];//会崩溃
    
//    NSMutableString *mStr = [NSMutableString stringWithString:[user.mutableArray objectAtIndex:0]];
//    [mStr appendString:@"100"];
//    [userCopy.mutableArray replaceObjectAtIndex:0 withObject:mStr];
    
//    NSLog(@"userCopy-");
//    [self AIINSLog:userCopy];
//    NSLog(@"user-");
//    [self AIINSLog:user];
//
//    // 第三种情况: userMCopy为可变副本,user的改变不会不会影响到userCopy.
//    AIIUser *userMCopy = [user mutableCopy];//BUG
//    userMCopy.name = @"M牛大大";
////    userMCopy.address.name = @"M广东省2";
//    AIIAddress *address2 = [[AIIAddress alloc] init];
//    address2.identifier = 440010;
//    address2.name = @"M广东省2";
//    userMCopy.address = address2;
//    [userMCopy.dictionary setValue:@"第三个值" forKey:@"three"];
//    
//    NSMutableString *mStr = [NSMutableString stringWithString:[user.mutableArray objectAtIndex:0]];
//    [mStr appendString:@"100"];
//    [userMCopy.mutableArray replaceObjectAtIndex:0 withObject:mStr];
//    
//    NSLog(@"userMCopy-");
//    [self AIINSLog:userMCopy];
//    NSLog(@"user-");
//    [self AIINSLog:user];
//
//    NSLog(@"--- NSDictionary ---");
//    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"34", @"number", nil];
//    NSLog(@"dict:%@", dict);
//    NSDictionary *dictCopy = [dict copy];
//    [dict setValue:@"352" forKey:@"number"];
////    dictCopy = [NSDictionary dictionaryWithObjectsAndKeys:@"35", @"number", nil];
//    NSLog(@"dictCopy:%@", dictCopy);
//    NSLog(@"dict:%@", dict);
//    NSMutableDictionary *dictMCopy = [dict mutableCopy];
//    [dict setValue:@"353" forKey:@"number"];
////    dictMCopy = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"35", @"number", nil];
//    NSLog(@"dictMCopy:%@", dictMCopy);
//    NSLog(@"dict:%@", dict);
//
//    NSLog(@"--- NSMutableArray ---");
//    NSMutableArray *mutableArray = [NSMutableArray arrayWithObjects:[NSMutableString stringWithFormat:@"one"], @"two", @"three", @"four", nil];
//    NSMutableArray *mutableArray2;
//    NSMutableArray *mutableArray3;
//    NSMutableString *mutableString;
//    
//    mutableArray2 = [mutableArray copy];
////    [mutableArray2 removeObjectAtIndex:0];
////    [mutableArray removeObjectAtIndex:0];
//    ;
//    
//    mutableArray3 = [mutableArray mutableCopy];
//    mutableString = [NSMutableString stringWithString:[mutableArray objectAtIndex:0]];
//    [mutableString appendString:@"100"];
//    [mutableArray3 replaceObjectAtIndex:0 withObject:mutableString];
////    [[mutableArray objectAtIndex:0] appendString:@"100"];
////    [mutableArray3 removeObjectAtIndex:0];

    
    // 1.将AIIJSONModel对象缓存到plist文件
    AIIUser *user = [[AIIUser alloc] init];
    user.identifier = 34;
    user.name = @"习大大";
    user.nickname = @"老大";
    user.address.identifier = 440000;
    user.address.name = @"广东省";
    user.address.regionId = 440010;
//    user.address.contacts = @"";
//    user.address.mobile = @"";
//    user.address.postcode = @"";
//    user.address.string = @"";
    user.mutableString = [NSMutableString stringWithString:@"User对象"];
    user.dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"34", @"number", nil];
    user.mutableArray = [NSMutableArray arrayWithObjects:[NSMutableString stringWithFormat:@"one"], @"two", @"three", @"four", nil];
    
    user.address.properties = @[@"identifier", @"name"];
    user.properties = @[@"identifier", @"name", @"nickname", @"address", @"mutableString", @"dictionary", @"mutableArray"];
    [user writeToFile];
    
    AIIUser *user2 = [[AIIUser alloc] initWithContentsOfFile];
    // 注意,属性中如果有值为NULL的要移除,否则缓存文件写入失败.
    user2.address.properties = @[@"identifier", @"name"];// @"contacts"
    NSLog(@"- %@", user2.name);
    
    // 2.将AIIJSONCollection对象缓存到plist文件
    user2.name = @"习大大+";
    
    AIIUserCollection *userCollection = [[AIIUserCollection alloc] init];
    [userCollection addObject:user];
    [userCollection addObject:user2];
    userCollection.entityProperties = @[@"identifier", @"name", @"nickname", @"address", @"mutableString", @"dictionary", @"mutableArray"];
    BOOL b = [userCollection writeToFile];
    NSLog(@"b:%d", b);
    
    AIIUserCollection *userCollection2 = [[AIIUserCollection alloc] initWithContentsOfFile];
    NSLog(@"%ld", userCollection2.count);
    
    // 3.将AIIRequest对象缓存到plist文件
    AIIUserLoginRequest *request = [[AIIUserLoginRequest alloc] init];
    request.query.action = AIIQueryActionFirst;
    request.query.name = @"17092087507";
    request.query.password = @"123456";
    
    BOOL b2 = [request writeToFile];
    NSLog(@"b2:%d", b2);
    
    AIIUserLoginRequest *userLoginRequest = [[AIIUserLoginRequest alloc] initWithContentsOfFile];
    NSLog(@"userLoginRequest:%@", userLoginRequest);

    
    // 4.将AIIResponse对象缓存到plist文件
    
    
    // 归档

    // 1.NSKeyedArchiver
    NSString *path = [NSString stringWithFormat:@"%@/user.archiver", [AIIUtility cachesPacketPath]];
    
    BOOL b3 = [NSKeyedArchiver archiveRootObject:user toFile:path];
    NSLog(@"b3:%d", b3);
    
    AIIUser *userArchiver = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"userArchiver:%@", userArchiver);

    // 2.
    NSMutableData *mutableData = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mutableData];
    
    [archiver encodeObject:user forKey:@"user"];
    [archiver encodeObject:request forKey:@"userLoginRequest"];
    
    [archiver finishEncoding];
    
    NSString *path2 = [NSString stringWithFormat:@"%@/mutableData.archiver", [AIIUtility cachesPacketPath]];
    BOOL b4 = [mutableData writeToFile:path2 atomically:YES];
    NSLog(@"b4:%d", b4);
    
    NSData *dataArea = [NSData dataWithContentsOfFile:path2];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:dataArea];
    
    AIIUser *userUnarchiver = [unarchiver decodeObjectForKey:@"user"];
    AIIUserLoginRequest *requestUnarchiver = [unarchiver decodeObjectForKey:@"userLoginRequest"];
    NSLog(@"%@, %@", userUnarchiver, requestUnarchiver);
    
    
    // 3.
    AIIUser *userNew = user;
    userNew.name = @"userNew";
    
    AIIUser *userCopy = [user copy];
    userCopy.name = @"userCopy";
    
    // 使用archivedDataWithRootObject类方法,自定义对象必须实现NSCoding协议
    NSData *dataUser = [NSKeyedArchiver archivedDataWithRootObject:user];
    AIIUser *userFromKeyedArchiver = [NSKeyedUnarchiver unarchiveObjectWithData:dataUser];
    userFromKeyedArchiver.name = @"+userFromKeyedArchiver+";
    NSLog(@"%@", userFromKeyedArchiver);
    
    // 3.2 测试用 - 以下代码会报错.
//    ABC *abc = [[ABC alloc] init];
//    abc.identifier = 1;
//    abc.name = @"第一个";
//    abc.mutableArray = [NSMutableArray arrayWithObjects:@"第一个", @"1", nil];
//    
//    NSData *dataABC = [NSKeyedArchiver archivedDataWithRootObject:abc];
//    ABC *abcFromKeyedArchiver = [NSKeyedUnarchiver unarchiveObjectWithData:dataABC];
//    abcFromKeyedArchiver.name = @"+abcFromKeyedArchiver+";
//    NSLog(@"%@", abcFromKeyedArchiver);
}

- (void)AIINSLog:(AIIUser *)user
{
    NSLog(@"%p, %ld", user, user.identifier);
    NSLog(@"%p, %@", user, user.name);
    NSLog(@"%p, %@", user, user.nickname);
    NSLog(@"%p, %ld", user, user.address.identifier);
    NSLog(@"%p, %@", user, user.address.name);
    NSLog(@"%p, %@", user, user.dictionary);
    NSLog(@"%p, %@", user, user.array);
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
    request.query.type = AIISMSCodeTypeSecond;
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
    AIIDeleteRequest *request = [[AIIDeleteRequest alloc] init];
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
    
    request.query.identifier = 1412300032;
    request.query.name = @"Lin&";
    
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
    user.idImageId = 1;
    user.referrer = @"13527262005";
    
//    user.array = @[@1, @2, @3];
//    NSNumber *n = [NSNumber numberWithInteger:0];
//    NSString *s = [NSString stringWithFormat:@"%@", @"2"];
//    user.array = @[n, @1, s, @"3"];
    
    NSMutableArray *mArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInteger:10], @11, [NSString stringWithFormat:@"%@", @"12"], @"13", nil];
    user.array = mArray;
    
    AIIAddress *address = [[AIIAddress alloc] init];
    address.identifier = 34;
    address.name = @"广州市";
    address.properties = @[@"identifier", @"name"];
    user.address = address;
    
    user.properties = @[@"idName", @"sex", @"schoolId", @"idNumber", @"studentIdImage", @"idImage", @"referrer", @"array", @"address"];
    
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
            [PacketRequest packetConnectionFinishedWarningHandle:connection];
        }
    }
    else if ([connection.response isKindOfClass:[AIISettingResponse class]]) {
        if (!connection.response.query.status) {
            // 成功
//            AIISettingResponseQuery *responseQuery = (AIISettingResponseQuery *)connection.response.query;
//            AIIItemCollection *itemCollection = (AIIItemCollection *)responseQuery.itemCollection;
//            NSLog(@"itemCollection:%@", itemCollection);
//            
//            for (AIIItem *item in itemCollection) {
//                NSLog(@"%lu, %@, %@", (unsigned long)item.identifier, item.name, item.value);
//            }
            
            // 1.写入协议文件缓存.
            BOOL b = [connection.response writeToFile];
            NSLog(@"+b:%d", b);
            
            // 2.读取协议文件缓存
            AIISettingResponse *response2 = [[AIISettingResponse alloc] initWithContentsOfFile];
            NSLog(@"%@", response2);

        }
        else {
            // 失败
            [PacketRequest packetConnectionFinishedWarningHandle:connection];
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
            NSLog(@"regionCollection:%lu", (unsigned long)regionCollection.count);
            AIIRegionCollection *regionCollection2 = [regionCollection recursive];
            NSLog(@"regionCollection2:%lu", (unsigned long)regionCollection2.count);
            
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
            NSLog(@"regionCollection3:%lu", (unsigned long)regionCollection3.count);
            
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
    
    // Emoji
    
}
- (IBAction)handleEmoji:(id)sender
{
    AIIMessageSubmitRequest *request = [[AIIMessageSubmitRequest alloc] init];
    AIIMessage *message = [[AIIMessage alloc] init];
    message.content = _textField.text;
    message.properties = @[@"content"];
    request.query.entity = message;
    
    [AIIPacketConnection sendAsyn:request delegate:self context:nil];
}


@end
