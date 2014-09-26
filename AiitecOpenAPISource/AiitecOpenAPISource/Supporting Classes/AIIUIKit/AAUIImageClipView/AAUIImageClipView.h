//
//  AAUIImageClipView.h
//  AAClient
//
//  Created by Mac mini on 13-5-10.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AAUIImageClipView : UIView
{
    UIImageView *_imageView;
    UIView *_overlayView;
    UIView *_ratioView;
    UIView *_ratioControlsView;
    CGSize _size;
}

- (void)setImage:(UIImage *)image size:(CGSize)size;
- (UIImage *)outputImage;

@end
