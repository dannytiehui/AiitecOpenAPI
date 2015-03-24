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
            
        default:
            break;
    }
}

@end
