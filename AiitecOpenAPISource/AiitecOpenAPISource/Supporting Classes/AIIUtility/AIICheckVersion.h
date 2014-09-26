//
//  AIICheckVersion.h
//  AAClient
//
//  Created by iMac on 13-6-19.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "AppConfig.h"

#import "ReachabilityUtility.h"

@class AIICheckVersion;
@protocol AIICheckVersionDelegate <NSObject>

- (void)checkVersionFinished:(AIICheckVersion *)checkVersion;

@end



@interface AIICheckVersion : NSObject <ASIHTTPRequestDelegate>

@property (nonatomic, weak) id<AIICheckVersionDelegate> delegate;
@property (nonatomic, readonly) BOOL newVersion;        // 是否有新版本
@property (nonatomic, readonly) NSString *version;      // 新版本号
@property (nonatomic, readonly) NSString *link;         // 新版本下载链接
@property (nonatomic, readonly) NSString *title;        // 提示标题
@property (nonatomic, readonly) NSString *message;      // 提示文本
@property (nonatomic, readonly) BOOL forcedUpdate;      // 是否强制用户更新

// 获取当前版本号
+ (NSString *)currentVersion;

// 检测自己服务器
+ (void)checkVersion:(id<AIICheckVersionDelegate>)delegate;

// 检测itunes app版本
+ (void)checkItunesVersion:(id<AIICheckVersionDelegate>)delegate;

@end
