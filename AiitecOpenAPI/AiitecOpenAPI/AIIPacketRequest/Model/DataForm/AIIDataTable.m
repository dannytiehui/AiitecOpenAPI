//
//  AIIDataTable.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "AIIDataTable.h"

@implementation AIIDataTable

- (void)setValue:(id)value forKey:(NSString *)key
{
    NSLog(@"AIIDataTable: %@ = %@", key, value);
    
    if ([key isEqualToString:@"tableSchema"]) {
        self.tableSchema = [[AIITableSchema alloc] init];
        [self.tableSchema setObjectWithArray:value];
    }
    else if ([key isEqualToString:@"dataRowCollection"]) {
        self.dataRowCollection = [[AIIDataRowCollection alloc] init];
        [self.dataRowCollection setObjectWithArray:value];
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    if (self.tableSchema) {
        NSArray *array =  [self.tableSchema arrayWithObject];
        [mutableDictionary setObject:array forKey:@"tableSchema"];
    }
    
    if (self.dataRowCollection) {
        NSArray *array = [self.dataRowCollection arrayWithObject];
        [mutableDictionary setObject:array forKey:@"dataRowCollection"];
    }
    dict = mutableDictionary;
    
    return dict;
}

@end
