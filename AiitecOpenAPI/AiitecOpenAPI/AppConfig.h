//
//  AppConfig.h
//  AiitecOpenAPI
//
//  Created by iMac on 14-10-11.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"

#ifdef DEBUG
#define DOMAIN_PATH             @"http://192.168.1.12/"
#define API_PATH                @"kuaiying/public/api/index"
#define FILE_PATH               @"http://192.168.1.12/"
#define REACHABILITY_HOSTNAME   @"192.168.1.12" //!< 用于 Reachability 网络检测
#define SERVER_CHECKVERSION_PATH    @"http://192.168.1.12/kuaiying/public/version.php"
#else

#define DOMAIN_PATH             @"http://www.ky.me/"
#define API_PATH                @"api/"
#define FILE_PATH               @"http://www.ky.me/"
#define REACHABILITY_HOSTNAME   @"www.ky.me" //!< 用于 Reachability 网络检测
#define SERVER_CHECKVERSION_PATH    @"http://www.ky.me/version.php"

#endif

#define APPLE_ID                    @"833389452"
#define ITUNES_CHECKVERSION_PATH    @"http://itunes.apple.com/lookup?id=833389452"
#define ITUNES_URL                  @"https://itunes.apple.com/us/app/sheng-sheng-hui-tou-che-ke/id833389452?l=zh&ls=1&mt=8"


@interface AppConfig : AIIRequest

@end
