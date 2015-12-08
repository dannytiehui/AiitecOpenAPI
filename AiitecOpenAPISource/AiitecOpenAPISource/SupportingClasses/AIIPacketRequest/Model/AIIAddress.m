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
        
        _regionCollection = [[AIIRegionCollection alloc] init];
        _regionCollection.key = @"regionInfo";

        self.properties = @[@"identifier", @"name", @"regionId", @"latitude", @"longitude", @"selected", @"street", @"desc", @"postcode", @"contacts", @"mobile"];
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    AIIAddress *address = [super copyWithZone:zone];
    address.regionId = _regionId;
    address.latitude = _latitude;
    address.longitude = _longitude;
    address.coordinate = _coordinate;
    address.selected = _selected;
    address.regionInfo = [_regionInfo copy];
    address.street = [_street copy];
    address.postcode = [_postcode copy];
    address.contacts = [_contacts copy];
    address.mobile = [_mobile copy];
    return address;
}

#pragma mark - NSMutableCopying

- (id)mutableCopyWithZone:(NSZone *)zone
{
    AIIAddress *address = [super mutableCopyWithZone:zone];
    address.regionId = _regionId;
    address.latitude = _latitude;
    address.longitude = _longitude;
    address.coordinate = _coordinate;
    address.selected = _selected;
    address.regionInfo = [_regionInfo mutableCopy];
    address.street = [_street mutableCopy];
    address.postcode = [_postcode mutableCopy];
    address.contacts = [_contacts mutableCopy];
    address.mobile = [_mobile mutableCopy];
    return address;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeInteger:self.regionId forKey:@"AddressRegionId"];
    [aCoder encodeInteger:self.latitude forKey:@"AddressLatitude"];
    [aCoder encodeInteger:self.longitude forKey:@"AddressLongitude"];
//    [aCoder encodeInteger:self.coordinate forKey:@"AddressCoordinate"];
    [aCoder encodeInteger:self.selected forKey:@"AddressSelected"];
    [aCoder encodeObject:self.regionInfo forKey:@"AddressRegionInfo"];
    [aCoder encodeObject:self.street forKey:@"AddressStreet"];
    [aCoder encodeObject:self.postcode forKey:@"AddressPostcode"];
    [aCoder encodeObject:self.contacts forKey:@"AddressContacts"];
    [aCoder encodeObject:self.mobile forKey:@"AddressMobile"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    self.regionId = [aDecoder decodeIntegerForKey:@"AddressRegionId"];
    self.latitude = [aDecoder decodeIntegerForKey:@"AddressLatitude"];
    self.longitude = [aDecoder decodeIntegerForKey:@"AddressLongitude"];
//    self.coordinate = [aDecoder decodeIntegerForKey:@"AddressCoordinate"];
    self.selected = [aDecoder decodeIntegerForKey:@"AddressSelected"];
    self.regionInfo = [aDecoder decodeObjectForKey:@"AddressRegionInfo"];
    self.street = [aDecoder decodeObjectForKey:@"AddressStreet"];
    self.postcode = [aDecoder decodeObjectForKey:@"AddressPostcode"];
    self.contacts = [aDecoder decodeObjectForKey:@"AddressContacts"];
    self.mobile = [aDecoder decodeObjectForKey:@"AddressMobile"];
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if([key isEqualToString:@"selected"]) {
        self.selected = [value isEqualToString:@"1"] ? true : false;
    }
//    else if([key isEqualToString:@"regionInfo"]) {
    else if([key isEqualToString:self.regionCollection.key]) {
        self.regionInfo = value;
        
        if ([(NSArray *)self.regionInfo count]) {
//            self.regionCollection = [[AIIRegionCollection alloc] init];
            [self.regionCollection setObjectWithArray:value];
            
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
