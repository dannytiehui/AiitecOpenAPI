//
//  UserTable.m
//  AAClient
//
//  Created by iMac on 13-7-3.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "UserTable.h"
#import "SQLiteConnection.h"

@implementation UserTable

- (NSString *)tableName
{
    return @"user";
}

- (int)count
{
    return [SQLiteConnection countWithTableName:[self tableName]];
}

- (AIIUserCollection *)query:(int)page limit:(int)numberOfPage orderBy:(NSString *)orderBy type:(NSString *)type key:(NSString *)searchKey
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE `name` LIKE '%%%@%%' ORDER BY `name` DESC LIMIT %d,%d", [self tableName], searchKey, (page-1)*numberOfPage, numberOfPage];
    
    AIIUser *user;
    AIIUserCollection *collection;
    FMResultSet *rs = [SQLiteConnection query:sql];
    while ([rs next]) {
        user.identifier = [[rs stringForColumn:@"id"] integerValue];
        user.name = [rs stringForColumn:@"name"];
        user.password = [rs stringForColumn:@"password"];
//        NSString *autoLogin = [rs stringForColumn:@"auto_login"];
        user.timestampUpdate = [rs stringForColumn:@"timestamp_update"];
        user.timestamp = [rs stringForColumn:@"timestamp"];
        
        [collection addObject:user];
    }
    
    return collection;
}

- (AIIUserCollection *)query
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ ", [self tableName]];
    
    AIIUser *user;
    AIIUserCollection *collection;
    FMResultSet *rs = [SQLiteConnection query:sql];
    while ([rs next]) {
        user.identifier = [[rs stringForColumn:@"id"] integerValue];
        user.name = [rs stringForColumn:@"name"];
        user.password = [rs stringForColumn:@"password"];
        //        NSString *autoLogin = [rs stringForColumn:@"auto_login"];
        user.timestampUpdate = [rs stringForColumn:@"timestamp_update"];
        user.timestamp = [rs stringForColumn:@"timestamp"];
        
        [collection addObject:user];
    }
    
    return collection;
}

- (AIIUser *)query:(NSString *)identifier
{
    AIIUser *user;
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE `id` = '%@' ", [self tableName], identifier];
    FMResultSet *rs = [SQLiteConnection query:sql];
    while ([rs next]) {
        user.identifier = [[rs stringForColumn:@"id"] integerValue];
        user.name = [rs stringForColumn:@"name"];
        user.password = [rs stringForColumn:@"password"];
//        NSString *autoLogin = [rs stringForColumn:@"auto_login"];
        user.timestampUpdate = [rs stringForColumn:@"timestamp_update"];
        user.timestamp = [rs stringForColumn:@"timestamp"];
    }
    return user;
}

- (AIIUser *)latest
{
    AIIUser *user;
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM '%@' ORDER BY timestamp_update DESC  LIMIT 0,1", [self tableName]];
    FMResultSet *rs = [SQLiteConnection query:sql];
    while ([rs next]) {
        user.identifier = [[rs stringForColumn:@"id"] integerValue];
        user.name = [rs stringForColumn:@"name"];
        user.password = [rs stringForColumn:@"password"];
//        NSString *autoLogin = [rs stringForColumn:@"auto_login"];
        user.timestampUpdate = [rs stringForColumn:@"timestamp_update"];
        user.timestamp = [rs stringForColumn:@"timestamp"];
    }
    return user;
}

- (BOOL)insert:(AIIUser *)user
{
    NSString * sql = [NSString stringWithFormat:@"INSERT INTO %@ (name, password, auto_login, timestamp_update, timestamp) VALUES (%@, %@, %@, %@, %@) ", [self tableName], user.name, user.password, @"NO", user.timestampUpdate, user.timestamp];
    return [SQLiteConnection insert:sql];
}

- (int)update:(AIIUser *)user
{
    NSString *sql = [NSString stringWithFormat:@"UPDATE %@ SET 'name' = '%@', 'password' = '%@', 'auto_login' = '%@', 'timestamp_update' = '%@', 'timestamp' = '%@' WHERE  'id' = %lu", [self tableName], user.name, user.password, @"NO", user.timestampUpdate, user.timestamp, (unsigned long)user.identifier];
    return [SQLiteConnection update:sql];
}

- (int)replaceInto:(AIIUser *)user
{
    NSString *sql = [NSString stringWithFormat:@"REPLACE INTO %@ (id, name, password, auto_login, timestamp_update, timestamp) VALUES (%lu, %@, %@, %@, %@, %@)", [self tableName], (unsigned long)user.identifier, user.name, user.password, @"NO", user.timestampUpdate, user.timestamp];
    return [SQLiteConnection update:sql];
}

- (int)delete
{
    NSString * sql = [NSString stringWithFormat:@"DELETE * FROM %@", [self tableName]];
    return [SQLiteConnection update:sql];
}

- (int)delete:(NSString *)identifier
{
    NSString * sql = [NSString stringWithFormat:@"DELETE * FROM %@ WHERE id = %@", [self tableName], identifier];
    return [SQLiteConnection update:sql];
}

@end
