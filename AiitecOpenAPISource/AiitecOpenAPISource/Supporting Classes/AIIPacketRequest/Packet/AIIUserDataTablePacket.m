//
//  AIIUserDataTablePacket.m
//  AAClient
//
//  Created by iMac on 13-5-14.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIUserDataTablePacket.h"

#import "AIIUser.h"
#import "AIIUserCollection.h"

#import "AIIDataField.h"
#import "AIITableSchema.h"
#import "AIIDataItem.h"
#import "AIIDataRow.h"
#import "AIIDataRowCollection.h"
#import "AIIDataTable.h"

@implementation AIIUserDataTableRequest
/*
- (NSString *)nameSpace
{
    return @"UserDataTable";
}

- (void)valueToDictionary:(NSMutableDictionary *)properties{
	[super valueToDictionary:properties];
	NSMutableDictionary *query = (NSMutableDictionary *)[AIIIqPacket findProperty:properties path:@"q"];
    
    if (self.dataTable) {
        NSMutableDictionary *prop = [[NSMutableDictionary alloc] init];
        [query setObject:prop forKey:@"table"];
        [self.dataTable valueToDictionary:prop];
    }
}
*/
@end


@implementation AIIUserDataTableResponse
/*
- (id)init
{
    self = [super init];
    if (self) {
        self.isNeedTranslate = YES;
    }
    return self;
}

- (void)translateDataTableToEntityList{
    if (self.dataTable) {
        AIITableSchema *schema = self.dataTable.tableSchema;
        AIIDataRowCollection *rowCollection = self.dataTable.dataRowCollection;
        AIIDataField *field = nil;
        AIIDataRow *row = nil;
        AIIUser *item = nil;
        for (int y=0; y<[rowCollection count];y++) {
            row = [rowCollection objectAtIndex:y];
            item = [[AIIUser alloc] init];
            [self.entityList addObject:item];
            for (int i=0; i<[schema count]; i++) {
                field = [schema objectAtIndex:i];
                if ([[field name] isEqualToString:@"id"]) {
                    item.identifier = [[[row objectForFieldName:@"id"] value] intValue];
                }
                else if([[field name] isEqualToString:@"name"]){
                    item.name = [[row objectForFieldName:@"name"] value];
                }
            }
        }
    }
}
*/

@end
