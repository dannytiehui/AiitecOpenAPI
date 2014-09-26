//
//  AIICollectionPacket.h
//  AII
//
//  Created by iMac on 14-3-27.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"
#import "AIIModelCollectionQuery.h"

@interface AIICollectionRequest : AIIRequest

@property (nonatomic, strong) AIIModelCollectionQuery *query;

@end


@interface AIICollectionResponse : AIIResponse
@end