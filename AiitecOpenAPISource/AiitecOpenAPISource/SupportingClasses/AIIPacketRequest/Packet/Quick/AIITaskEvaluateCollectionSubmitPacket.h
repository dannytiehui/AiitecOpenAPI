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

@property (nonatomic, strong) AIITaskEvaluateCollectionSubmitRequestQuery *query;

@end


@interface AIITaskEvaluateCollectionSubmitResponse : AIICollectionResponse
@end

