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
#import "AIIUserBadgeNumberPacket.h"
#import "AIIAddressListPacket.h"
#import "AIIAddressSubmitPacket.h"
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

#pragma mark - 猫王联盟
//#import "AIIMerchantListPacket.h"
//#import "AIIMerchantDetailsPacket.h"
//#import "AIIGoodsListPacket.h"
//#import "AIIGoodsDetailsPacket.h"
//#import "AIIOrderListPacket.h"
//#import "AIIOrderDetailsPacket.h"
//#import "AIIOrderTrackingListPacket.h"
//#import "AIIOrderSubmitPacket.h"
#import "AIIOrderStatusUpdatePacket.h"
//#import "AIIOrderCommentListPacket.h"
#import "AIIOrderCommentSubmitPacket.h"
//#import "AIIReportSubmitPacket.h"

//#import "AIIQuestionDetailsPacket.h"
//#import "AIIExchangeSubmitPacket.h"
#import "AIIEventJoinPacket.h"
//#import "AIIBusinessesSubmitPacket.h"


@interface PacketRequest : NSObject

@end
