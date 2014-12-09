//
//  AIIUserResetPasswordPacket.h
//  AAClient
//
//  Created by iMac on 13-6-3.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIUserResetPasswordRequestQuery : AIIQuery

//@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger mobile;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, assign) NSUInteger smscodeId;

@end



@interface AIIUserResetPasswordRequest : AIIRequest

@property (nonatomic, strong) AIIUserResetPasswordRequestQuery *query;

@end



@interface AIIUserResetPasswordResponse : AIIResponse
@end