//
//  AIIUserTests.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14-9-29.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PacketRequest.h"

@interface AIIUserTests : XCTestCase
{
    NSString *_jsonString;//!< 对象/数组
    NSString *_jsonString0;//!< 基本
}

@end

@implementation AIIUserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    /*
    {
        "users": {
            "id": 1,
            "name": "鲁铁辉",
            "admin": true,
            "age": 28.6,
            "json": {
                "id": 1,
                "name": "荔湾区",
                "regionId": 440440,
                "street": "周们北路38号"
            },
            "array": [
                      {
                          "item": {
                              "id": 1,
                              "name": "荔湾区"
                          }
                      },
                      {
                          "item": {
                              "id": 2,
                              "name": "天河区"
                          }
                      },
                      {
                          "item": {
                              "id": 3,
                              "name": "海珠区"
                          }
                      }
                      ], 
            "address": {
                "id": 1, 
                "name": "荔湾区", 
                "regionId": 440440,
                "street": "周们北路38号"
            }, 
            "items": [
                      {
                          "item": {
                              "id": 1, 
                              "name": "荔湾区"
                          }
                      }, 
                      {
                          "item": {
                              "id": 2, 
                              "name": "天河区"
                          }
                      }, 
                      {
                          "item": {
                              "id": 3, 
                              "name": "海珠区"
                          }
                      }
                      ]
        }
    }
    */
    
    /** 支持的数据类型:字符串,数字(整型),浮点型,布尔,对象,数组(集合). */

    _jsonString = @"{\"user\":{\"id\":1,\"name\":\"鲁铁辉\",\"admin\":true,\"age\":28.6,\"json\":{\"id\":1,\"name\":\"荔湾区\",\"regionId\":440440,\"street\":\"周们北路38号\"},\"array\":[{\"item\":{\"id\":1,\"name\":\"荔湾区\"}},{\"item\":{\"id\":2,\"name\":\"天河区\"}},{\"item\":{\"id\":3,\"name\":\"海珠区\"}}],\"address\":{\"id\":1,\"name\":\"荔湾区\",\"regionId\":440440,\"street\":\"周们北路38号\"},\"items\":[{\"item\":{\"id\":1,\"name\":\"荔湾区\"}},{\"item\":{\"id\":2,\"name\":\"天河区\"}},{\"item\":{\"id\":3,\"name\":\"海珠区\"}}]}}";
    
    _jsonString0 = @"{\"user\":{\"id\":1,\"name\":\"鲁铁辉\",\"admin\":true,\"age\":28.8,\"json\":{\"id\":1,\"regionId\":440440,\"name\":\"荔湾区\",\"street\":\"周们北路38号\"},\"array\":[{\"id\":0,\"name\":\"荔湾区\"},{\"id\":1,\"name\":\"天河区\"},{\"id\":2,\"name\":\"海珠区\"}]}}";

    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

#pragma mark -

- (void)testUserValueToDictionary
{
    AIIUser *user = [[AIIUser alloc] init];
    user.identifier = 1;
    user.name = @"鲁铁辉";
    user.admin = YES;
    user.age = 28.8;
    
    NSMutableDictionary *mDict = [[NSMutableDictionary alloc] init];
    mDict[@"id"] = [NSNumber numberWithInteger:1];
    mDict[@"name"] = @"荔湾区";
    mDict[@"regionId"] = [NSNumber numberWithInteger:440440];
    mDict[@"street"] = @"周们北路38号";
    
    user.json = mDict;
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSMutableDictionary *tempDict0 = [[NSMutableDictionary alloc] init];
    tempDict0[@"id"] = [NSNumber numberWithInteger:0];
    tempDict0[@"name"] = @"荔湾区";
    NSMutableDictionary *tempDict1 = [[NSMutableDictionary alloc] init];
    tempDict1[@"id"] = [NSNumber numberWithInteger:1];
    tempDict1[@"name"] = @"天河区";
    NSMutableDictionary *tempDict2 = [[NSMutableDictionary alloc] init];
    tempDict2[@"id"] = [NSNumber numberWithInteger:2];
    tempDict2[@"name"] = @"海珠区";
    [array addObject:tempDict0];
    [array addObject:tempDict1];
    [array addObject:tempDict2];
    
    user.array = array;
    
    AIIAddress *address = [[AIIAddress alloc] init];
    address.identifier = 1;
    address.name = @"荔湾区";
    address.regionId = 440440;
    address.street = @"周们北路38号";
    address.properties = @[@"identifier", @"name", @"regionId", @"street"];
    
    user.address = address;
    
    AIIItemCollection *itemCollection = [[AIIItemCollection alloc] init];
    AIIItem *item0 = [[AIIItem alloc] init];
    item0.identifier = 1;
    item0.name = @"荔湾区";
    AIIItem *item1 = [[AIIItem alloc] init];
    item1.identifier = 2;
    item1.name = @"天河区";
    AIIItem *item2 = [[AIIItem alloc] init];
    item2.identifier = 3;
    item2.name = @"海珠区";
    [itemCollection addObject:item0];
    [itemCollection addObject:item1];
    [itemCollection addObject:item2];
    
    itemCollection.entityProperties = @[@"identifier", @"name"];
    user.itemCollection = itemCollection;
    
    user.properties = @[@"identifier", @"name", @"admin", @"age", @"json", @"array", @"address", @"itemCollection"];
    
    NSString *jsonString = [user jsonStringWithObject];
    NSLog(@"jsonString:%@", jsonString);
    
}

- (void)testUserValueFromDictionary
{
    NSDictionary *dict = [AIIUtility dictionaryWithJSONString:_jsonString];
    NSLog(@"dict:%@", [AIIUtility stringWithDictionary:dict]);
    
    AIIUser *user = [[AIIUser alloc] init];
    [user setValuesForKeysWithDictionary:[dict objectForKey:@"user"]];
    ;
}

- (void)testUserValueToDictionary0
{
    AIIUser *user = [[AIIUser alloc] init];
    user.identifier = 1;
    user.name = @"鲁铁辉";
    user.admin = YES;
    user.age = 28.8;
    
    NSMutableDictionary *mDict = [[NSMutableDictionary alloc] init];
    mDict[@"id"] = [NSNumber numberWithInteger:1];
    mDict[@"name"] = @"荔湾区";
    mDict[@"regionId"] = [NSNumber numberWithInteger:440440];
    mDict[@"street"] = @"周们北路38号";
    
    user.json = mDict;
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSMutableDictionary *tempDict0 = [[NSMutableDictionary alloc] init];
    tempDict0[@"id"] = [NSNumber numberWithInteger:0];
    tempDict0[@"name"] = @"荔湾区";
    NSMutableDictionary *tempDict1 = [[NSMutableDictionary alloc] init];
    tempDict1[@"id"] = [NSNumber numberWithInteger:1];
    tempDict1[@"name"] = @"天河区";
    NSMutableDictionary *tempDict2 = [[NSMutableDictionary alloc] init];
    tempDict2[@"id"] = [NSNumber numberWithInteger:2];
    tempDict2[@"name"] = @"海珠区";
    [array addObject:tempDict0];
    [array addObject:tempDict1];
    [array addObject:tempDict2];
    user.array = array;
    
    user.properties = @[@"identifier", @"name", @"admin", @"age", @"json", @"array"];
    
    NSString *jsonString = [user jsonStringWithObject];
    NSLog(@"jsonString:%@", jsonString);
  
}

- (void)testUserValueFromDictionary0
{
    NSDictionary *dict = [AIIUtility dictionaryWithJSONString:_jsonString0];
    NSLog(@"dict:%@", [AIIUtility stringWithDictionary:dict]);
    
    AIIUser *user = [[AIIUser alloc] init];
    [user setValuesForKeysWithDictionary:[dict objectForKey:@"user"]];
    ;
}



@end
