//
//  AddressbookTable.m
//  AAClient
//
//  Created by iMac on 13-7-24.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AddressbookTable.h"
#import "AIIAddressbook.h"
#import "AIIAddressbookCollection.h"

@interface AddressbookTable ()

- (AIIAddressbook *)FMResultSetToObject:(FMResultSet *)rs;

@end


@implementation AddressbookTable

- (AIIAddressbook *)FMResultSetToObject:(FMResultSet *)rs
{
    AIIAddressbook *item = [[AIIAddressbook alloc] init];
    
    [self FMResultSetToObject:rs entity:item];
    
    item.addressbookGroupId = [[rs stringForColumn:@"addressbook_group_id"] integerValue];
    item.sex = (AIISex)[rs stringForColumn:@"sex"];
    item.birthday = [rs stringForColumn:@"birthday"];
    item.imagePath = [rs stringForColumn:@"image"];
    item.company = [rs stringForColumn:@"company"];
    item.department = [rs stringForColumn:@"department"];
    item.position = [rs stringForColumn:@"position"];
    item.telephone = [rs stringForColumn:@"telephone"];
    item.mobile = [rs stringForColumn:@"mobile"];
    item.fax = [rs stringForColumn:@"fax"];
    item.email = [rs stringForColumn:@"email"];
    item.qq = [rs stringForColumn:@"qq"];
    item.weibo = [rs stringForColumn:@"weibo"];
    item.address.regionId = [[rs stringForColumn:@"region_id"] integerValue];
    item.address.regionInfo = [rs stringForColumn:@"region_info"];
//    item.address = [rs stringForColumn:@"address"];
    item.desc = [rs stringForColumn:@"description"];

    return item;
}

- (NSString *)tableName
{
    return @"addressbook";
}

- (AIIAddressbookCollection *)query:(int)page limit:(int)numberOfPage orderBy:(NSString *)orderBy type:(NSString *)type key:(NSString *)searchKey
{
    NSString *sql = [self querySQLString:page limit:numberOfPage orderBy:orderBy type:type key:searchKey];
    
    AIIAddressbookCollection *collection = [[AIIAddressbookCollection alloc] init];
    FMResultSet *rs = [SQLiteConnection query:sql];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

- (AIIAddressbookCollection *)query:(int)page limit:(int)numberOfPage orderBy:(NSString *)orderBy type:(NSString *)type key:(NSString *)searchKey groupId:(NSUInteger)groupId
{
    NSString *WHEREString = @"";
    if (searchKey.length) {
        NSString *where = [NSString stringWithFormat:@" WHERE `name` LIKE '%%%@%%' ", searchKey];
        WHEREString = [WHEREString stringByAppendingString:where];
    }
    if (groupId != 0 && WHEREString.length) {
        NSString *where = [NSString stringWithFormat:@" AND addressbook_group_id = %lu ", (unsigned long)groupId];
        WHEREString = [WHEREString stringByAppendingString:where];
    }
    else if (groupId != 0) {
        NSString *where = [NSString stringWithFormat:@" WHERE addressbook_group_id = %lu ", (unsigned long)groupId];
        WHEREString = [WHEREString stringByAppendingString:where];
    }
    NSString *sql = [self querySQLString:page limit:numberOfPage orderBy:orderBy type:type where:WHEREString];

    AIIAddressbookCollection *collection = [[AIIAddressbookCollection alloc] init];
    FMResultSet *rs = [SQLiteConnection query:sql];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

- (AIIAddressbookCollection *)query
{
    AIIAddressbookCollection *collection = [[AIIAddressbookCollection alloc] init];
    
    FMResultSet *rs = [self queryResultSet];
    while ([rs next]) {
        [collection addObject:[self FMResultSetToObject:rs]];
    }
    return collection;
}

- (AIIAddressbook *)query:(NSUInteger)identifier
{
    AIIAddressbook *item = [[AIIAddressbook alloc] init];
    
    FMResultSet *rs = [self queryResultSet:identifier];
    while ([rs next]) {
        item = [self FMResultSetToObject:rs];
    }
    return item;
}

- (AIIAddressbook *)query:(NSUInteger)identifier timestampUpdate:(NSString *)timestamp
{
    AIIAddressbook *item = [[AIIAddressbook alloc] init];
    
    FMResultSet *rs = [self queryResultSet:identifier timestampUpdate:timestamp];
    while ([rs next]) {
        item = [self FMResultSetToObject:rs];
    }
    return item;
}

- (int)replaceIntoItem:(AIIAddressbook *)item
{
    NSString *sql = [NSString stringWithFormat:@"REPLACE INTO %@ (id, addressbook_group_id, name, sex, birthday, image, company, department, position, telephone, mobile, fax, email, qq, weibo, region_id, region_info, description, is_delete, timestamp_update, timestamp) VALUES (%lu, %lu, '%@', %lu, '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', %lu, '%@', '%@', %d, '%@', '%@')", [self tableName], (unsigned long)item.identifier, (unsigned long)item.addressbookGroupId, item.name, (unsigned long)item.sex, item.birthday, item.imagePath, item.company, item.department, item.position, item.telephone, item.mobile, item.fax, item.email, item.qq, item.weibo, (unsigned long)item.address.regionId, item.address.regionInfo, item.desc, 0, item.timestampUpdate, item.timestamp];
    return [SQLiteConnection update:sql];
}

- (int)replaceIntoCollection:(AIIAddressbookCollection *)collection
{
    int numberOfChanges = 0;
    NSUInteger count = [collection count];
    NSString *sql;
    AIIAddressbook *item;
    for (NSUInteger i = 0; i < count; i++) {
        item = [collection objectAtIndex:i];

        sql = [NSString stringWithFormat:@"REPLACE INTO %@ (id, addressbook_group_id, name, sex, birthday, image, company, department, position, telephone, mobile, fax, email, qq, weibo, region_id, region_info, description, is_delete, timestamp_update, timestamp) VALUES (%lu, %lu, '%@', %lu, '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', %lu, '%@', '%@', %d, '%@', '%@')", [self tableName], (unsigned long)item.identifier, (unsigned long)item.addressbookGroupId, item.name, (unsigned long)item.sex, item.birthday, item.imagePath, item.company, item.department, item.position, item.telephone, item.mobile, item.fax, item.email, item.qq, item.weibo, (unsigned long)item.address.regionId, item.address.regionInfo, item.desc, 0, item.timestampUpdate, item.timestamp];
        numberOfChanges += [SQLiteConnection update:sql];
    }
    return numberOfChanges;
}

@end