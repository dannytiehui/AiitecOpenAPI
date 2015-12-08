//
//  AIIUser.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-15.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "AIIAddress.h"
#import "AIIImageCollection.h"
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
    AIIUserPartnerDefault,          //!< 自己
    AIIUserPartnerTencent,          //!< 腾讯QQ
    AIIUserPartnerQzone,            //!< QQ空间
    AIIUserPartnerWechat,           //!< 微信
    AIIUserPartnerSina,             //!< 新浪
    AIIUserPartnerRenren,           //!< 人人网
    AIIUserPartnerAlipay            //!< 支付宝
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
/** 昵称. */
@property (nonatomic, copy) NSString *nickname;
/** 身份证姓名. */
@property (nonatomic, copy) NSString *idName;
/** 身份证号码. */
@property (nonatomic, copy) NSString *idNumber;
/** 身份证图片id. */
@property (nonatomic, assign) NSUInteger idImageId;
/** 身份证图片. */
@property (nonatomic, copy) NSString *idImagePath;
/** 生日. */
@property (nonatomic, copy) NSString *birthday;
/** 星座. */
@property (nonatomic, assign) NSUInteger starSign;
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
/** 推荐人ID. */
@property (nonatomic, assign) NSUInteger referrerId;
/** 推荐人. */
@property (nonatomic, copy) NSString *referrer;
/** 上一次登录时间. */
@property (nonatomic, copy) NSString *lastTime;

/** 是否为管理员. */
@property (nonatomic, assign) BOOL admin;
/** 年龄. */
@property (nonatomic, assign) float age;
/** 性别. */
@property (nonatomic, assign) AIISex sex;
/** 第三方登录唯一标识. */
@property (nonatomic, copy) NSString *openId;
/** 来源. */
@property (nonatomic, assign) AIIUserPartner partner;
/** 设备类型. */
@property (nonatomic, assign) AIIChannel channel;
/** 用户状态. */
@property (nonatomic, assign) AIIUserStatus status;

@property (nonatomic, strong) AIIAddress *address;
@property (nonatomic, strong) AIIImageCollection *imageCollection;
/** 信息项. */
@property (nonatomic, strong) AIIItemCollection *itemCollection;
/** 个人标签. */
@property (nonatomic, strong) AIIItemCollection *labels;

/** 测试NSObject(NSKeyValueCoding)的mutableArrayValueForKey:方法. */
@property (nonatomic, copy) NSDictionary *json;
//@property (nonatomic, strong) NSArray *array;

/// option
/** 背景图片id. */
@property (nonatomic, assign) NSUInteger backgroundImage;
/** 学生证图片id. */
@property (nonatomic, assign) NSUInteger studentIdImage;
/** 学生证图片. */
@property (nonatomic, copy) NSString *studentIdImagePath;
/** 认证状态. */
@property (nonatomic, assign) AIIUserAuthStatus authStatus;
/** 财务信息审核状态. */
@property (nonatomic, assign) AIIUserAuthStatus auditStatus;
/** 快应人认证状态. */
//@property (nonatomic, assign) AIIUserAuthStatus authKuaiyingStatus;

#pragma mark - stat

/** 金额. */
@property (nonatomic, assign) float statMoney;
/** 冻结金额. */
@property (nonatomic, assign) float statMoneyFreeze;
/** 总积分. */
@property (nonatomic, assign) NSUInteger statPoint;
/** 总任务数. */
@property (nonatomic, assign) NSUInteger statTask;
/** 总接订单数. */
//@property (nonatomic, assign) NSUInteger statOrder;
/** 总参与任务/活动数. */
@property (nonatomic, assign) NSUInteger statJoin;
/** 累计推荐人数. */
@property (nonatomic, assign) NSUInteger statReferrer;
/** 人气度. */
@property (nonatomic, assign) NSUInteger statPopularity;
/** 活跃度. */
@property (nonatomic, assign) NSUInteger statActivity;

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
/** 区域id. */
@property (nonatomic, assign) NSUInteger regionId;
/** 学校id. */
@property (nonatomic, assign) NSUInteger schoolId;
/** 年级. */
@property (nonatomic, copy) NSString *entrance;
/** 学历。如：本科／硕士研究生. */
@property (nonatomic, copy) NSString *education;
/** 学院id. */
@property (nonatomic, assign) NSUInteger departmentsId;
/** 专业id. */
@property (nonatomic, assign) NSUInteger professionalId;
/** 目标行业id. */
@property (nonatomic, assign) NSUInteger industryId;
/** 班级. */
@property (nonatomic, copy) NSString *classes;
/** 校园社团. */
@property (nonatomic, copy) NSString *association;


#pragma mark - 猫王联盟

/** 金猫余额. */
@property (nonatomic, assign) float goldenCat;
/** 银猫余额. */
@property (nonatomic, assign) float silverCat;
/** 摇钱树使用次数. */
@property (nonatomic, assign) NSUInteger moneymakerNumber;
/** 累计消费金猫. */
@property (nonatomic, assign) float statisticsConsumer;
/** 是否已经签到:0未签到;1已签到. */
@property (nonatomic, assign) BOOL sign;

#pragma mark - 快卡
/** 工作id. */
@property (nonatomic, assign) NSUInteger jobId;
/** 信用卡使用情况. */
@property (nonatomic, assign) NSUInteger overdueId;
/** 工作证件. */
@property (nonatomic, assign) NSUInteger certificateId;
/** 车辆价格，空表示没车. */
@property (nonatomic, copy) NSString *carPrice;
/** 房子价格，空表示没房子. */
@property (nonatomic, copy) NSString *housePrice;
/** 房子面积，空表示没房子. */
@property (nonatomic, copy) NSString *houseArea;
/** 水晶数量. */
@property (nonatomic, assign) NSUInteger crystal;
/** 1已获取分享奖励;2未获取分享奖励;. */
@property (nonatomic, assign) BOOL isShare;

@end
