//
//  ItemTable.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/13.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "Table.h"
#import "AIIItemCollection.h"
#import "AIIReferenceItemListPacket.h"

@interface ItemTable : Table

- (AIIItemCollection *)queryWithTable:(AIITable *)table;

@end
