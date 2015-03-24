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
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];

        _reachiability = [Reachability reachabilityWithHostName:REACHABILITY_HOSTNAME];
        [_reachiability startNotifier];

        _isReachable = ([_reachiability currentReachabilityStatus] != NotReachable) ? YES : NO;
    }
    return self;
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
    _reachiability = [note object];
    _isReachable = ([_reachiability currentReachabilityStatus] != NotReachable) ? YES : NO;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

@end
