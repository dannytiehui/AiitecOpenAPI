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

@property (nonatomic, strong) AIIListRequestQuery *query;

@end



@interface AIIListResponse : AIIResponse

@property (nonatomic, strong) AIIListResponseQuery *query;

@end
