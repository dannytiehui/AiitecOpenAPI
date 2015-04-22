//
//  AIIUserDetailsPacket.h
//  AAClient
//
//  Created by iMac on 13-5-24.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIDetailsPacket.h"
#import "AIIUser.h"

@interface AIIUserDetailsRequestQuery : AIIQuery

@property (nonatomic, copy) NSString *name;

@end


@interface AIIUserDetailsResponseQuery : AIIEntityQuery
@end


@interface AIIUserDetailsRequest : AIIDetailsRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIUserDetailsRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AIIUserDetailsResponse : AIIDetailsResponse
@end
