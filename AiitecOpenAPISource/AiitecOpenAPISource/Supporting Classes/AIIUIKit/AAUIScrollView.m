//
//  AAUIScrollView.m
//  AAUIKit
//
//  Created by iMac on 13-4-25.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AAUIScrollView.h"

@implementation AAUIScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame text:(NSString *)text withFont:(UIFont *)font
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //设置字体,包括字体及其大小
//        UIFont *font = [UIFont fontWithName:fontName size:fontSize];
        CGSize size;
//        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        if (IOS_VERSION_7_OR_ABOVE) {
            NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
            size = [text sizeWithAttributes:dic];
        }
        else {
            NSDictionary *attributes = @{NSFontAttributeName:font};
            size = [text sizeWithAttributes:attributes];
        }
//        NSLog(@"size:w=%f,h=%f", size.width, size.height);
        
        _additionalWidth = size.width - frame.size.width;
        NSLog(@"_additionalWidth=%f", _additionalWidth);
        
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.contentSize = size;
//        self.backgroundColor = [UIColor yellowColor];
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, size.width, size.height)];
        _label.text = text;
        _label.textColor = [UIColor whiteColor];
        _label.backgroundColor = [UIColor clearColor];
        _label.font = font;
        _label.shadowColor = [UIColor darkGrayColor];
        _label.shadowOffset = CGSizeMake(0, -1);
        [self addSubview:_label];
        
        //        [self move];
        // 一个英文字符宽度约为10像素，当至少有一个字符不能完全显示的时候才开启移动
        if (_additionalWidth > 10) {
            [_timer invalidate];
            _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(move) userInfo:nil repeats:YES];
            _contentOffsetX = 0;
        }
    }
    return self;
}


- (void)move
{
    static BOOL direct = YES;//左移
    CGPoint point = self.contentOffset;
    
    if (_contentOffsetX > _additionalWidth || _contentOffsetX < 0) {
        direct = !direct;
    }
    
    if (direct) {
        _contentOffsetX += 0.5;
    }
    else {
        _contentOffsetX -= 0.5;
    }
    point.x = _contentOffsetX;
    self.contentOffset = point;
//    NSLog(@"point.x = %f", point.x);
    
//    if (direct) { 
//        [UIView animateWithDuration:3 animations:^{
//            self.contentOffset = CGPointMake(_additionalWidth, 0.0f);
//        }];
//    }
//    else {
//        [UIView animateWithDuration:3 animations:^{
//            self.contentOffset = CGPointMake(0.0f, 0.0f);
//        }];
//    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded...");
    if (_timer) {
        [_timer invalidate];
    }
}

- (void)removeFromSuperview
{
    NSLog(@"removeFromSuperview...");
    if (_timer) {
        [_timer invalidate];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
