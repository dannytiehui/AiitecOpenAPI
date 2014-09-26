//
//  AAUIScrollView.h
//  AAUIKit
//
//  Created by iMac on 13-4-25.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConfig.h"

#define IOS_VERSION_7_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? (YES) : (NO))


@interface AAUIScrollView : UIScrollView
{
    @private
    NSTimer *_timer;
    UILabel *_label;
    float _additionalWidth; // 文本显示需要的宽度 - ScrollView frame的宽度。
    float _contentOffsetX;
}

- (id)initWithFrame:(CGRect)frame text:(NSString *)text withFont:(UIFont *)font;

@end
