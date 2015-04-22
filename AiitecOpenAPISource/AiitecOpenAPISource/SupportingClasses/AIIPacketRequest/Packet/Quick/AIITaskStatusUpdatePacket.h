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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIITaskStatusUpdateRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AIITaskStatusUpdateResponse : AIICollectionResponse
@end
