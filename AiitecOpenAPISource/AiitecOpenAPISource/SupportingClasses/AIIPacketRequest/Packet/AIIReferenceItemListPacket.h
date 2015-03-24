//
//  AIIReferenceItemListPacket.h
//  AII
//
//  Created by iMac on 14-2-28.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIIItemCollection.h"

@interface AIIReferenceItemListWhere: AIIWhere

@property (nonatomic, assign) NSUInteger regionId;
@property (nonatomic, assign) NSUInteger schoolId;

@end


@interface AIIReferenceItemListResponseQuery : AIIListResponseQuery
@end



@interface AIIReferenceItemListRequest : AIIListRequest
@end



@interface AIIReferenceItemListResponse : AIIListResponse
@end
