//
//  ItemTable.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/13.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "ItemTable.h"

@implementation ItemTable

- (AIIItem *)FMResultSetToObject:(FMResultSet *)rs
{
    AIIItem *item = [[AIIItem alloc] init];
    item.identifier = [[rs stringForColumn:@"id"] integerValue];
    item.name = [rs stringForColumn:@"name"];
//    item.pinyin = [rs stringForColumn:@"pinyin"];
//    item.py = [rs stringForColumn:@"py"];
//    item.key = [rs stringForColumn:@"key"];
//    item.value = [rs stringForColumn:@"value"];
//    item.imagePath = [rs stringForColumn:@"imagePath"];
//    item.parentId = [[rs stringForColumn:@"parent_id"] integerValue];
    return item;
}

- (NSString *)tableName
{
    return @"ky_item";
}


- (AIIItemCollection *)query:(int)page limit:(int)numberOfPage orderBy:(NSString *)orderBy type:(NSString *)type key:(NSString *)searchKey
{
    NSString *sql = [self querySQLString:page limit:numberOfPage orderBy:orderBy type:type key:searchKey];
    
    AIIItemCollection *collection = [[AIIItemCollection alloc] init];
    FMResultSet *rs = [SQLiteConnection query:sql];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

- (AIIItemCollection *)query
{
    AIIItemCollection *collection = [[AIIItemCollection alloc] init];
    FMResultSet *rs = [self queryResultSet];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

- (AIIItem *)query:(NSUInteger)identifier
{
    AIIItem *item = [[AIIItem alloc] init];
    
    FMResultSet *rs = [self queryResultSet:identifier];
    while ([rs next]) {
        item = (AIIItem *)[self FMResultSetToObject:rs];
    }
    return item;
}

- (AIIItemCollection *)queryWithParentId:(NSUInteger)parentId
{
    NSString *WHEREString = [NSString stringWithFormat:@"WHERE parent_id = %lu", (unsigned long)parentId];
    AIIItemCollection *collection = [[AIIItemCollection alloc] init];
    FMResultSet *rs = [self queryResultSetWithWhere:WHEREString];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

- (AIIItemCollection *)queryWithIdentifier:(NSUInteger)identifier
{
    AIIItemCollection *itemCollection = [[AIIItemCollection alloc] init];
    AIIItem *item = (AIIItem *)[self query:identifier];
    
    AIIItem *item2 = nil;
    if (item.parentId) {
        [itemCollection addObject:item];
        item2 = (AIIItem *)[self query:item.parentId];
    }
    
    AIIItem *item3 = nil;
    if (item2.parentId) {
        [itemCollection addObject:item2];
        item3 = (AIIItem *)[self query:item2.parentId];
    }
    
    if (item3.parentId) {
        [itemCollection addObject:item3];
    }
    
    return itemCollection;
}

- (AIIItemCollection *)queryWithName:(NSString *)name
{
    AIIItemCollection *itemCollection = [[AIIItemCollection alloc] init];
    AIIItem *item = nil;
    AIIItem *item2 = nil;
    AIIItem *item3 = nil;
    
    NSString *WHEREString = [NSString stringWithFormat:@"WHERE name = '%@'", name];
    FMResultSet *rs = [self queryResultSetWithWhere:WHEREString];
    while ([rs next]) {
        item = (AIIItem *)[self FMResultSetToObject:rs];
    }
    
    if (item) {
        [itemCollection addObject:item];
        
        WHEREString = [NSString stringWithFormat:@"WHERE id = %lu", (unsigned long)item.parentId];
        FMResultSet *rs = [self queryResultSetWithWhere:WHEREString];
        while ([rs next]) {
            item2 = (AIIItem *)[self FMResultSetToObject:rs];
        }
    }
    
    if (item2) {
        [itemCollection addObject:item2];
        
        WHEREString = [NSString stringWithFormat:@"WHERE id = %lu", (unsigned long)item2.parentId];
        FMResultSet *rs = [self queryResultSetWithWhere:WHEREString];
        while ([rs next]) {
            item3 = (AIIItem *)[self FMResultSetToObject:rs];
        }
    }
    
    if (item3) {
        [itemCollection addObject:item3];
    }
    
    return itemCollection;
}

- (int)replaceIntoItem:(AIIItem *)item
{
    NSString *sql = [NSString stringWithFormat:@"REPLACE INTO %@ (id, parent_id, name, pinyin) VALUES (%lu, %lu, '%@', '%@')", [self tableName], (unsigned long)item.identifier, (unsigned long)item.parentId, item.name, item.pinyin];
    return [SQLiteConnection update:sql];
}

- (int)replaceIntoCollection:(AIIItemCollection *)collection
{
    int numberOfChanges = 0;
    NSUInteger count = [collection count];
    NSString *sql;
    AIIItem *item;
    for (NSUInteger i = 0; i < count; i++) {
        item = [collection objectAtIndex:i];
        sql = [NSString stringWithFormat:@"REPLACE INTO %@ (id, parent_id, name, pinyin) VALUES (%lu, %lu, '%@', '%@')", [self tableName], (unsigned long)item.identifier, (unsigned long)item.parentId, item.name, item.pinyin];
        numberOfChanges += [SQLiteConnection update:sql];
    }
    return numberOfChanges;
}

- (AIIItemCollection *)queryWithTable:(AIITable *)table
{
    AIIReferenceItemListWhere *w = (AIIReferenceItemListWhere *)table.where;
    
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ ", [self tableName]];
    NSString *where = @"WHERE 1 ";
    sql = [sql stringByAppendingString:where];
    
    if (w.searchKey.length) {
        where = [NSString stringWithFormat:@" AND (`name` LIKE '%%%@%%' OR `pinyin` LIKE '%%%@%%' OR `py` LIKE '%%%@%%') ", w.searchKey,  w.searchKey,  w.searchKey];
        sql = [sql stringByAppendingString:where];
    }
//    if (orderBy && type) {
//        NSString *order_by = [NSString stringWithFormat:@"ORDER BY `%@` %@ ", orderBy, type];
//        sql = [sql stringByAppendingString:order_by];
//    }
    if (table.page && table.limit) {
        NSString *limit = [NSString stringWithFormat:@"LIMIT %lu,%lu ", (unsigned long)((table.page - 1)*(table.limit)), (unsigned long)table.limit];
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
