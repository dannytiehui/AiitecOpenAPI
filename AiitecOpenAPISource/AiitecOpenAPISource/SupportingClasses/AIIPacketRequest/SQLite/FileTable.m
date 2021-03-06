//
//  FileTable.m
//  AAClient
//
//  Created by iMac on 13-7-26.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "FileTable.h"
#import "AIIFile.h"
#import "AIIFileCollection.h"

@interface FileTable ()

- (AIIFile *)FMResultSetToObject:(FMResultSet *)rs;

@end

@implementation FileTable

- (AIIFile *)FMResultSetToObject:(FMResultSet *)rs
{
    AIIFile *item = [[AIIFile alloc] init];
    [self FMResultSetToObject:rs entity:item];
    
    item.filename = [rs stringForColumn:@"filename"];
    item.path = [rs stringForColumn:@"path"];
    item.size = [[rs stringForColumn:@"size"] floatValue];
    item.extension = [rs stringForColumn:@"extension"];
    item.desc = [rs stringForColumn:@"description"];

    return item;
}

- (NSString *)tableName
{
    return @"file";
}

- (AIIFileCollection *)query:(int)page limit:(int)numberOfPage orderBy:(NSString *)orderBy type:(NSString *)type key:(NSString *)searchKey
{
    NSString *sql = [self querySQLString:page limit:numberOfPage orderBy:orderBy type:type key:searchKey];
    
    AIIFileCollection *collection = [[AIIFileCollection alloc] init];
    FMResultSet *rs = [SQLiteConnection query:sql];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

- (AIIFileCollection *)query
{
    AIIFileCollection *collection = [[AIIFileCollection alloc] init];
    
    FMResultSet *rs = [self queryResultSet];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

- (AIIFile *)query:(NSUInteger)identifier
{
    AIIFile *item = [[AIIFile alloc] init];
    
    FMResultSet *rs = [self queryResultSet:identifier];
    while ([rs next]) {
        item = [self FMResultSetToObject:rs];
    }
    return item;
}

- (AIIFile *)query:(NSUInteger)identifier timestampUpdate:(NSString *)timestamp
{
    AIIFile *item = [[AIIFile alloc] init];
    
    FMResultSet *rs = [self queryResultSet:identifier timestampUpdate:timestamp];
    while ([rs next]) {
        item = [self FMResultSetToObject:rs];
    }
    return item;
}

- (int)replaceIntoItem:(AIIFile *)item
{

    NSString *sql = [NSString stringWithFormat:@"REPLACE INTO %@ (id, name, filename, path, size, extension, description, is_delete, timestamp_update, timestamp) VALUES (%lu, '%@', '%@', '%@', %f, '%@', '%@', %d, '%@', '%@')", [self tableName], (unsigned long)item.identifier, item.name, item.filename, item.path, item.size, item.extension, item.desc, 0, item.timestampUpdate, item.timestamp];
    return [SQLiteConnection update:sql];
}

- (int)replaceIntoCollection:(AIIFileCollection *)collection
{
    int numberOfChanges = 0;
    NSUInteger count = [collection count];
    NSString *sql;
    AIIFile *item;
    for (NSUInteger i = 0; i < count; i++) {
        item = [collection objectAtIndex:i];
        
        sql = [NSString stringWithFormat:@"REPLACE INTO %@ (id, name, filename, path, size, extension, description, is_delete, timestamp_update, timestamp) VALUES (%lu, '%@', '%@', '%@', %f, '%@', '%@', %d, '%@', '%@')", [self tableName], (unsigned long)item.identifier, item.name, item.filename, item.path, item.size, item.extension, item.desc, 0, item.timestampUpdate, item.timestamp];
        numberOfChanges += [SQLiteConnection update:sql];
    }
    return numberOfChanges;
}

@end