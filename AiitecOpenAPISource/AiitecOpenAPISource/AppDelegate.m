//
//  AppDelegate.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14-9-26.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AppDelegate.h"
#import "PacketRequest.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /** AiitecOpenAPI初始化. */
    [AIIPacketRequest start];
    
    [PacketRequest beginPacketJSONCacheWithUserId:0];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [PacketRequest savePacketJSONCacheObjectManager];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSString *description = deviceToken.description;
    NSLog(@"成功取得設備編號:%@", description);
    // 取得設備 i (去除掉不需要的字元)
    NSString *deviceId = [description substringWithRange:NSMakeRange(1, description.length - 2)];
    deviceId = [deviceId stringByReplacingOccurrencesOfString:@" " withString:@""];
    deviceId = [deviceId stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSString *oldDeviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:DeviceTokenKey];
    [[NSUserDefaults standardUserDefaults] setObject:deviceId forKey:DeviceTokenKey];
    
    NSLog(@"Start: Connect to Provider: %@", deviceId);
    
    // 添加日期: 2016-4-27
    [PacketRequest updateDeviceTokenWithSessionPacket:oldDeviceToken];
}

@end
