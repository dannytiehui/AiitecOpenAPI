//
//  AIIDeviceTokenSwitchPacket.h
//  AAClient
//
//  Created by iMac on 13-7-4.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIDeviceTokenSwitchRequestQuery : AIIQuery

@property (nonatomic, assign) BOOL open;            // 1开启, 0关闭
@property (nonatomic, readonly) NSString *deviceToken;  // 设备号

@end


//@interface AIIDeviceTokenSwitchResponseQuery : AIIQuery
//@end


@interface AIIDeviceTokenSwitchRequest : AIIRequest
@property (nonatomic, strong) AIIDeviceTokenSwitchRequestQuery *query;
@end


@interface AIIDeviceTokenSwitchResponse : AIIResponse
@end
