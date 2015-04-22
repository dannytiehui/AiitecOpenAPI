//
//  AIIUserUpdatePacket.h
//  AAClient
//
//  Created by iMac on 13-5-24.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntityPacket.h"

@interface AIIUserUpdateRequestQuery : AIIEntityQuery

@property (nonatomic, assign) NSUInteger smscodeId;

@end


@interface AIIUserUpdateRequest : AIIEntityRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIUserUpdateRequestQuery *query;
#pragma clang diagnostic pop

@end



@interface AIIUserUpdateResponse : AIIEntityResponse
@end