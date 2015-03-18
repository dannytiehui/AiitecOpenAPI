//
//  AppConfig.h
//  AAClient
//
//  Created by iMac on 13-6-4.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 是否显示调试信息。使用AiitecOpenAPI库文件,必须包含. */
#define AiitecOpenAPI_DEBUG 0

#ifdef DEBUG

#define DOMAIN_PATH             @"http://192.168.1.12/"             //<! AiitecOpenAPI
#define API_PATH                @"quanshitong/public/api"           //<! AiitecOpenAPI
#define REACHABILITY_HOSTNAME   @"192.168.1.12" //!< 用于 Reachability 网络检测   //<! AiitecOpenAPI

#define FILE_PATH               @"http://192.168.1.12/php/quanshitong/public/uploadfiles/"
//#define TASKDETAIL_PATH         @"http://192.168.1.12/Quick2.0/public/"
#define SERVER_CHECKVERSION_PATH    @"http://192.168.1.12/quanshitong/public/version.php"

//#define DOMAIN_PATH             @"http://192.168.1.29/"
//#define API_PATH                @"Quick2.0/public/api/index"
//#define FILE_PATH               @"http://192.168.1.29/Quick2.0/public/uploadfiles/"
//#define TASKDETAIL_PATH         @"http://192.168.1.29/Quick2.0/public/"
//#define REACHABILITY_HOSTNAME   @"192.168.1.29" //!< 用于 Reachability 网络检测
//#define SERVER_CHECKVERSION_PATH    @"http://192.168.1.29/Quick2.0/public/version.php"

#else


#endif

#define APPLE_ID                    @"833389452"
#define ITUNES_CHECKVERSION_PATH    @"http://itunes.apple.com/lookup?id=833389452"
#define ITUNES_URL                  @"https://itunes.apple.com/us/app/sheng-sheng-hui-tou-che-ke/id833389452?l=zh&ls=1&mt=8"

@interface AppConfig : NSObject

@end
