//
//  AIITaskEvaluateCollectionSubmitPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/6.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIICollectionPacket.h"
#import "AIIEvaluateCollection.h"

@interface AIITaskEvaluateCollectionSubmitRequestQuery : AIIModelCollectionQuery
@end


@interface AIITaskEvaluateCollectionSubmitRequest : AIICollectionRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIITaskEvaluateCollectionSubmitRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AIITaskEvaluateCollectionSubmitResponse : AIICollectionResponse
@end

