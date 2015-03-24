//
//  AIIArticle.h
//  AII
//
//  Created by iMac on 14-2-15.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"
#import "AIIImageCollection.h"
#import "AIICategory.h"

/** 文章类型 */
typedef NS_ENUM(NSUInteger, AIIArticleType) {
    AIIArticleTypeFirst  = 1,          //!< 1平台公告
    AIIArticleTypeAnnouncement,        //!< 2公告/消息中心
    AIIArticleTypeNews,                //!< 3省省新闻
    AIIArticleTypeHelp,                //!< 4帮助中心
};

@interface AIIArticle : AIIEntity

@property (nonatomic, assign) NSUInteger userId;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *url;
/** 题图 */
@property (nonatomic, copy) NSString *imagePath;
/** 文章类型 */
@property (nonatomic, assign) AIIArticleType type;
/** 点击次数 */
@property (nonatomic, assign) NSUInteger hits;

@property (nonatomic, strong) AIICategory *category;
@property (nonatomic, strong) AIIImageCollection *imageCollection;

@end
