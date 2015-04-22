//
//  AIIFavoriteSwitchRequest.h
//  AAClient
//
//  Created by iMac on 13-5-21.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntityPacket.h"
#import "AIIFavorite.h"

@interface AIIFavoriteSwitchRequestQuery : AIIQuery

@property (nonatomic, assign) BOOL open;

@end


@interface AIIFavoriteSwitchRequest : AIIRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIFavoriteSwitchRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AIIFavoriteSwitchResponse : AIIEntityResponse
@end
