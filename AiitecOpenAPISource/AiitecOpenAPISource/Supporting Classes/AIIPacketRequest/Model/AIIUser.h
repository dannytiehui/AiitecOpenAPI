//
//  AIIUser.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-15.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "AIIAddress.h"
#import "AIIItemCollection.h"

/** 设备类型. */
typedef NS_ENUM(NSUInteger, AIIChannel) {
    AIIChannelDefault,
    AIIChannelPhone,
    AIIChannelPad,
    AIIChannelAndroid,
    AIIChannelAndroidPad,
    AIIChannelWindowsPhone,
    AIIChannelSurface,
    AIIChannelPC
};

/** 用户状态. */
typedef NS_ENUM(NSUInteger, AIIUserStatus) {
    AIIUserStatusDefault,
    AIIUserStatusNormal,       //!< 1正常
    AIIUserStatusCancellation, //!< 2停用/注销
    AIIUserStatusLock          //!< 3未激活（临时）
};

/** 用户来源. */
typedef NS_ENUM(NSUInteger, AIIUserPartner) {
    AIIUserPartnerDefault = 1,     //!< 自己
    AIIUserPartnerTencent,         //!< 腾讯
    AIIUserPartnerSina,            //!< 新浪
    AIIUserPartnerAlipay           //!< 支付宝
};

/** 认证状态. */
typedef NS_ENUM(NSUInteger, AIIUserAuthStatus) {
    AIIUserAuthStatusDefault,
    AIIUserAuthStatusFirst,         //!< 1认证中／审核中/待认证
    AIIUserAuthStatusSecond,        //!< 2已认证
    AIIUserAuthStatusThird          //!< 3未通过
};

@interface AIIUser : AIIEntity

/** 会员编号. */
@property (nonatomic, copy) NSString *memberNumber;
/** 密码. */
@property (nonatomic, copy) NSString *password;
/** 真实姓名. */
@property (nonatomic, copy) NSString *realName;
/** 身份证姓名. */
@property (nonatomic, copy) NSString *idName;
/** 身份证号码. */
@property (nonatomic, copy) NSString *idNumber;
/** 身份证图片id. */
@property (nonatomic, assign) NSUInteger idImage;
/** 身份证图片. */
@property (nonatomic, copy) NSString *idImagePath;
/** 生日. */
@property (nonatomic, copy) NSString *birthday;
/** 图像路径. */
@property (nonatomic, copy) NSString *imagePath;
/** 电话. */
@property (nonatomic, copy) NSString *telephone;
/** 移动电话. */
@property (nonatomic, copy) NSString *mobile;
/** 邮箱. */
@property (nonatomic, copy) NSString *email;
/** QQ. */
@property (nonatomic, copy) NSString *qq;
/** 微信. */
@property (nonatomic, copy) NSString *wechat;
/** 会员卡. */
@property (nonatomic, copy) NSString *cardNumber;
/** 用户级别。如普通会员. */
@property (nonatomic, copy) NSString *grade;
/** 推荐人. */
@property (nonatomic, copy) NSString *referrer;
/** 上一次登录时间. */
@property (nonatomic, copy) NSString *lastTime;
/** 描述. */
//@property (nonatomic, copy) NSString *desc;

/** 是否为管理员. */
@property (nonatomic, assign) BOOL admin;
/** 年龄. */
@property (nonatomic, assign) float age;
/** 性别. */
@property (nonatomic, assign) AIISex sex;
/** 来源. */
@property (nonatomic, assign) AIIUserPartner partner;
/** 设备类型. */
@property (nonatomic, assign) AIIChannel channel;
/** 用户状态. */
@property (nonatomic, assign) AIIUserStatus status;

/** 地址. */
@property (nonatomic, strong) AIIAddress *address;
/** 信息项. */
@property (nonatomic, strong) AIIItemCollection *itemCollection;

/** 测试NSObject(NSKeyValueCoding)的mutableArrayValueForKey:方法. */
@property (nonatomic, copy) NSDictionary *json;
@property (nonatomic, copy) NSArray *array;

/// option
/** 学生证图片id. */
@property (nonatomic, assign) NSUInteger studentIdImage;
/** 学生证图片. */
@property (nonatomic, copy) NSString *studentIdImagePath;
/** 认证状态. */
@property (nonatomic, assign) AIIUserAuthStatus authStatus;
/** 快应人认证状态. */
@property (nonatomic, assign) AIIUserAuthStatus authKuaiyingStatus;
/** 金额. */
@property (nonatomic, assign) float statMoney;
/** 冻结金额. */
@property (nonatomic, assign) float statMoneyFreeze;
/** 总积分. */
@property (nonatomic, assign) NSUInteger statPoint;
/** 总任务数. */
@property (nonatomic, assign) NSUInteger statTask;
/** 总接订单数. */
@property (nonatomic, assign) NSUInteger statOrder;
/** 累计推荐. */
@property (nonatomic, assign) NSUInteger statReferrer;
/** 用户等级. */
@property (nonatomic, copy) NSString *level;
/** 考试积分. */
@property (nonatomic, assign) NSUInteger score;
/** 免打扰开始时间. */
@property (nonatomic, copy) NSString *quietStartTime;
/** 免打扰结束时间. */
@property (nonatomic, copy) NSString *quietEndTime;
/** 经度. */
@property (nonatomic, assign) double longitude;
/** 纬度. */
@property (nonatomic, assign) double latitude;
/** 支付宝帐号. */
@property (nonatomic, copy) NSString *accountAlipay;
/** 银行帐号. */
@property (nonatomic, copy) NSString *accountBankcard;
/** 学校id. */
@property (nonatomic, assign) NSUInteger schoolId;
/** 区域id. */
@property (nonatomic, assign) NSUInteger regionId;

@end
