//
//  AII_Entity_ListPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 15/03/04.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AII_Entity_Collection.h"

@interface AII_Entity_ListWhere: AIIWhere
@end


@interface AII_Entity_ListRequestQuery : AIIListRequestQuery
@end


@interface AII_Entity_ListResponseQuery : AIIListResponseQuery
@end


@interface AII_Entity_ListRequest : AIIListRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AII_Entity_ListRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AII_Entity_ListResponse : AIIListResponse
@end