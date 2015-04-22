//
//  AIISMSCodePacket.h
//  AII
//
//  Created by iMac on 13-12-26.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntityPacket.h"
#import "AIIWhere.h"

@interface AIISMSCodeWhere : AIIWhere

@property (nonatomic, copy) NSString *code;

@end


typedef NS_ENUM(NSUInteger, AIISMSCodeType) {
    AIISMSCodeTypeRegister = 1,        //!< 1注册
    AIISMSCodeTypeBindMobile,          //!< 2绑定手机,第二步
    AIISMSCodeTypeBindResetPassword,   //!< 3重置密码(用户)
    AIISMSCodeTypePartner,             //!< 4第三方登录信息补全
};

@interface AIISMSCodeRequestQuery : AIIQuery

@property (nonatomic, assign) AIISMSCodeType type;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, strong) AIISMSCodeWhere *where;

@end


@interface AIISMSCodeRequest : AIIRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIISMSCodeRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AIISMSCodeResponse : AIIEntityResponse

@end
