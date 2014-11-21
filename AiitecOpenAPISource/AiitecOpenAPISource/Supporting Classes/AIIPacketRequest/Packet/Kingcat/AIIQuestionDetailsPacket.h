//
//  AIIQuestionDetailsPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIDetailsPacket.h"
#import "AIIQuestion.h"

@interface AIIQuestionDetailsResponseQuery : AIIEntityQuery
@end


@interface AIIQuestionDetailsRequest : AIIDetailsRequest
@end


@interface AIIQuestionDetailsResponse : AIIDetailsResponse

@property (nonatomic, strong) AIIQuestionDetailsResponseQuery *query;

@end
