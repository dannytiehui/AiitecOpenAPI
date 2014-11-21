//
//  AIIPacketHttpConnection.h
//  AAClient
//
//  Created by iMac on 13-6-27.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AppConfig.h"
#import "AIIPacketConfig.h"

#import "AIIRequest.h"
#import "AIIResponse.h"
#import "AIIUploadFilePacket.h"

#import "AIIFile.h"
#import "AIIFileCollection.h"

#import "ReachabilityUtility.h"

//UIKIT_EXTERN NSString *const ApiAddress;

@class AIIPacketHttpConnection;
@protocol PacketHttpConnectionDelegate <NSObject>

- (void)packetRequestFinished:(AIIPacketHttpConnection *)connection;

@end


@interface AIIPacketHttpConnection : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

- (id<PacketHttpConnectionDelegate>)delegate;
- (AIIRequest *)request;
- (AIIResponse *)response;
- (id)context;

+ (AIIResponse *)sendSynchronous:(AIIRequest *)request;// Default use HttpMethodPost
+ (void)sendAsynchronous:(AIIRequest *)request delegate:(id<PacketHttpConnectionDelegate>)delegate context:(id)context;
+ (void)sendAsynchronous:(AIIRequest *)request target:(id)target action:(SEL)action context:(id)context;

@end