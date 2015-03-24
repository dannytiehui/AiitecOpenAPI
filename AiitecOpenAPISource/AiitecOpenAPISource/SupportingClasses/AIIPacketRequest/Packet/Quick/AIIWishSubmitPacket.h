//
//  AIIWishSubmitPacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-9-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

@interface AIIWishSubmitRequestQuery : AIIQuery

@property (nonatomic, copy) NSString *content;

@end



@interface AIIWishSubmitRequest : AIIRequest

@property (nonatomic, strong) AIIWishSubmitRequestQuery *query;

@end



@interface AIIWishSubmitResponse : AIIResponse
@end
