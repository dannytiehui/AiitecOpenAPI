//
//  AIIItem.h
//  AII
//
//  Created by iMac on 13-11-15.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"

@interface AIIItem : AIIEntity

/** 考虑到key为基类保留关键词（已用于设置对象的key,用于解析JSON对象）,建议key当作对象的属性时,用name代替. */
//@property (nonatomic, copy) NSString *key;
//@property (nonatomic, copy) NSString *value;
@property (nonatomic, assign) NSUInteger value;

#pragma mark - Option
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, copy) NSString *pinyin;
@property (nonatomic, copy) NSString *py;
@property (nonatomic, assign) NSUInteger parentId;

#pragma mark - 快卡
@property (nonatomic, assign) AIIEntityAction type;
@property (nonatomic, assign) NSUInteger number;
@property (nonatomic, assign) NSUInteger bankId;
@property (nonatomic, assign) BOOL isCar;
@property (nonatomic, assign) BOOL isHouse;
@property (nonatomic, assign) BOOL status;

@end
