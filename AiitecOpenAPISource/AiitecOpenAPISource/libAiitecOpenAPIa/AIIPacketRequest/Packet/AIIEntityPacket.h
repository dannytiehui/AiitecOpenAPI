//
//  AIIEntityPacket.h
//  AAClient
//
//  Created by iMac on 13-7-23.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"
#import "AIIEntityQuery.h"

@interface AIIEntityRequest : AIIRequest

@property (nonatomic, strong) AIIEntityQuery *query;

@end



@interface AIIEntityResponse : AIIResponse
@end
