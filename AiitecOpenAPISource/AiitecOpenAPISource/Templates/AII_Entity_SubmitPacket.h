//
//  AII_Entity_SubmitPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntityPacket.h"
#import "AII_Entity_.h"

@interface AII_Entity_SubmitRequestQuery : AIIEntityQuery

@property (nonatomic, strong) AII_Entity_ *_Entity_;

@end


@interface AII_Entity_SubmitRequest : AIIEntityRequest

@property (nonatomic, strong) AII_Entity_SubmitRequestQuery *query;

@end


@interface AII_Entity_SubmitResponse : AIIEntityResponse
@end
