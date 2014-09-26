//
//  AIIRegionListPacket.h
//  AAClient
//
//  Created by iMac on 13-7-1.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIIRegionCollection.h"

@interface AIIRegionListRequest : AIIListRequest

@property (nonatomic, assign) NSUInteger parentId;
@property (nonatomic, assign) NSUInteger identifier;
@property (nonatomic, copy) NSString *name;

@end


@interface AIIRegionListResponse : AIIListResponse
@end
