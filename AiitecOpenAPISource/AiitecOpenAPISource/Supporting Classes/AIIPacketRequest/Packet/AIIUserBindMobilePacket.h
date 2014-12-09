//
//  AIIUserBindMobilePacket.h
//  AII
//
//  Created by iMac on 13-11-14.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIUserBindMobileRequestQuery : AIIQuery

@property (nonatomic, assign) NSUInteger mobile;
@property (nonatomic, assign) NSUInteger smscodeId;
/** 身份证号码. */
@property (nonatomic, copy) NSString *idNumber;

@end


@interface AIIUserBindMobileRequest : AIIRequest

@property (nonatomic, strong) AIIUserBindMobileRequestQuery *query;

@end


@interface AIIUserBindMobileResponse : AIIResponse

@end
