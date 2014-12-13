//
//  LabelUserTable.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/12.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "LabelUserTable.h"

@implementation LabelUserTable

- (NSString *)tableName
{
    return @"ky_label_user";
}

- (AIIItemCollection *)queryWithTable:(AIITable *)table
{
    AIIReferenceItemListWhere *w = (AIIReferenceItemListWhere *)table.where;
    
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ ", [self tableName]];
    NSString *where = @"WHERE 1 ";
    sql = [sql stringByAppendingString:where];
    
    if (w.identifier) {
        where = [NSString stringWithFormat:@" AND `label_user_group_id` = %lu ", w.identifier];
        sql = [sql stringByAppendingString:where];
    }
    
    AIIItemCollection *collection = [[AIIItemCollection alloc] init];
    FMResultSet *rs = [SQLiteConnection query:sql];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

@end
