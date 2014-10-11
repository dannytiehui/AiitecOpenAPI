//
//  Table.h
//  AAClient
//
//  Created by iMac on 13-7-3.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "SQLiteConnection.h"
#import "AIIEntity.h"
#import "AIIModelCollection.h"

@interface Table : NSObject

#pragma mark - protected

- (NSString *)querySQLString:(int)page limit:(int)numberOfPage orderBy:(NSString *)orderBy type:(NSString *)type key:(NSString *)searchKey;
- (NSString *)querySQLString:(int)page limit:(int)numberOfPage orderBy:(NSString *)orderBy type:(NSString *)type where:(NSString *)WHEREString;
- (FMResultSet *)queryResultSet;
- (FMResultSet *)queryResultSet:(NSUInteger)identifier;
- (FMResultSet *)queryResultSet:(NSUInteger)identifier timestampUpdate:(NSString *)timestamp;
- (FMResultSet *)queryResultSetWithWhere:(NSString *)WHEREString;
- (FMResultSet *)latestResultSet;


#pragma mark - public

//- (Entity *)FMResultSetToObject:(FMResultSet *)rs;
- (void)FMResultSetToObject:(FMResultSet *)rs entity:(AIIEntity *)item;

- (NSString *)tableName;
- (int)count;

- (int)delete;
- (int)delete:(NSUInteger)identifier;
- (int)deleteInclude:(AIIModelCollection *)collection;
- (int)deleteExcept:(AIIModelCollection *)collection;
- (int)deleteRangeOfIdsExcept:(AIIModelCollection *)collection key:(NSString *)searchKey;

/** Execute select statement
 
 按分页获取数据
 
 @param page 第几页
 
 @param numberOfPage 每页显示多少条数据
 
 @param orderBy 根据哪个字段排序
 
 @param type DESC or ASC
 
 @param searchKey 搜索关键字
 
 @return ModelCollection
 */
- (AIIModelCollection *)query:(int)page limit:(int)numberOfPage orderBy:(NSString *)orderBy type:(NSString *)type key:(NSString *)searchKey;
- (AIIModelCollection *)query;
- (AIIEntity *)query:(NSUInteger)identifier;
- (AIIEntity *)query:(NSUInteger)identifier timestampUpdate:(NSString *)timestamp;
- (AIIEntity *)latest;

- (int)replaceIntoItem:(AIIEntity *)item;
- (int)replaceIntoCollection:(AIIModelCollection *)collection;

// @return ids: 1,2,3
- (NSString *)diff:(AIIModelCollection *)collection;

@end
