//
//  AIIAddress.h
//  AAClient
//
//  Created by iMac on 13-8-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"
#import "AIIRegionCollection.h"
#import <CoreLocation/CoreLocation.h>

@interface AIIAddress : AIIEntity

@property (nonatomic, assign) NSUInteger regionId;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;//!< 坐标结构体，纬度、经度.
@property (nonatomic, assign) BOOL selected;//!< 默认地址

@property (nonatomic, copy) NSString *regionInfo;
@property (nonatomic, copy) NSString *street;
//@property (nonatomic, copy) NSString *desc;//!< 省 市 区 街道 详细地址（空格隔开）

#pragma mark - Option
@property (nonatomic, copy) NSString *postcode;//!< 邮政编码
@property (nonatomic, copy) NSString *contacts;//!< 联系人
@property (nonatomic, copy) NSString *mobile;//!< 联系电话

@property (nonatomic, strong) AIIRegion *provinceRegion;//!<省
@property (nonatomic, strong) AIIRegion *cityRegion;//!<市
@property (nonatomic, strong) AIIRegion *areaRegion;//!<区
@property (nonatomic, strong) AIIRegionCollection *regionCollection;

@end
