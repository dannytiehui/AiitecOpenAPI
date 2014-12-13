//
//  DepartmentsTable.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/12.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "DepartmentsTable.h"

@implementation DepartmentsTable

- (AIIItem *)FMResultSetToObject:(FMResultSet *)rs
{
    AIIItem *item = (AIIItem *)[super FMResultSetToObject:rs];
    item.timestamp = [rs stringForColumn:@"timestamp"];
    return item;
}

- (NSString *)tableName
{
    return @"ky_departments";
}

- (AIIItemCollection *)queryWithTable:(AIITable *)table
{
    AIIReferenceItemListWhere *w = (AIIReferenceItemListWhere *)table.where;
    
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ ", [self tableName]];
    NSString *where = @"WHERE 1 ";
    sql = [sql stringByAppendingString:where];
    
    if (w.schoolId) {
        where = [NSString stringWithFormat:@" AND `school_id` = %lu ", w.schoolId];
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
