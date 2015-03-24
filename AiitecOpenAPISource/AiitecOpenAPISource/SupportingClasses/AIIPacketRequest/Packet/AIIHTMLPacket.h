//
//  AIIHTMLPacket.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-7-18.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"

/**
 *  操作类型
 */
typedef NS_ENUM(NSUInteger, AIIHTMLAction){
    /**
     *  使用帮助（默认）
     */
    AIIHTMLActionHelp = 1,
    /**
     *  关于
     */
    AIIHTMLActionAbout
};

@interface AIIHTMLRequest : AIIRequest

@property (nonatomic, assign) AIIHTMLAction action;

@end

@interface AIIHTMLResponse : AIIResponse

@end
