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

@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, assign) NSUInteger smscodeId;

@end



@interface AIIUserResetPasswordRequest : AIIRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIUserResetPasswordRequestQuery *query;
#pragma clang diagnostic pop

@end



@interface AIIUserResetPasswordResponse : AIIResponse
@end