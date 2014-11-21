//
//  AIIOrderDetailsPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIDetailsPacket.h"
#import "AIIOrder.h"

@interface AIIOrderDetailsResponseQuery : AIIEntityQuery
@end


@interface AIIOrderDetailsRequest : AIIDetailsRequest
@end


@interface AIIOrderDetailsResponse : AIIDetailsResponse

@property (nonatomic, strong) AIIOrderDetailsResponseQuery *query;

@end
