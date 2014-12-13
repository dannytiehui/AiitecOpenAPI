//
//  IndustryTable.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/12.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "IndustryTable.h"

@implementation IndustryTable

- (AIIItem *)FMResultSetToObject:(FMResultSet *)rs
{
    AIIItem *item = (AIIItem *)[super FMResultSetToObject:rs];
    item.pinyin = [rs stringForColumn:@"pinyin"];
    item.py = [rs stringForColumn:@"py"];
    return item;
}

- (NSString *)tableName
{
    return @"ky_industry";
}

- (AIIItemCollection *)queryWithTable:(AIITable *)table
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ ", [self tableName]];
   
    AIIItemCollection *collection = [[AIIItemCollection alloc] init];
    FMResultSet *rs = [SQLiteConnection query:sql];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

@end
