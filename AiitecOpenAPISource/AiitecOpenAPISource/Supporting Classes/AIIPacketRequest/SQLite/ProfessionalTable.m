//
//  ProfessionalTable.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/12.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "ProfessionalTable.h"

@implementation ProfessionalTable

- (AIIItem *)FMResultSetToObject:(FMResultSet *)rs
{
    AIIItem *item = (AIIItem *)[super FMResultSetToObject:rs];
    item.pinyin = [rs stringForColumn:@"pinyin"];
    item.py = [rs stringForColumn:@"py"];
    return item;
}

- (NSString *)tableName
{
    return @"ky_professional";
}

- (AIIItemCollection *)queryWithTable:(AIITable *)table
{
    AIIReferenceItemListWhere *w = (AIIReferenceItemListWhere *)table.where;
    
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ ", [self tableName]];
    NSString *where = @"WHERE `level` = 3 ";
    sql = [sql stringByAppendingString:where];
    
    if (w.searchKey.length) {
        where = [NSString stringWithFormat:@" AND (`name` LIKE '%%%@%%' OR `pinyin` LIKE '%%%@%%' OR `py` LIKE '%%%@%%') ", w.searchKey,  w.searchKey,  w.searchKey];
        sql = [sql stringByAppendingString:where];
    }
    if (table.page && table.limit) {
        NSString *limit = [NSString stringWithFormat:@"LIMIT %lu,%lu ", (table.page - 1) * (table.limit), table.limit];
        sql = [sql stringByAppendingString:limit];
    }
    
    AIIItemCollection *collection = [[AIIItemCollection alloc] init];
    FMResultSet *rs = [SQLiteConnection query:sql];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

@end
