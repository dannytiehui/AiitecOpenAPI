//
//  SQLiteConnection.m
//  AAClient
//
//  Created by iMac on 13-7-2.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "SQLiteConnection.h"
#import "AIIUtility.h"

@interface SQLiteConnection ()
{
    NSString *dbName;
}

@property(nonatomic, strong) FMDatabase *db;

+ (NSString *)path;
- (BOOL)open;
- (NSString *)removeIllegalCharacters:(NSString *)SQLString;
+ (SQLiteConnection *)sharedInstance;

@end


@implementation SQLiteConnection

+ (NSString *)path
{
    static NSString *sqliteDirectories = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *cache = [AIIUtility cachesPacketPath];
        sqliteDirectories = [cache stringByAppendingPathComponent:@"SQLite"];
#ifdef DEBUG
        NSLog(@"sqliteDirectories = %@", sqliteDirectories);
#endif
    });
    return sqliteDirectories;
}

- (id)init
{
    if (self = [super init]) {
        dbName = @"AiitecOpenAPIDB";
    }
    return self;
}

- (BOOL)open
{
    BOOL b = [self.db open];
    if (!b) {
        // 检查资料库是否存在并复制到 Documents
        NSString *sqliteDirectories = [SQLiteConnection path];
        NSString *path = [sqliteDirectories stringByAppendingPathComponent:dbName];
        
        NSFileManager *fm = [NSFileManager defaultManager];
        BOOL exists = [fm fileExistsAtPath:path];
        // 若已经存在，则不用从应用程式的资料档内拷贝到 Documents
        if (!exists) {
            BOOL isDir;
            if (!([fm fileExistsAtPath:sqliteDirectories isDirectory:&isDir] && isDir)) {
                [fm createDirectoryAtPath:sqliteDirectories withIntermediateDirectories:YES attributes:nil error:nil];
            }
            
            // 否则从应用程式里面复制到 Documents 目录
            NSString *resourcePath = [[NSBundle mainBundle] pathForResource:dbName ofType:@"sqlite"];
            [fm copyItemAtPath:resourcePath toPath:path error:nil];
        }
        _db = [FMDatabase databaseWithPath:path];
        b = [_db open];
    }
    return b;
}

- (NSString *)removeIllegalCharacters:(NSString *)SQLString
{
    return [SQLString stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
}

+ (SQLiteConnection *)sharedInstance
{
    static SQLiteConnection *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SQLiteConnection alloc] init];
    });
    return instance;
}

+ (int)countWithTableName:(NSString *)tableName
{
    int count = 0;
    
    NSString *sql = [NSString stringWithFormat:@"SELECT count(*) count FROM %@", tableName];
    SQLiteConnection *handle = [SQLiteConnection sharedInstance];
    if ([handle open]) {
#ifdef DEBUG
        NSLog(@"executeQuery = %@", sql);
#endif
        FMDatabase *db = handle.db;
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            count = [rs intForColumn:@"count"];
        }
    }
    return count;
}

+ (int)countWithTableName:(NSString *)tableName where:(NSString *)WHEREString
{
    int count = 0;
    
    NSString *sql = [NSString stringWithFormat:@"SELECT count(*) count FROM %@ %@", tableName, WHEREString];
    SQLiteConnection *handle = [SQLiteConnection sharedInstance];
    if ([handle open]) {
#ifdef DEBUG
        NSLog(@"executeQuery = %@", sql);
#endif
        FMDatabase *db = handle.db;
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            count = [rs intForColumn:@"count"];
        }
    }
    return count;
}

+ (FMResultSet *)query:(NSString *)SQLString
{
    FMResultSet *rs;
    SQLiteConnection *handle = [SQLiteConnection sharedInstance];
    if ([handle open]) {
#ifdef DEBUG
        NSLog(@"query = %@", SQLString);
#endif
        FMDatabase *db = handle.db;
        rs = [db executeQuery:SQLString];
    }
    return rs;
}

+ (BOOL)insert:(NSString *)SQLString
{
    BOOL b = NO;
    SQLiteConnection *handle = [SQLiteConnection sharedInstance];
    if ([handle open]) {
        SQLString = [handle removeIllegalCharacters:SQLString];
#ifdef DEBUG
        NSLog(@"insert = %@", SQLString);
#endif
        FMDatabase *db = handle.db;
        b = [db executeUpdate:SQLString];
//        NSAssert1(b, @"Error: %@", SQLString);
    }
    return b;
}

+ (int)update:(NSString *)SQLString
{
    int numberOfChanges = 0;
    SQLiteConnection *handle = [SQLiteConnection sharedInstance];
    if ([handle open]) {
        SQLString = [handle removeIllegalCharacters:SQLString];
#ifdef DEBUG
        NSLog(@"update = %@", SQLString);
#endif
        FMDatabase *db = handle.db;
        [db executeUpdate:SQLString];
        numberOfChanges = [db changes];
    }
    return numberOfChanges;
}

+ (int)update:(NSString *)SQLString withArgumentsInArray:(NSArray *)arguments
{
    int numberOfChanges = 0;
    SQLiteConnection *handle = [SQLiteConnection sharedInstance];
    FMDatabase *db = handle.db;
    if ([db open]) {
        [db executeUpdate:SQLString withArgumentsInArray:arguments];
//        NSAssert1(b, @"Error: %@", SQLString);
#ifdef DEBUG
        NSLog(@"update = %@", SQLString);
#endif
        numberOfChanges = [db changes];
    }
    return numberOfChanges;
}

+ (BOOL)close
{
    return [[SQLiteConnection sharedInstance].db close];
}

+ (BOOL)removeSQLiteCache
{
    NSFileManager *fm = [NSFileManager defaultManager];
    return [fm removeItemAtPath:[SQLiteConnection path] error:nil];
}

//- (void)queue
//{
//    // 创建，最好放在一个单例的类中
//    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:aPath];
//    
//    // 使用
//    [queue inDatabase:^(FMDatabase *db) {
//        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:1]];
//        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:2]];
//        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:3]];
//        
//        FMResultSet *rs = [db executeQuery:@"select * from foo"];
//        while ([rs next]) {
//            // …
//        }
//    }];
//    
//    // 如果要支持事务
//    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
//        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:1]];
//        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:2]];
//        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:3]];
//        
//        if (whoopsSomethingWrongHappened) {
//            *rollback = YES;
//            return;
//        }
//        // etc…
//        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:4]];
//    }];
//}

@end
