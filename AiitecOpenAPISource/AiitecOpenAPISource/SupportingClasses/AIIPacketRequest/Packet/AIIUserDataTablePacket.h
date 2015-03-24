//
//  AIIUserDataTablePacket.h
//  AAClient
//
//  Created by iMac on 13-5-14.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIIDataTable.h"

@interface AIIUserDataTableRequest : AIIListRequest

@property (nonatomic, strong) AIIDataTable *dataTable;

@end



@interface AIIUserDataTableResponse : AIIListResponse
@end

