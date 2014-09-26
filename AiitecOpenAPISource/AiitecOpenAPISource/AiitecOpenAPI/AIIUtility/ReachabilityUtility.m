//
//  ReachabilityUtility.m
//  AAClient
//
//  Created by iMac on 13-8-13.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "ReachabilityUtility.h"

@interface ReachabilityUtility ()

- (void)reachabilityChanged:(NSNotification*)note;

@end



@implementation ReachabilityUtility

- (id)init
{
    if (self = [super init]) {
        /*
         Observe the kNetworkReachabilityChangedNotification. When that notification is posted, the method reachabilityChanged will be called.
         */
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(reachabilityChanged:)
                                                     name:kReachabilityChangedNotification
                                                   object:nil];

        Reachability *reach = [Reachability reachabilityWithHostName:REACHABILITY_HOSTNAME];
        [reach startNotifier];
        
        /** 以下代码必须出现两次，不然启动APP时第一次赋值无效？不知道原因，待解决. */
        self.isReachable = reach.isReachable;
        self.isReachable = reach.isReachable;
        
        NSLog(@"self.isReachable = %d", self.isReachable);
        NSLog(@"reach.isReachable = %d", reach.isReachable);
    }
    return  self;
}

+ (ReachabilityUtility *)defaultManager
{
    static ReachabilityUtility *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ReachabilityUtility alloc] init];
    });
    return instance;
}

/*!
 * Called by Reachability whenever status changes.
 */
- (void)reachabilityChanged:(NSNotification *)note
{
    Reachability *reach = [note object];
    self.isReachable = [reach isReachable];
//    NSLog(@"reachabilityChanged = %d", self.isReachable);
//    if([reach isReachable]) {
//        NSLog(@"Notification Says Reachable");
//    }
//    else {
//        NSLog(@"Notification Says Unreachable");
//    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

@end
