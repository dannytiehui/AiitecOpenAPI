//
//  AddressbookTable.h
//  AAClient
//
//  Created by iMac on 13-7-24.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "Table.h"

@class AddressbookCollection;

@interface AddressbookTable : Table

- (AddressbookCollection *)query:(int)page limit:(int)numberOfPage orderBy:(NSString *)orderBy type:(NSString *)type key:(NSString *)searchKey groupId:(NSUInteger)groupId;

@end
