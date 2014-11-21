//
//  AIIFavoritesSwitchRequest.h
//  AAClient
//
//  Created by iMac on 13-5-21.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntityPacket.h"
#import "AIIFavorites.h"

@interface AIIFavoritesSwitchRequestQuery : AIIQuery

@property (nonatomic, assign) BOOL open;

@end


@interface AIIFavoritesSwitchRequest : AIIRequest

@property (nonatomic, strong) AIIFavoritesSwitchRequestQuery *query;

@end


@interface AIIFavoritesSwitchResponse : AIIEntityResponse
@end
