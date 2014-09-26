//
//  RegionTable.m
//  AAClient
//
//  Created by iMac on 13-7-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "RegionTable.h"
#import "AIIRegion.h"
#import "AIIRegionCollection.h"

@interface RegionTable ()

- (AIIRegion *)FMResultSetToObject:(FMResultSet *)rs;
//- (AIIRegionCollection *)queryWithWhere:(NSString *)WHEREString;

@end

@implementation RegionTable

- (AIIRegion *)FMResultSetToObject:(FMResultSet *)rs
{
    AIIRegion *item = [[AIIRegion alloc] init];
    item.identifier = [[rs stringForColumn:@"id"] integerValue];
    item.parentId = [[rs stringForColumn:@"parent_id"] integerValue];
    item.name = [rs stringForColumn:@"name"];
    item.pinyin = [rs stringForColumn:@"pinyin"];
    return item;
}

//- (AIIRegionCollection *)queryWithWhere:(NSString *)WHEREString
//{
//    AIIRegionCollection *collection = [[RegionCollection alloc] init];
//    FMResultSet *rs = [self queryResultSetWithWhere:WHEREString];
//    while ([rs next]) {
//        [collection addObject:[self FMResultSetToObject:rs]];
//    }
//    return collection;
//}

- (NSString *)tableName
{
    return @"region";
}

- (AIIRegionCollection *)query:(int)page limit:(int)numberOfPage orderBy:(NSString *)orderBy type:(NSString *)type key:(NSString *)searchKey
{
    NSString *sql = [self querySQLString:page limit:numberOfPage orderBy:orderBy type:type key:searchKey];

    AIIRegionCollection *collection = [[AIIRegionCollection alloc] init];
    FMResultSet *rs = [SQLiteConnection query:sql];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

- (AIIRegionCollection *)query
{
    AIIRegionCollection *collection = [[AIIRegionCollection alloc] init];
    FMResultSet *rs = [self queryResultSet];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

- (AIIRegion *)query:(NSUInteger)identifier
{
    AIIRegion *item = [[AIIRegion alloc] init];
    
    FMResultSet *rs = [self queryResultSet:identifier];
    while ([rs next]) {
        item = [self FMResultSetToObject:rs];
    }
    return item;
}

- (AIIRegionCollection *)queryWithParentId:(NSUInteger)parentId
{
    NSString *WHEREString = [NSString stringWithFormat:@"WHERE parent_id = %d", parentId];
    AIIRegionCollection *collection = [[AIIRegionCollection alloc] init];
    FMResultSet *rs = [self queryResultSetWithWhere:WHEREString];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

- (AIIRegionCollection *)queryWithIdentifier:(NSUInteger)identifier
{
    AIIRegionCollection *regionCollection = [[AIIRegionCollection alloc] init];
    AIIRegion *item = (AIIRegion *)[self query:identifier];

    AIIRegion *item2 = nil;
    if (item.parentId) {
        [regionCollection addObject:item];
        item2 = (AIIRegion *)[self query:item.parentId];
    }

    AIIRegion *item3 = nil;
    if (item2.parentId) {
        [regionCollection addObject:item2];
        item3 = (AIIRegion *)[self query:item2.parentId];
    }

    if (item3.parentId) {
        [regionCollection addObject:item3];
    }
    
    return regionCollection;
}

- (AIIRegionCollection *)queryWithName:(NSString *)name
{
    AIIRegionCollection *regionCollection = [[AIIRegionCollection alloc] init];
    AIIRegion *item = nil;
    AIIRegion *item2 = nil;
    AIIRegion *item3 = nil;
    
    NSString *WHEREString = [NSString stringWithFormat:@"WHERE name = '%@'", name];
    FMResultSet *rs = [self queryResultSetWithWhere:WHEREString];
    while ([rs next]) {
        item = [self FMResultSetToObject:rs];
    }
    
    if (item) {
        [regionCollection addObject:item];
        
        WHEREString = [NSString stringWithFormat:@"WHERE id = %d", item.parentId];
        FMResultSet *rs = [self queryResultSetWithWhere:WHEREString];
        while ([rs next]) {
            item2 = [self FMResultSetToObject:rs];
        }
    }
    
    if (item2) {
        [regionCollection addObject:item2];
        
        WHEREString = [NSString stringWithFormat:@"WHERE id = %d", item2.parentId];
        FMResultSet *rs = [self queryResultSetWithWhere:WHEREString];
        while ([rs next]) {
            item3 = [self FMResultSetToObject:rs];
        }
    }
    
    if (item3) {
        [regionCollection addObject:item3];
    }
    
    return regionCollection;
}

- (int)replaceIntoItem:(AIIRegion *)item
{
    NSString *sql = [NSString stringWithFormat:@"REPLACE INTO %@ (id, parent_id, name, pinyin) VALUES (%d, %d, '%@', '%@')", [self tableName], item.identifier, item.parentId, item.name, item.pinyin];
    return [SQLiteConnection update:sql];
}

- (int)replaceIntoCollection:(AIIRegionCollection *)collection
{
    int numberOfChanges = 0;
    int count = [collection count];
    NSString *sql;
    AIIRegion *item;
    for (NSUInteger i = 0; i < count; i++) {
        item = [collection objectAtIndex:i];
        sql = [NSString stringWithFormat:@"REPLACE INTO %@ (id, parent_id, name, pinyin) VALUES (%d, %d, '%@', '%@')", [self tableName], item.identifier, item.parentId, item.name, item.pinyin];
        numberOfChanges += [SQLiteConnection update:sql];
    }
    return numberOfChanges;
}

@end
