//
//  ArticleTable.m
//  AAClient
//
//  Created by iMac on 13-7-22.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "ArticleTable.h"
#import "AIIArticle.h"
#import "AIIArticleCollection.h"

@interface ArticleTable ()

- (AIIArticle *)FMResultSetToObject:(FMResultSet *)rs;

@end



@implementation ArticleTable

- (AIIArticle *)FMResultSetToObject:(FMResultSet *)rs
{
    AIIArticle *item = [[AIIArticle alloc] init];
    [self FMResultSetToObject:rs entity:item];
    
    item.title = [rs stringForColumn:@"title"];
    item.userId = [[rs stringForColumn:@"user_id"] integerValue];
    item.username = [rs stringForColumn:@"user_name"];
    item.content = [rs stringForColumn:@"content"];
    
    NSString *images = [rs stringForColumn:@"images"];
    if (images) {
        // NSString to NSDictionary
        NSData *data = [images dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *properties = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        AIIImageCollection *ic = [[AIIImageCollection alloc] init];
//        [ic valueFromDictionary:properties];
        [ic setObjectWithArray:(NSArray *)properties];
        item.imageCollection = ic;
    }
    
    return item;
}

- (NSString *)tableName
{
    return @"AIIArticle";
}

- (AIIArticleCollection *)query:(int)page limit:(int)numberOfPage orderBy:(NSString *)orderBy type:(NSString *)type key:(NSString *)searchKey
{
    NSString *sql = [self querySQLString:page limit:numberOfPage orderBy:orderBy type:type key:searchKey];
    
    AIIArticleCollection *collection = [[AIIArticleCollection alloc] init];
    FMResultSet *rs = [SQLiteConnection query:sql];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

- (AIIArticleCollection *)query
{
    AIIArticleCollection *collection = [[AIIArticleCollection alloc] init];
    
    FMResultSet *rs = [self queryResultSet];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

- (AIIArticle *)query:(NSUInteger)identifier
{
    AIIArticle *item = [[AIIArticle alloc] init];
    
    FMResultSet *rs = [self queryResultSet:identifier];
    while ([rs next]) {
        item = [self FMResultSetToObject:rs];
    }
    return item;
}

- (AIIArticle *)query:(NSUInteger)identifier timestampUpdate:(NSString *)timestamp
{
    AIIArticle *item = [[AIIArticle alloc] init];
    
    FMResultSet *rs = [self queryResultSet:identifier timestampUpdate:timestamp];
    while ([rs next]) {
        item = [self FMResultSetToObject:rs];
    }
    return item;
}

- (int)replaceIntoItem:(AIIArticle *)item
{
    NSMutableDictionary *properties = [[NSMutableDictionary alloc] init];
//    [item.imageCollection valueToDictionary:properties];
    
    NSArray *array = [item.imageCollection arrayWithObject];
    properties[item.imageCollection.key] = array;
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:properties options:NSJSONWritingPrettyPrinted error:nil];
    NSString *images = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    //    NSString *sql = [NSString stringWithFormat:@"REPLACE INTO %@ (id, title, user_id, user_name, images, content, timestamp_update, timestamp) VALUES (%d, '%@', %d, '%@', '%@', '%@', '%@', '%@')", [self tableName], item.identifier, item.title, item.userId, item.userName, images, item.content, item.timestampUpdate, item.timestamp];
    //    NSLog(@"sql = %@", sql);
    NSString *sql = [NSString stringWithFormat:@"REPLACE INTO %@ (id, title, user_id, user_name, images, content, timestamp_update, timestamp) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [self tableName]];
    NSArray *arguments = @[[NSNumber numberWithUnsignedInteger:item.identifier], item.title, [NSNumber numberWithUnsignedInteger:item.userId], item.username, images, item.content, item.timestampUpdate, item.timestamp];
    
    return [SQLiteConnection update:sql withArgumentsInArray:arguments];
}

- (int)replaceIntoCollection:(AIIArticleCollection *)collection
{
    int numberOfChanges = 0;
    int count = [collection count];
    NSString *sql;
    AIIArticle *item;
    NSMutableDictionary *properties;
    for (NSUInteger i = 0; i < count; i++) {
        item = [collection objectAtIndex:i];
        
        properties = [[NSMutableDictionary alloc] init];
//        [item.imageCollection valueToDictionary:properties];
        
        NSArray *array = [item.imageCollection arrayWithObject];
        properties[item.imageCollection.key] = array;
        
        NSData *data = [NSJSONSerialization dataWithJSONObject:properties options:NSJSONWritingPrettyPrinted error:nil];
        NSString *images = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        //        sql = [NSString stringWithFormat:@"REPLACE INTO %@ (id, title, user_id, user_name, images, content, timestamp_update, timestamp) VALUES (%d, '%@', %d, '%@', '%@', '%@', '%@', '%@')", [self tableName], item.identifier, item.title, item.userId, item.userName, images, item.content,item.timestampUpdate, item.timestamp];
        //        NSLog(@"sql = %@", sql);
        sql = [NSString stringWithFormat:@"REPLACE INTO %@ (id, title, user_id, user_name, images, content, timestamp_update, timestamp) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [self tableName]];
        NSArray *arguments = @[[NSNumber numberWithUnsignedInteger:item.identifier], item.title, [NSNumber numberWithUnsignedInteger:item.userId], item.username, images, item.content, item.timestampUpdate, item.timestamp];
        
        numberOfChanges += [SQLiteConnection update:sql withArgumentsInArray:arguments];
    }
    return numberOfChanges;
}

@end
