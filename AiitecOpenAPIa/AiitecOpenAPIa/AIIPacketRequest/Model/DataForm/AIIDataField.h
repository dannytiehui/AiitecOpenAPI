//
//  AIIDataField.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "AIIEntity.h"

typedef NS_ENUM(NSUInteger, AIIDataFieldType) {
	AIIDataFieldTypeText = 0,   //!< 字符文本
	AIIDataFieldTypeHtml,       //!<html文本
	AIIDataFieldTypeLink,       //!<http地址
	AIIDataFieldTypeTel,        //!<固定电话
	AIIDataFieldTypeMobile,     //!<移动电话
	AIIDataFieldTypeEmail,      //!<邮箱
	AIIDataFieldTypePic,        //!<图片
	AIIDataFieldTypeAddressBook //!<通讯录类型
};

/// AIIDataField.
@interface AIIDataField : AIIEntity

@property (nonatomic,assign) AIIDataFieldType type;
@property (nonatomic,strong) NSString *displayName;
@property (nonatomic,assign) BOOL primaryKey;

@end
