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
        
        self.properties = [[super defaultProperties] arrayByAddingObjectsFromArray:@[@"regionId", @"latitude", @"longitude", @"selected", @"street", @"desc", @"postcode", @"contacts", @"mobile"]];
    }
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    NSLog(@"AIIAddress: %@ = %@", key, value);
    
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



//- (void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//    NSLog(@"UndefinedKey:key = %@, value = %@", key, value);
//    if([key isEqualToString:@"description"]) {
//        self.desc = value;
//    }
//    else {
//        [super setValue:value forUndefinedKey:key];
//    }
//}



//- (void)valueFromDictionary:(NSDictionary *)properties
//{
//    if (properties) {
//        NSDictionary *dic = properties[self.jsonKey];
//        [super valueFromDictionary:dic];
//        
//        if(!dic.description.length) return;
//        
//        self.regionId = [dic[@"region_id"] integerValue];
//        self.regionInfo = (NSString *)dic[@"region_info"];
//        self.street = (NSString *)dic[@"street"];
//        self.postcode = (NSString *)dic[@"postcode"];
//        self.contacts = (NSString *)dic[@"contacts"];
//        self.mobile = (NSString *)dic[@"mobile"];
//        NSString *selected = (NSString *)dic[@"selected"];
//        self.selected = [selected isEqualToString:@"1"] ? YES : NO;
//        self.latitude = [dic[@"latitude"] doubleValue];
//        self.longitude = [dic[@"longitude"] doubleValue];
//        //self.desc = (NSString *)dic[@"description"];
//        
//        if ([(NSArray *)self.regionInfo count]) {
//            self.regionCollection = [[AIIRegionCollection alloc] init];
//            [self.regionCollection valueFromDictionary:dic];
//            
//            NSUInteger provinceRegionParentId = 1;///>1为省份的父id
//            for (AIIRegion *entity in self.regionCollection) {
//                if (entity.parentId == provinceRegionParentId) {
//                    //self.desc = [self.desc stringByAppendingString:entity.name];
//                    self.provinceRegion = entity;
//                    break;
//                }
//            }
//            for (AIIRegion *entity in self.regionCollection) {
//                if (entity.parentId == self.provinceRegion.identifier) {
//                    //self.desc = [self.desc stringByAppendingString:entity.name];
//                    self.cityRegion = entity;
//                    break;
//                }
//            }
//            for (AIIRegion *entity in self.regionCollection) {
//                if (entity.parentId == self.cityRegion.identifier) {
//                    //self.desc = [self.desc stringByAppendingString:entity.name];
//                    self.areaRegion = entity;
//                    break;
//                }
//            }
//            //self.desc = [self.desc stringByAppendingString:self.street];
//        }
//	}
//}

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
//    return [NSString stringWithFormat:@"%@ %@ %@ %@", self.provinceRegion.name, self.cityRegion.name, self.areaRegion.name, self.street];
}

@end
