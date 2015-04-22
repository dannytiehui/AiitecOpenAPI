//
//  AIIDetailsPacket.h
//  AAClient
//
//  Created by iMac on 13-7-10.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"
#import "AIIEntityQuery.h"

@interface AIIDetailsRequest : AIIRequest
@end



@interface AIIDetailsResponse : AIIResponse

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIEntityQuery *query;
#pragma clang diagnostic pop

@end