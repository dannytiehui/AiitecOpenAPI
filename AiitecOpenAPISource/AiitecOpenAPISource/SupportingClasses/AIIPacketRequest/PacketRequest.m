//
//  PacketRequest.m
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-7-29.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "PacketRequest.h"
#import "AppConfig.h"

@implementation PacketRequest

+ (PacketRequest *)shareInstance
{
    static PacketRequest *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[PacketRequest alloc] init];
    });
    return instance;
}

+ (void)packetConnectionFinishedWarningHandle:(AIIPacketConnection *)connection
{
#if AiitecOpenAPI_DEBUG
    NSLog(@"%@, %lu, %@, %@", connection.response.nameSpace, connection.response.query.status, connection.response.query.timestamp, connection.response.query.desc);
#endif

    NSUInteger status = connection.response.query.status;
    switch (status) {
        case 0://!< 成功
        {
            
        }
            break;
            
        case 1100://!< （用户）未登录
        case 1107://!<  在别处登录
        {
//            UIWindow *window = [UIApplication sharedApplication].windows[0];
//            UINavigationController *nav = (UINavigationController *)window.rootViewController;
//            [nav popToRootViewControllerAnimated:NO];
//            [Bussiness sharedBussiness].loginUser = nil;
//            LoginViewController *controller = [[LoginViewController alloc] init];
//            controller.delegate = self;
//            [nav pushViewController:controller animated:NO];
        }
            break;
            
        case 1020:
        case 91020: //!<  来自缓存文件
        {
            NSLog(@"packetConnectionFinishedWarningHandle:%d, %@", Cache_Packet_STATUS, Cache_Packet_DESC);
        }
            break;
            
        case Packet_Request_Too_Fast_STATUS:
        {
            NSLog(@"packetConnectionFinishedWarningHandle:%d, %@", Packet_Request_Too_Fast_STATUS, Packet_Request_Too_Fast_DESC);
        }
            break;
            
        case NotReachable_STATUS: //无网络
        {
            NSLog(@"NotReachable_STATUS");
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - 通讯协议缓存相关

+ (void)beginPacketJSONCacheWithUserId:(NSUInteger)userId
{
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < 4; i++) {
        AIIReferenceItemListRequest *request = [[AIIReferenceItemListRequest alloc] init];
        request.query.action = i + 1;
        [mutableArray addObject:request];
    }
    
    AIICategoryListRequest *categoryListRequest = [[AIICategoryListRequest alloc] init];
    categoryListRequest.query.action = 1;
    [mutableArray addObject:categoryListRequest];
    
    NSString *subfolder = [NSString stringWithFormat:@"%ld", userId];
    [[NSUserDefaults standardUserDefaults] setObject:subfolder forKey:@"AIIUserId"];
    [[AIIPacketJSONCacheObjectManager shareInstance] beginWithPacketRequestArray:mutableArray];
}

+ (void)savePacketJSONCacheObjectManager
{
    [[AIIPacketJSONCacheObjectManager shareInstance] save];
    
    // 获取JSONCache大小.
    NSLog(@"folderSize: %llu", [AIIPacketJSONCacheObjectManager folderSize]);
}

@end
