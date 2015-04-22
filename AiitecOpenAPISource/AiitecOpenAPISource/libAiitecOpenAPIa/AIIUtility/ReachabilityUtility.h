//
//  ReachabilityUtility.h
//  AAClient
//
//  Created by iMac on 13-8-13.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import "AIIPacketConfig.h"

#define NotReachableAlertMessage @"无网络，网络请求已取消。请检查网络设置..."

@interface ReachabilityUtility : NSObject

@property (nonatomic, strong) Reachability *reachiability;
@property (nonatomic, assign) BOOL isReachable;

+ (ReachabilityUtility *)defaultManager;

@end
