//
//  AIIIqPacket.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "AIIPacketConfig.h"
#import "AIIQuery.h"

/** 通讯协议基类.
 *
 * 全部请求（以Request后缀）、响应协议（以Response后缀）都继承此基类.
 *  内置规则(仅对继承IqPacket的子类):
 *    1.关于属性query的值:
 *      当前类名称加上Query后缀的对象。如:AIIDetailsRequest类,则其query属性值默认为AIIDetailsRequestQuery的实例化对象.
 *    2.关于属性queryClass的值:
 *      当前类名称加上Query后缀后的类。如:AIIDetailsRequest类,则其queryClass属性值默认为[AIIDetailsRequestQuery class].
 *    3.关于属性nameSpace的值:
 *      去掉AII前缀,去掉Request/Response后缀的字符串。如:AIIUserDetailsRequest/AIIUserDetailsResponse类,则其nameSpace属性值默认为UserDetails.
 */
@interface AIIIqPacket : AIIJSONModel

@property (nonatomic, strong) AIIQuery *query;
/// AIIQuery 对象的子类
@property (nonatomic, strong) Class queryClass;

/**
 *  @brief  获取协议包的命名空间.请求类型的唯一标识，为满足不同的接口实现转发功能而设计.
 *
 *  @return 协议包de命名空间.
 */
- (NSString *)nameSpace;

/**
 * @brief 将JSON格式的字符串转换为self(Request/Response)对象
 *
 * @param jsonString JSON格式的字符串.
 *
 * @return 返回self.
 */
- (id)initWithJSONString:(NSString *)jsonString;

/**
 *  @brief  获取数据包中指定路径的值对象.(弃用deprecated)
 *
 *  @param  properties 数据包.
 *  @param  path       查找路径.
 *
 *  @return 数据包中指定路径(path)的值对象.
 */
+ (id)findProperty:(NSDictionary *)properties path:(NSString *)path;

@end
