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

@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, assign) NSUInteger smscodeId;
@property (nonatomic, copy) NSString *password;

@end


@interface AIIUserBindMobileRequest : AIIRequest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) AIIUserBindMobileRequestQuery *query;
#pragma clang diagnostic pop

@end


@interface AIIUserBindMobileResponse : AIIResponse

@end
