//
//  AIIUserDetailsPacket.h
//  AAClient
//
//  Created by iMac on 13-5-24.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIDetailsPacket.h"
#import "AIIUser.h"

@interface AIIUserDetailsResponseQuery : AIIEntityQuery

@property (nonatomic, strong) AIIEntity *merchant;

@end


@interface AIIUserDetailsRequest : AIIDetailsRequest
@end


@interface AIIUserDetailsResponse : AIIDetailsResponse
@end

