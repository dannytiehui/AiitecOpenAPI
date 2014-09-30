//
//  AIIAddress.m
//  AAClient
//
//  Created by iMac on 13-8-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIAddress.h"

@implementation AIIAddress

- (id)init
{
    if (self = [super init]) {
        self.desc = @"";
        self.provinceRegion = [[AIIRegion alloc] init];
        self.cityRegion = [[AIIRegion alloc] init];
        self.areaRegion = [[AIIRegion alloc] init];
        
        self.properties = @[@"identifier", @"name", @"regionId", @"latitude", @"longitude", @"selected", @"street", @"desc", @"postcode", @"contacts", @"mobile"];
    }
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if([key isEqualToString:@"selected"]) {
        self.selected = [value isEqualToString:@"1"] ? true : false;
    }
    else if([key isEqualToString:@"regionInfo"]) {
        self.regionInfo = value;
        
        if ([(NSArray *)self.regionInfo count]) {
            self.regionCollection = [[AIIRegionCollection alloc] init];
            [self.regionCollection setValuesForKeysWithDictionary:value];
            
            NSUInteger provinceRegionParentId = 1;///> 1为省份的父id
            for (AIIRegion *entity in self.regionCollection) {
                if (entity.parentId == provinceRegionParentId) {
                    self.provinceRegion = entity;
                    break;
                }
            }
            for (AIIRegion *entity in self.regionCollection) {
                if (entity.parentId == self.provinceRegion.identifier) {
                    self.cityRegion = entity;
                    break;
                }
            }
            for (AIIRegion *entity in self.regionCollection) {
                if (entity.parentId == self.cityRegion.identifier) {
                    self.areaRegion = entity;
                    break;
                }
            }
        }
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (NSString *)desc
{
    NSString *ret = [[NSString alloc] init];
    if (self.provinceRegion.name) {
        ret = [ret stringByAppendingString:self.provinceRegion.name];
    }
    if (self.cityRegion.name) {
        ret = [ret stringByAppendingString:self.cityRegion.name];
    }
    if (self.areaRegion.name) {
        ret = [ret stringByAppendingString:self.areaRegion.name];
    }
    if (self.street) {
        ret = [ret stringByAppendingString:self.street];
    }
    return ret;
}

@end
