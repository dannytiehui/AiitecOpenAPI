//
//  AIIUserPartnerLoginPacket.h
//  AII
//
//  Created by iMac on 13-11-14.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntityPacket.h"
#import "AIIUser.h"

//@interface AIIUserPartnerLoginRequestQuery : AIIQuery
//
///** 第三方登录唯一标识. */
//@property (nonatomic, copy) NSString *openId;
//@property (nonatomic, copy) NSString *name;
//@property (nonatomic, assign) AIISex sex;
//@property (nonatomic, copy) NSString *nickname;
//@property (nonatomic, copy) NSString *imagePath;
//@property (nonatomic, assign) AIIUserPartner partner;
//
//@end


@interface AIIUserPartnerLoginRequest : AIIEntityRequest

//@property (nonatomic, strong) AIIUserPartnerLoginRequestQuery *query;

@end



@interface AIIUserPartnerLoginResponse : AIIEntityResponse
@end