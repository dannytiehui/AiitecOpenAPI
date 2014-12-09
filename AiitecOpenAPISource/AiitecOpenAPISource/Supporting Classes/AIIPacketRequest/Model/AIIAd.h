//
//  AIIAd.h
//  AAClient
//
//  Created by iMac on 13-10-29.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"
#import "AIIImage.h"

@interface AIIAd : AIIEntity

@property (nonatomic, assign) NSUInteger width;
@property (nonatomic, assign) NSUInteger height;
/** 广告链接. */
@property (nonatomic, copy) NSString *link;
/** 开始时间 "0000-00-00 00:00:00"表示立即生效. */
@property (nonatomic, copy) NSString *startTime;
/** 结束时间 "0000-00-00 00:00:00"表示长期有效. */
@property (nonatomic, copy) NSString *endTime;
/** 广告位id. */
@property (nonatomic, assign) NSUInteger positionId;
/** 广告图片路径. */
@property (nonatomic, copy) NSString *imagePath;

#pragma mark - Option
@property (nonatomic, strong) AIIImage *image;

@end
