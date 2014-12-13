//
//  Table.m
//  AAClient
//
//  Created by iMac on 13-7-3.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "Table.h"

@implementation Table

#pragma mark - protected

- (NSString *)querySQLString:(int)page limit:(int)numberOfPage orderBy:(NSString *)orderBy type:(NSString *)type key:(NSString *)searchKey
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ ", [self tableName]];
    if (searchKey.length) {
        NSString *where = [NSString stringWithFormat:@"WHERE `name` LIKE '%%%@%%' ", searchKey];
        sql = [sql stringByAppendingString:where];
    }
    if (orderBy && type) {
        NSString *order_by = [NSString stringWithFormat:@"ORDER BY `%@` %@ ", orderBy, type];
        sql = [sql stringByAppendingString:order_by];
    }
    if (page && numberOfPage) {
        NSString *limit = [NSString stringWithFormat:@"LIMIT %d,%d ", (page-1)*numberOfPage, numberOfPage];
        sql = [sql stringByAppendingString:limit];
    }
    return sql;
}

- (NSString *)querySQLString:(int)page limit:(int)numberOfPage orderBy:(NSString *)orderBy type:(NSString *)type where:(NSString *)WHEREString
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ ", [self tableName]];
    if (WHEREString.length) {
        NSString *where = [NSString stringWithFormat:@" %@", WHEREString];
        sql = [sql stringByAppendingString:where];
    }
    if (orderBy && type) {
        NSString *order_by = [NSString stringWithFormat:@"ORDER BY `%@` %@ ", orderBy, type];
        sql = [sql stringByAppendingString:order_by];
    }
    if (page && numberOfPage) {
        NSString *limit = [NSString stringWithFormat:@"LIMIT %d,%d ", (page-1)*numberOfPage, numberOfPage];
        sql = [sql stringByAppendingString:limit];
    }
    return sql;
}

- (FMResultSet *)queryResultSet
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ ", [self tableName]];
    return [SQLiteConnection query:sql];
}

- (FMResultSet *)queryResultSet:(NSUInteger)identifier
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE id = %lu ", [self tableName], identifier];
    return [SQLiteConnection query:sql];

}

- (FMResultSet *)queryResultSet:(NSUInteger)identifier timestampUpdate:(NSString *)timestamp
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE id = %lu AND timestamp_update = '%@' ", [self tableName], identifier, timestamp];
    return [SQLiteConnection query:sql];
}

- (FMResultSet *)queryResultSetWithWhere:(NSString *)WHEREString
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ %@", [self tableName], WHEREString];
    return [SQLiteConnection query:sql];
}

- (FMResultSet *)latestResultSet
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM '%@' ORDER BY timestamp_update DESC LIMIT 0,1", [self tableName]];
    return [SQLiteConnection query:sql];
}

#pragma mark - public

- (AIIEntity *)FMResultSetToObject:(FMResultSet *)rs
{
    // 子类实现
    return nil;
}

- (void)FMResultSetToObject:(FMResultSet *)rs entity:(AIIEntity *)item
{
//    Entity *item = [[Entity alloc] init];
    item.identifier = [[rs stringForColumn:@"id"] integerValue];
    if ([rs columnIndexForName:@"name"] != -1) {
        item.name = [rs stringForColumn:@"name"];
    }
    item.timestampUpdate = [rs stringForColumn:@"timestamp_update"];
    item.timestamp = [rs stringForColumn:@"timestamp"];
//    return item;
}

- (NSString *)tableName
{
    return @"";
}

- (int)count
{
    return [SQLiteConnection countWithTableName:[self tableName]];
}

- (int)delete
{
    NSString * sql = [NSString stringWithFormat:@"DELETE FROM %@", [self tableName]];
    return [SQLiteConnection update:sql];
}

- (int)delete:(NSUInteger)identifier
{
    NSString * sql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE id = %lu", [self tableName], identifier];
    return [SQLiteConnection update:sql];
}

- (int)deleteInclude:(AIIModelCollection *)collection
{
    NSUInteger count = [collection count];
    if (count == 0) {
        return 0;
    }
    
    NSMutableArray *deleteArray = [[NSMutableArray alloc] init];
    AIIEntity *item = [[AIIEntity alloc] init];
    for (NSUInteger i = 0; i < count; i++) {
        item = [collection objectAtIndex:i];
        [deleteArray addObject:[NSString stringWithFormat:@"%lu", item.identifier]];
    }
    NSString *idsDelete = [deleteArray componentsJoinedByString:@","];
    
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE id IN (%@) ", [self tableName], idsDelete];
    
    return [SQLiteConnection update:sql];
}

- (int)deleteExcept:(AIIModelCollection *)collection
{
    NSUInteger count = [collection count];
    if (count == 0) {
        return 0;
    }
    
    NSMutableArray *deleteArray = [[NSMutableArray alloc] init];
    AIIEntity *item = [[AIIEntity alloc] init];
    for (NSUInteger i = 0; i < count; i++) {
        item = [collection objectAtIndex:i];
        [deleteArray addObject:[NSString stringWithFormat:@"%lu", item.identifier]];
    }
    NSString *idsDelete = [deleteArray componentsJoinedByString:@","];
    
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE id NOT IN (%@)", [self tableName], idsDelete];
    return [SQLiteConnection update:sql];
}

- (int)deleteRangeOfIdsExcept:(AIIModelCollection *)collection key:(NSString *)searchKey
{
    NSUInteger count = [collection count];
    if (count == 0) {
        return 0;
    }
    
    NSMutableArray *deleteArray = [[NSMutableArray alloc] init];
    AIIEntity *item = [[AIIEntity alloc] init];
    for (NSUInteger i = 0; i < count; i++) {
        item = [collection objectAtIndex:i];
        [deleteArray addObject:[NSString stringWithFormat:@"%lu", item.identifier]];
    }
    NSString *idsDelete = [deleteArray componentsJoinedByString:@","];
    
    NSUInteger idMin = [[deleteArray objectAtIndex:0] intValue], idMax = idMin, temp = 0;
    for (NSUInteger i = 1; i < count; i++) {
        temp = [[deleteArray objectAtIndex:i] intValue];
        idMin = idMin > temp ? temp : idMin;
        idMax = idMax < temp ? temp : idMax;
    }
    
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM %@ ", [self tableName]];
    NSString *where;
    if (idMin != 0 && idMax !=0) {
        where = [NSString stringWithFormat:@"WHERE id > %lu AND id < %lu AND id NOT IN (%@) ", idMin, idMax, idsDelete];
        sql = [sql stringByAppendingString:where];
    }
    if (searchKey.length) {
        where = [NSString stringWithFormat:@"AND `name` LIKE '%%%@%%' ", searchKey];
        sql = [sql stringByAppendingString:where];
    }
    
    return [SQLiteConnection update:sql];
}

- (AIIModelCollection *)query:(int)page limit:(int)numberOfPage orderBy:(NSString *)orderBy type:(NSString *)type key:(NSString *)searchKey
{
    // 子类实现
    return nil;
}

- (AIIModelCollection *)query
{
    // 子类实现
    return nil;
}

- (AIIModelCollection *)queryWithTable:(AIITable *)tableCondition
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ ", [self tableName]];
    
    AIIModelCollection *collection = [[AIIModelCollection alloc] init];
    FMResultSet *rs = [SQLiteConnection query:sql];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

- (AIIEntity *)query:(NSUInteger)identifier
{
    // 子类实现
    return nil;
}

- (AIIEntity *)query:(NSUInteger)identifier timestampUpdate:(NSString *)timestamp
{
    // 子类实现
    return nil;
}

- (AIIEntity *)latest
{
    AIIEntity *item = [[AIIEntity alloc] init];
    
    FMResultSet *rs = [self latestResultSet];
    while ([rs next]) {
        [self FMResultSetToObject:rs entity:item];
    }
    return item;
}

- (int)replaceIntoItem:(AIIEntity *)item
{
    // 子类实现
    return 0;
}

- (int)replaceIntoCollection:(AIIModelCollection *)collection
{
    // 子类实现
    return 0;
}

- (NSString *)diff:(AIIModelCollection *)collection
{
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    AIIEntity *item;
    NSUInteger count = [collection count];
    for (NSUInteger i = 0; i < count; i++) {
        item = [collection objectAtIndex:i];
        NSString *WHEREString = [NSString stringWithFormat:@"WHERE id = %lu AND timestamp_update = '%@'", item.identifier, item.timestampUpdate];
        int n = [SQLiteConnection countWithTableName:[self tableName] where:WHEREString];
        if (n == 0) {
            [mArray addObject:[NSString stringWithFormat:@"%lu", item.identifier]];
        }
    }
    NSString *ids = [mArray componentsJoinedByString:@","];
    return ids;
}

@end
