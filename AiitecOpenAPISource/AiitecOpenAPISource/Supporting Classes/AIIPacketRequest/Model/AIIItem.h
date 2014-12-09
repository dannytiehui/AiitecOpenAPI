//
//  AIIItem.h
//  AII
//
//  Created by iMac on 13-11-15.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"

@interface AIIItem : AIIEntity

@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *value;

#pragma mark - Option
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, copy) NSString *pinyin;
@property (nonatomic, copy) NSString *py;

@end
