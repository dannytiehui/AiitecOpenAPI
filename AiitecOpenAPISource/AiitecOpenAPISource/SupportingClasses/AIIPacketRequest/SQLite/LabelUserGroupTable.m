//
//  LabelUserGroupTable.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/12/12.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "LabelUserGroupTable.h"

@implementation LabelUserGroupTable

- (NSString *)tableName
{
    return @"ky_label_user_group";
}

- (AIIItemCollection *)queryWithTable:(AIITable *)table
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ ", [self tableName]];
    
    AIIItemCollection *collection = [[AIIItemCollection alloc] init];
    FMResultSet *rs = [SQLiteConnection query:sql];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

@end
