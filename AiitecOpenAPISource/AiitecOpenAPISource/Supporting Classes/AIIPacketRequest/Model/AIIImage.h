//
//  AIIImage.h
//  AAClient
//
//  Created by iMac on 13-5-21.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"

@interface AIIImage : AIIEntity

@property (nonatomic, copy) NSString *filename;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, assign) NSUInteger favorites;// 收藏次数
@property (nonatomic, assign) NSUInteger size;// 单位字节(B)
@property (nonatomic, copy) NSString *mime;
@property (nonatomic, copy) NSString *extension;
//@property (nonatomic, copy) NSString *desc;

@end
