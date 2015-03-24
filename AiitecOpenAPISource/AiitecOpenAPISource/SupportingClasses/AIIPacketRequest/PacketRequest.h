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
#import "AIIUserRegisterSubmitPacket.h"
#import "AIIUserBindMobilePacket.h"
#import "AIIUserUploadImagePacket.h"
#import "AIIUserUpdatePasswordPacket.h"
#import "AIIUserResetPasswordPacket.h"
#import "AIIUserDetailsPacket.h"
#import "AIIUserUpdatePacket.h"
#import "AIIUserPartnerLoginPacket.h"
#import "AIIUserBadgeNumberPacket.h"
#import "AIIUserOperateListPacket.h"
#import "AIIAddressListPacket.h"
#import "AIIAddressSubmitPacket.h"
#import "AIIRankListPacket.h"
#import "AIIRankDetailsPacket.h"
#import "AIIRecordListPacket.h"

#import "AIIUserDataTablePacket.h"


#pragma mark - 联系人／通讯录
//#import "AIIContactsListPacket.h"
//#import "AIIContactsSubmitPacket.h"


#pragma mark - 省市区
#import "AIIRegionListPacket.h"


#pragma mark - 收藏
#import "AIIFavoriteListPacket.h"
#import "AIIFavoriteSwitchPacket.h"

#pragma mark - 文章
#import "AIIArticleListPacket.h"
#import "AIIArticleDetailsPacket.h"

#pragma mark - 快应2.0
#import "AIIPayPacket.h"
#import "AIIPointExchangePacket.h"
#import "AIIEventListPacket.h"
#import "AIIEventJoinPacket.h"
#import "AIITaskListPacket.h"
#import "AIITaskDetailsPacket.h"
#import "AIITaskSubmitPacket.h"
#import "AIITaskStatusUpdatePacket.h"
#import "AIITaskJoinListPacket.h"
#import "AIITaskJoinSwitchPacket.h"
#import "AIITaskEvaluateListPacket.h"
#import "AIITaskEvaluateCollectionSubmitPacket.h"
#import "AIITaskCommentListPacket.h"
#import "AIITaskCommentSubmitPacket.h"
#import "AIITaskOperateListPacket.h"
#import "AIITaskOperateSwitchPacket.h"
#import "AIITaskReportListPacket.h"
#import "AIITaskReportSubmitPacket.h"
#import "AIITaskReportReplySubmitPacket.h"
#import "AIITaskLabelListPacket.h"
#import "AIIPointSubmitPacket.h"
#import "AIIWeiboListPacket.h"
#import "AIIWeiboDetailsPacket.h"
#import "AIIWeiboSubmitPacket.h"
#import "AIIWeiboOperateListPacket.h"
#import "AIIWeiboOperateSwitchPacket.h"
#import "AIIWeiboCommentListPacket.h"
#import "AIIPositionUpdatePacket.h"
#import "AIIFetchPositionPacket.h"
#import "AIIFetchExecutingOrdersPacket.h"
#import "AIIRemindBadgeNumberPacket.h"
#import "AIIRemindListPacket.h"
#import "AIIRemindRemovePacket.h"


@interface PacketRequest : NSObject

+ (void)packetConnectionFinishedWarningHandle:(AIIPacketConnection *)connection;

@end
