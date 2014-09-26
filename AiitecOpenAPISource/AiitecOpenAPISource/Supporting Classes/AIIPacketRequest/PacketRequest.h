//
//  PacketRequest.h
//  AiitecOpenAPIDemo
//
//  Created by iMac on 14-7-29.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AiitecOpenAPI.h"


#pragma mark - 公共

#import "AIIDeviceTokenSwitchPacket.h"
#import "AIIMessageListPacket.h"
#import "AIIMessageSubmitPacket.h"
#import "AIISMSCodePacket.h"
#import "AIIAdListPacket.h"
#import "AIISettingPacket.h"
#import "AIIReferenceItemListPacket.h"
#import "AIICategoryListPacket.h"
#import "AIIUploadImagePacket.h"
#import "AIIDeleteActionPacket.h"
#import "AIIHTMLPacket.h"


#pragma mark - 用户
#import "AIIUserLoginPacket.h"
#import "AIIUserLogoutPacket.h"
#import "AIIUserRegisterPacket.h"
#import "AIIUserBindMobilePacket.h"
#import "AIIUserUploadImagePacket.h"
#import "AIIUserUpdatePasswordPacket.h"
#import "AIIUserResetPasswordPacket.h"
#import "AIIUserDetailsPacket.h"
#import "AIIUserUpdatePacket.h"
#import "AIIUserPartnerLoginPacket.h"
#import "AIIRankListPacket.h"
#import "AIIRecordListPacket.h"

#import "AIIUserDataTablePacket.h"


#pragma mark - 联系人／通讯录
//#import "AIIContactsListPacket.h"
//#import "AIIContactsSubmitPacket.h"


#pragma mark - 省市区
#import "AIIRegionListPacket.h"


#pragma mark - 收藏
#import "AIIFavoritesListPacket.h"
#import "AIIFavoritesSwitchPacket.h"

#pragma mark - 文章
#import "AIIArticleListPacket.h"
#import "AIIArticleDetailsPacket.h"

#pragma mark - 财务
#import "AIIPaySubmitPacket.h"
#import "AIIPointExchangeSubmitPacket.h"

#pragma mark - 活动
#import "AIIEventListPacket.h"
#import "AIIEventJoinPacket.h"

#pragma mark - 任务
#import "AIITaskListPacket.h"
#import "AIITaskDetailsPacket.h"
#import "AIITaskSubmitPacket.h"
#import "AIITaskStatusUpdatePacket.h"
#import "AIITaskReportSubmitPacket.h"
#import "AIIFetchRankPacket.h"

#pragma mark - 订单
#import "AIIOrderStatusUpdatePacket.h"
#import "AIIOrderCommentSubmitPacket.h"
#import "AIIOrderComplaintSubmitPacket.h"

#pragma mark - 积分
#import "AIIPointSubmitPacket.h"
#import "AIIPointDetailsPacket.h"

#pragma mark - 其它
#import "AIIWishSubmitPacket.h"
#import "AIIPositionUpdatePacket.h"
#import "AIIFetchPositionPacket.h"


@interface PacketRequest : NSObject

@end
