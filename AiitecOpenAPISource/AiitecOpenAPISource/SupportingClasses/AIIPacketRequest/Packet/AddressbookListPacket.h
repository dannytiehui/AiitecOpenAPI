//
//  AddressbookListPacket.h
//  AAClient
//
//  Created by iMac on 13-7-22.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIIAddressbookCollection.h"

@interface AddressbookListRequest : AIIListRequest

@property (nonatomic, assign) NSUInteger addressbookGroupId;

@end


@interface AddressbookListResponse : AIIListResponse
@end
