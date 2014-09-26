//
//  AIIMessage.h
//  AAClient
//
//  Created by iMac on 13-7-22.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"

typedef NS_ENUM(NSUInteger, AIIMessageType){
    AIIMessageTypeSuggestions = 1,     // 建议
    AIIMessageTypeFeedback,            // 问题反馈
};

@interface AIIMessage : AIIEntity

@property (nonatomic, copy) NSString *realName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *wechat;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *mobile;   // 联系电话
@property (nonatomic, assign) AIIMessageType type;

#pragma mark - option
@property (nonatomic, assign) NSUInteger userId;//!< 用户id
@property (nonatomic, assign) NSUInteger adminId;//!< 说话人 id（0 表示管理员）


@end
