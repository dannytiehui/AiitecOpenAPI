//
//  AIIAddressbook.h
//  AAClient
//
//  Created by iMac on 13-7-22.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIEntity.h"
#import "AIIAddress.h"

@interface AIIAddressbook : AIIEntity

@property (nonatomic, assign) NSUInteger addressbookGroupId;
@property (nonatomic, assign) AIISex sex;
@property (nonatomic, copy) NSString *birthday;
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *department;
@property (nonatomic, copy) NSString *position;
@property (nonatomic, copy) NSString *telephone;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *fax;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *qq;
@property (nonatomic, copy) NSString *weibo;
/** 默认收货人 */
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, strong) AIIAddress *address;

@end
