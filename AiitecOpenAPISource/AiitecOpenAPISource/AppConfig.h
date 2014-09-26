//
//  AppConfig.h
//  AAClient
//
//  Created by iMac on 13-6-4.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG
#define DOMAIN_PATH             @"http://192.168.1.12/"
#define API_PATH                @"kuaiying/public/api/"
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



@interface AppConfig : NSObject

@end