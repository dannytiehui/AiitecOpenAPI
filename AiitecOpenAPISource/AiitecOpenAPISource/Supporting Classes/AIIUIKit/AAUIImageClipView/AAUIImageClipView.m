//
//  AAUIImageClipView.m
//  AAClient
//
//  Created by Mac mini on 13-5-10.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AAUIImageClipView.h"
#import <QuartzCore/QuartzCore.h>

@implementation AAUIImageClipView

- (void)setImage:(UIImage *)image size:(CGSize)size
{
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _imageView.image = image;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transparencyPattern.png"]];
    [self addSubview:_imageView];
    
    // Setup gestures
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGesture:)];
    
    CGRect actualImageRect = [self actualImageRect];
    _size = size;
    if (_size.width > actualImageRect.size.width) {
        double rate = actualImageRect.size.width / _size.width;
        _size.width = actualImageRect.size.width;
        _size.height *= rate;
    }
    if (_size.height > actualImageRect.size.height) {
        double rate = actualImageRect.size.height / _size.height;
        _size.height = actualImageRect.size.height;
        _size.width *= rate;
    }
    
    // Ratio Controls View
    _ratioControlsView = [[UIView alloc] initWithFrame:CGRectMake(_imageView.frame.origin.x + actualImageRect.origin.x, actualImageRect.origin.y, actualImageRect.size.width, actualImageRect.size.height)];
    _ratioControlsView.autoresizesSubviews = YES;
    [_ratioControlsView addGestureRecognizer:pinchGestureRecognizer];
    
    // Overlay
    _overlayView = [[UIView alloc] initWithFrame:_ratioControlsView.bounds];
    _overlayView.alpha = 0.5;
    _overlayView.backgroundColor = [UIColor blackColor];
    _overlayView.userInteractionEnabled = NO;
    _overlayView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [_ratioControlsView addSubview:_overlayView];
    
    // Ratio view
    _ratioView = [[UIView alloc] initWithFrame:CGRectMake(0.5 * (actualImageRect.size.width - _size.width), 0.5 * (actualImageRect.size.height - _size.height), _size.width, _size.height)];
    _ratioView.layer.borderColor = [UIColor redColor].CGColor;
    _ratioView.layer.borderWidth = 1;
    [_ratioView addGestureRecognizer:panGestureRecognizer];
    [_ratioControlsView addSubview:_ratioView];
    
    [self addSubview:_ratioControlsView];
    
    [self overlayClipping];
}

- (CGRect)actualImageRect
{
    if (!_imageView.image) {
        return CGRectMake(0, 0, 0, 0);
    }
    
    CGSize imageSize = _imageView.image.size;
    
    float imageRatio = imageSize.width / imageSize.height;
    float viewRatio = _imageView.frame.size.width / _imageView.frame.size.height;
    
    CGRect actualImageRect;
    
    if (imageRatio < viewRatio)
    {
        float scale = _imageView.frame.size.height / imageSize.height;
        float width = scale * imageSize.width;
        float topLeftX = 0.5 * (_imageView.frame.size.width - width);
        actualImageRect = CGRectMake(topLeftX, 0, width, _imageView.frame.size.height);
    }
    else
    {
        float scale = _imageView.frame.size.width / imageSize.width;
        float height = scale * imageSize.height;
        float topLeftY = 0.5 * (_imageView.frame.size.height - height);
        actualImageRect = CGRectMake(0, topLeftY, _imageView.frame.size.width, height);
    }
    
    return actualImageRect;
}

- (void)overlayClipping
{
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    CGMutablePathRef path = CGPathCreateMutable();
    
    // Left side of the ratio view
    CGPathAddRect(path, nil, CGRectMake(0,
                                        0,
                                        _ratioView.frame.origin.x,
                                        _overlayView.frame.size.height));
    // Right side of the ratio view
    CGPathAddRect(path, nil, CGRectMake(
                                        _ratioView.frame.origin.x + _ratioView.frame.size.width,
                                        0,
                                        _overlayView.frame.size.width - _ratioView.frame.origin.x - _ratioView.frame.size.width,
                                        _overlayView.frame.size.height));
    // Top side of the ratio view
    CGPathAddRect(path, nil, CGRectMake(0,
                                        0,
                                        _overlayView.frame.size.width,
                                        _ratioView.frame.origin.y));
    // Bottom side of the ratio view
    CGPathAddRect(path, nil, CGRectMake(0,
                                        _ratioView.frame.origin.y + _ratioView.frame.size.height,
                                        _overlayView.frame.size.width,
                                        _overlayView.frame.size.height - _ratioView.frame.origin.y + _ratioView.frame.size.height));
    maskLayer.path = path;
    
    _overlayView.layer.mask = maskLayer;
    CGPathRelease(path);
}

- (UIImage *)outputImage
{
    CGFloat rotationAngle = 0;
    if (_imageView.image.imageOrientation == UIImageOrientationRight) {
        rotationAngle = M_PI_2;
    }
    else if (_imageView.image.imageOrientation == UIImageOrientationDown) {
        rotationAngle = M_PI;
    }
    else if (_imageView.image.imageOrientation == UIImageOrientationLeft) {
        rotationAngle = -M_PI_2;
    }
    
    CGSize imageSize = _imageView.image.size;
    CGSize rotationSize = imageSize;
    if (_imageView.image.imageOrientation == UIImageOrientationLeft || _imageView.image.imageOrientation == UIImageOrientationRight) {
        rotationSize = CGSizeMake(rotationSize.height, rotationSize.width);
    }
    
    // Create the bitmap context
    UIGraphicsBeginImageContext(rotationSize);
    CGContextRef imageContextRef = UIGraphicsGetCurrentContext();
    
    // Set the anchor point to {0.5, 0.5}
    CGContextTranslateCTM(imageContextRef, rotationSize.width * 0.5, rotationSize.height * 0.5);
    
    // Apply rotation
    CGContextRotateCTM(imageContextRef, rotationAngle);
    
    // Draw the current image
    CGContextScaleCTM(imageContextRef, 1, -1);
    CGContextDrawImage(imageContextRef, (CGRect) {{-(.5 * imageSize.width), -(.5 * imageSize.height)}, imageSize}, _imageView.image.CGImage);
    
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    CGSize scaledImageSize = [self actualImageRect].size;
    CGFloat widthFactor = scaledImageSize.width / rotationSize.width;
    CGFloat heightFactor = scaledImageSize.height / rotationSize.height;
    
    CGRect currentCropRect = _ratioView.frame;
    CGRect actualCropRect = CGRectMake(
                                       roundf(currentCropRect.origin.x / widthFactor),
                                       roundf(currentCropRect.origin.y / heightFactor),
                                       roundf(currentCropRect.size.width / widthFactor),
                                       roundf(currentCropRect.size.height / heightFactor)
                                       );
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(outputImage.CGImage, actualCropRect);
    outputImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    imageSize = outputImage.size;
    
    // Create the bitmap context
    UIGraphicsBeginImageContext(_size);
    imageContextRef = UIGraphicsGetCurrentContext();
    
    // Set the anchor point to {0.5, 0.5}
    CGContextTranslateCTM(imageContextRef, _size.width * 0.5, _size.height * 0.5);
    
    // Draw the current image
    CGContextScaleCTM(imageContextRef, _size.width / imageSize.width, - _size.height / imageSize.height);
    CGContextDrawImage(imageContextRef, (CGRect) {{-(.5 * imageSize.width), -(.5 * imageSize.height)}, imageSize}, outputImage.CGImage);
    
    outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return outputImage;
}

#pragma mark - Gestures

- (void)panGesture:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:recognizer.view];
    CGPoint center = CGPointMake(0, 0);
    
    // Superview's width minus half of ratio view's width
    CGFloat maxXCenter = _ratioControlsView.frame.size.width - (_ratioView.frame.size.width * 0.5);
    // Half of ratio view's width
    CGFloat minXCenter = _ratioView.frame.size.width * 0.5;
    CGFloat computedXCenter = recognizer.view.center.x + translation.x;
    
    if (computedXCenter < minXCenter) {
        computedXCenter = minXCenter;
    } else if (computedXCenter > maxXCenter) {
        computedXCenter = maxXCenter;
    }
    
    // Superview's height minus half of ratio view's height
    CGFloat maxYCenter = _ratioControlsView.frame.size.height - (_ratioView.frame.size.height * 0.5);
    // Half of ratio view's height
    CGFloat minYCenter = _ratioView.frame.size.height * 0.5;
    CGFloat computedYCenter = recognizer.view.center.y + translation.y;
    
    if (computedYCenter < minYCenter) {
        computedYCenter = minYCenter;
    } else if (computedYCenter > maxYCenter) {
        computedYCenter = maxYCenter;
    }
    
    center = CGPointMake(computedXCenter, computedYCenter);
    
    [recognizer setTranslation:CGPointMake(0, 0) inView:_ratioView];
    [recognizer.view setCenter:center];
    
    [self overlayClipping];
}

- (void)pinchGesture:(UIPinchGestureRecognizer *)recognizer
{
    CGPoint center = _ratioView.center;
    CGRect rect = _ratioView.frame;
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    width *= recognizer.scale;
    height *= recognizer.scale;
    
    if (width <= _ratioControlsView.frame.size.width && height <= _ratioControlsView.frame.size.height) {
        rect.size.width = width;
        rect.size.height = height;
        _ratioView.frame = rect;
        _ratioView.center = center;
        rect = _ratioView.frame;
        
        if (rect.origin.x < 0) {
            rect.origin.x = 0;
        }
        
        if (rect.origin.y < 0) {
            rect.origin.y = 0;
        }
        
        if (rect.origin.x + rect.size.width > _ratioControlsView.frame.size.width) {
            rect.origin.x = _ratioControlsView.frame.size.width - rect.size.width;
        }
        
        if (rect.origin.y + rect.size.height > _ratioControlsView.frame.size.height) {
            rect.origin.y = _ratioControlsView.frame.size.height - rect.size.height;
        }
        
        _ratioView.frame = rect;
        [self overlayClipping];
    }
    
    recognizer.scale = 1;
}

@end
