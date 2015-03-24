//
//  AIIAttr.h
//  AII
//
//  Created by iMac on 14-1-24.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"

typedef NS_ENUM(NSUInteger, AIIInputType){
    InputTypeUnique = 1,  // 1唯一属性
    InputTypeRadio,       // 2单选属性
    InputTypeCheck,       // 3复选属性
};

@interface AIIAttr : AIIEntity

//@property (nonatomic, assign) NSUInteger goodsAttrId; // 商品属性id，唯一
//@property (nonatomic, copy) NSString *value;          // 商品属性值
//@property (nonatomic, assign) double price;           // 商品属性价格
@property (nonatomic, assign) AIIInputType inputType;

@end
