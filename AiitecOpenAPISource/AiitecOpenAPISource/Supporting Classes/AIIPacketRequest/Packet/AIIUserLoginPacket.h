//
//  AIIUserLoginPacket.h
//  AAClient
//
//  Created by iMac on 13-5-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntityPacket.h"

//typedef NS_ENUM(NSUInteger, AIIUserLoginAction) {
//    AIIUserLoginActionDefault = 1,     //!< 1用户登录（默认）
//};

@interface AIIUserLoginRequestQuery : AIIQuery

//@property (nonatomic, assign) AIIUserLoginAction action;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *password;
//@property (nonatomic, assign) BOOL admin;
//@property (nonatomic, copy) NSString *verificationCode;

@end

//@interface AIIUserLoginResponseQuery : AIIEntityResponseQuery
@interface AIIUserLoginResponseQuery : AIIEntityQuery

/// Option
/** 是否开启验证码. */
@property (nonatomic, assign) BOOL verity; //!< 是否开启验证码

@end


@interface AIIUserLoginRequest : AIIRequest
@property (nonatomic, strong) AIIUserLoginRequestQuery *query;
@end


@interface AIIUserLoginResponse : AIIEntityResponse
@property (nonatomic, strong) AIIUserLoginResponseQuery *query;
@end
