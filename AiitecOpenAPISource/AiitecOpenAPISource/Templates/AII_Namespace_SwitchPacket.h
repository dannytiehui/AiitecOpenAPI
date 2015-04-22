//
//  AII_Namespace_SwitchPacket.h
//  AiitecOpenAPISource
//
//  Created by iMac on 15/03/04.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AII_Namespace_SwitchRequestQuery : AIIQuery

@property (nonatomic, assign) BOOL open;

@end


@interface AII_Namespace_SwitchRequest : AIIRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AII_Namespace_SwitchRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AII_Namespace_SwitchResponse : AIIResponse
@end
