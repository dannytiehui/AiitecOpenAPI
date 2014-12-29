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

@property (nonatomic, strong) AIIUserUpdateRequestQuery *query;

@end



@interface AIIUserUpdateResponse : AIIEntityResponse
@end