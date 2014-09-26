//
//  AIIDataField.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "AIIEntity.h"

typedef enum {
	DataFieldTypeText = 0,  //字符文本
	DataFieldTypeHtml,      //html文本
	DataFieldTypeLink,      //http地址
	DataFieldTypeTel,       //固定电话
	DataFieldTypeMobile,    //移动电话
	DataFieldTypeEmail,     //邮箱
	DataFieldTypePic,       //图片
	DataFieldTypeAddressBook //通讯录类型
}DataFieldType;

@interface AIIDataField : AIIEntity

//@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) DataFieldType type;
@property (nonatomic,strong) NSString *displayName;
//@property (nonatomic,strong) NSString *description;
@property (nonatomic,assign) BOOL primaryKey;

@end
