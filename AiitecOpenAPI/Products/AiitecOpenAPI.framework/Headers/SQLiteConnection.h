//
//  SQLiteConnection.h
//  AAClient
//
//  Created by iMac on 13-7-2.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
//#import "FMDatabasePool.h"
//#import "FMDatabaseQueue.h"
//#import "FMResultSet.h"

@interface SQLiteConnection : NSObject

+ (int)countWithTableName:(NSString *)tableName;
+ (int)countWithTableName:(NSString *)tableName where:(NSString *)WHEREString;
+ (FMResultSet *)query:(NSString *)SQLString;
+ (BOOL)insert:(NSString *)SQLString;
+ (int)update:(NSString *)SQLString;
+ (int)update:(NSString *)SQLString withArgumentsInArray:(NSArray *)arguments;
+ (BOOL)close;
+ (BOOL)removeSQLiteCache;

@end
