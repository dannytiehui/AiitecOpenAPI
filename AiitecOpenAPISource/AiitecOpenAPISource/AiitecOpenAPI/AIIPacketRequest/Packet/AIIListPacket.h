//
//  AIIListPacket.h
//  AAClient
//
//  Created by iMac on 13-5-9.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"
#import "AIIModelCollectionQuery.h"
#import "AIITable.h"

@interface AIIListRequestQuery : AIIQuery

@property (nonatomic, strong) NSArray *ids;
@property (nonatomic, strong) AIITable *table;

@end



@interface AIIListResponseQuery : AIIModelCollectionQuery

@property (nonatomic, strong) NSArray *ids;
@property (nonatomic, assign) NSUInteger total;

@end



@interface AIIListRequest : AIIRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIListRequestQuery *query;
#pragma clang diagnostic pop

@end



@interface AIIListResponse : AIIResponse

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIListResponseQuery *query;
#pragma clang diagnostic pop

@end
