//
//  AIIWeiboDetailsPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIDetailsPacket.h"
#import "AIIWeibo.h"

@interface AIIWeiboDetailsResponseQuery : AIIEntityQuery

@property (nonatomic, strong) AIIWeibo *entity;
@property (nonatomic, strong) AIIWeibo *repostWeibo;

@end


@interface AIIWeiboDetailsRequest : AIIDetailsRequest
@end


@interface AIIWeiboDetailsResponse : AIIDetailsResponse
@end
