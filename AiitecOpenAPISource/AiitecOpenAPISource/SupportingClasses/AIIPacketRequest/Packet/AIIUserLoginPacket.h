//
//  AIIUserLoginPacket.h
//  AAClient
//
//  Created by iMac on 13-5-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntityPacket.h"

@interface AIIUserLoginRequestQuery : AIIQuery

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *password;
//@property (nonatomic, copy) NSString *verificationCode;

@end


@interface AIIUserLoginResponseQuery : AIIEntityQuery

#pragma mark - Option
/** 是否开启验证码. */
@property (nonatomic, assign) BOOL verity; //!< 是否开启验证码

@end


@interface AIIUserLoginRequest : AIIRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIUserLoginRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AIIUserLoginResponse : AIIEntityResponse

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIUserLoginResponseQuery *query;
#pragma clang diagnostic pop

@end
