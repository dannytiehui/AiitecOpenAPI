//
//  AIIDeviceTokenSwitchPacket.h
//  AAClient
//
//  Created by iMac on 13-7-4.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"
#import "AIIStyle.h"

@interface AIIDeviceTokenSwitchRequestQuery : AIIQuery

@property (nonatomic, assign) BOOL open;
@property (nonatomic, readonly) NSString *deviceToken;
@property (nonatomic, strong) AIIStyle *style;

@end


//@interface AIIDeviceTokenSwitchResponseQuery : AIIQuery
//@end


@interface AIIDeviceTokenSwitchRequest : AIIRequest

@property (nonatomic, strong) AIIDeviceTokenSwitchRequestQuery *query;

@end


@interface AIIDeviceTokenSwitchResponse : AIIResponse
@end
