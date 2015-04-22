//
//  ViewController.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14-9-26.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PacketRequest.h"

@interface ViewController : UIViewController <AIIPacketConnectionDelegate>

@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UIButton *button;

@end

