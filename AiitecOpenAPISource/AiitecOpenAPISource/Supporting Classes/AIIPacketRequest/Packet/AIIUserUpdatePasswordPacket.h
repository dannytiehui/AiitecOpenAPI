//
//  AIIUserUpdatePasswordPacket.h
//  AAClient
//
//  Created by iMac on 13-5-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIUserUpdatePasswordRequestQuery : AIIQuery

@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *passwordNew;

@end



@interface AIIUserUpdatePasswordRequest : AIIRequest

@property (nonatomic, strong) AIIUserUpdatePasswordRequestQuery *query;

@end



@interface AIIUserUpdatePasswordResponse : AIIResponse
@end
