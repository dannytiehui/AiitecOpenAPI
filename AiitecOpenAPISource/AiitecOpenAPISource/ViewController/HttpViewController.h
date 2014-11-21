//
//  HttpViewController.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/10.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PacketRequest.h"
#import "HttpRequest.h"
#import "AIICheckVersion.h"

@interface HttpViewController : UIViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate, AIICheckVersionDelegate, AIIFileConnectionDelegate>

@end
