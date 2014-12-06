//
//  AII_Namespace_Packet.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/5.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AII_Namespace_RequestQuery : AIIQuery
@end


@interface AII_Namespace_Request : AIIRequest

@property (nonatomic, strong) AII_Namespace_RequestQuery *query;

@end


@interface AII_Namespace_Response : AIIResponse
@end
