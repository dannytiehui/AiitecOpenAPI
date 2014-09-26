//
//  AIIUserCheckNamePacket.h
//  AAClient
//
//  Created by iMac on 13-5-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIUserCheckNameRequest : AIIRequest

@property (nonatomic, copy) NSString *name;

@end


@interface AIIUserCheckNameResponse : AIIResponse
@end