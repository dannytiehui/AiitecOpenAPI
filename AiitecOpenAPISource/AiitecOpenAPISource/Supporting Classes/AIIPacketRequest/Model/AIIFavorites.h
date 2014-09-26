//
//  AIIFavorites.h
//  AAClient
//
//  Created by iMac on 13-8-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"

typedef NS_ENUM(NSUInteger, FavoritesType){
    FavoritesTypeDefault,           // 默认
    FavoritesTypeSchedulingDetails, // 线路(班次明细)
    FavoritesTypeLandscape,         // 景点
    FavoritesTypeHotel              // 住宿
};

@interface AIIFavorites : AIIEntity

@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, assign) BOOL status;
@property (nonatomic, assign) NSUInteger userId;
@property (nonatomic, assign) NSUInteger foreignId;
@property (nonatomic, assign) FavoritesType type;
@property (nonatomic, copy) NSString *desc;

@end
