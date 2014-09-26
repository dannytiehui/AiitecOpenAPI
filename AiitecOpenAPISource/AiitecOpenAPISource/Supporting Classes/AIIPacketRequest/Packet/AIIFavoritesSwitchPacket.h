//
//  AIIFavoritesSwitchRequest.h
//  AAClient
//
//  Created by iMac on 13-5-21.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntityPacket.h"
#import "AIIFavorites.h"

/**
 *  操作类型
 */
typedef NS_ENUM(NSUInteger, AIIFavoritesSwitchAction){
    /**
     *  收藏（默认）
     */
    AIIFavoritesSwitchActionDefault = 1,
    /**
     *  预约
     */
    AIIFavoritesSwitchActionReservation
};

@interface AIIFavoritesSwitchRequest : AIIEntityRequest

@property (nonatomic, assign) AIIFavoritesSwitchAction action;

@property (nonatomic, assign) NSUInteger identifier;
//@property (nonatomic, assign) BOOL favorites;
@property (nonatomic, assign) BOOL open;

@end


@interface AIIFavoritesSwitchResponse : AIIEntityResponse
@end
