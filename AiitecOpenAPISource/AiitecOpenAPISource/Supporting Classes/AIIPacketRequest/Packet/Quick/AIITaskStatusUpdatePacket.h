//
//  AIITaskStatusUpdatePacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIICollectionPacket.h"
#import "AIIUserCollection.h"

@interface AIITaskStatusUpdateRequestQuery : AIIModelCollectionQuery

@property (nonatomic, assign) NSUInteger userId;
@property (nonatomic, copy) NSString *reason;

@end


@interface AIITaskStatusUpdateRequest : AIICollectionRequest

@property (nonatomic, strong) AIITaskStatusUpdateRequestQuery *query;

@end


@interface AIITaskStatusUpdateResponse : AIICollectionResponse
@end
