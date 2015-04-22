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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIModelCollectionQuery *query;
#pragma clang diagnostic pop


@end


@interface AIICollectionResponse : AIIResponse
@end