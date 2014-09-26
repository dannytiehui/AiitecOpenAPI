//
//  UserTable.h
//  AAClient
//
//  Created by iMac on 13-7-3.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "Table.h"
#import "AIIUser.h"
#import "AIIUserCollection.h"

@interface UserTable : Table


/** Execute select statement
 
 按分页获取数据
 
 @param page 第几页
 
 @param numberOfPage 每页显示多少条数据
 
 @param orderBy 根据哪个字段排序
 
 @param type DESC or ASC
 
 @param searchKey 搜索关键字
 
 @return FMResultSet
 */
- (AIIUserCollection *)query:(int)page limit:(int)numberOfPage orderBy:(NSString *)orderBy type:(NSString *)type key:(NSString *)searchKey;
- (AIIUserCollection *)query;
- (AIIUser *)query:(NSString *)identifier;
- (AIIUser *)latest;

- (BOOL)insert:(AIIUser *)user;
- (int)update:(AIIUser *)user;
- (int)replaceInto:(AIIUser *)user;

- (int)delete;
- (int)delete:(NSString *)identifier;

/*
 
 CREATE TABLE `user2` (`id` INTEGER PRIMARY KEY NOT NULL, `name` VARCHAR NOT NULL, `password` VARCHAR NOT NULL , `auto_login` BOOL NOT NULL  DEFAULT false, `timestamp_update` DATETIME, `timestamp` DATETIME)
 
 REPLACE INTO user
 (
 id ,
 name ,
 password ,
 auto_login ,
 timestamp_update,
 timestamp
 )
 VALUES
 (
 12 ,
 'Bruce Bukovics' ,
 '123456',
 'NO',
 datetime( ) ,
 datetime( )
 ) ;
 */

@end
