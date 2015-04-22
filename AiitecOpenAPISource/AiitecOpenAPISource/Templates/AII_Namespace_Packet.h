//
//  AII_Namespace_Packet.h
//  AiitecOpenAPISource
//
//  Created by iMac on 15/03/04.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AII_Namespace_RequestQuery : AIIQuery
@end


@interface AII_Namespace_Request : AIIRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AII_Namespace_RequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AII_Namespace_Response : AIIResponse
@end
