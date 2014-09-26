//
//  AIIFile.h
//  AAClient
//
//  Created by iMac on 13-6-28.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"

@interface AIIFile : AIIEntity

@property (nonatomic, strong) NSData *data;
@property (nonatomic, copy) NSString *filename;
@property (nonatomic, copy) NSString *contentType;

@property (nonatomic, assign) NSUInteger userId;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, assign) NSUInteger favorites;//!< 收藏次数
@property (nonatomic, assign) float size;
@property (nonatomic, copy) NSString *extension;
@property (nonatomic, copy) NSString *ip;

- (id)initWithData:(NSData *)data filename:(NSString *)filename contentType:(NSString *)contentType;

@end