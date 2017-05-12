//
//  UnlockView.m
//  SlideLightLabel
//
//  Created by yejunyou on 2017/5/12.
//  Copyright © 2017年 yejunyou. All rights reserved.
//

#import "UnlockView.h"

#define kSliderTime  2.0f

@interface UnlockView ()
{
    CGFloat leftCoverLength;
    CGFloat middleMargin;
    CGFloat rightCoverLength;
    CGFloat coverAlpha;
}
@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation UnlockView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        middleMargin = 86;
        leftCoverLength = (ScreenWidth);
        rightCoverLength = leftCoverLength;
        coverAlpha = 0.7;
        
        _sliderTime = kSliderTime;
        _cycleTime = kSliderTime;
        
        [self addSubview:self.textLabel];
        [self addSubview:self.leftCover];
        [self addSubview:self.rightCover];
        self.backgroundColor = [UIColor clearColor];
        
        [self startAnimation];
    }
    return self;
}

- (void)step
{
    _leftCover.x = -leftCoverLength;
    _rightCover.x = middleMargin;
    [UIView animateWithDuration:_sliderTime animations:^{
        
        _leftCover.right = ScreenWidth;
        _rightCover.x = ScreenWidth + middleMargin;
        
    }];
}

- (void)startAnimation
{
    if (!_timer)
    {
        self.timer = [NSTimer timerWithTimeInterval:_cycleTime
                                             target:self
                                           selector:@selector(step)
                                           userInfo:nil
                                            repeats:YES];
        
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:UITrackingRunLoopMode];
    }
}

- (void)setSliderTime:(NSTimeInterval)sliderTime
{
    _sliderTime = sliderTime;
    _cycleTime = _sliderTime;
}

- (void)setCycleTime:(NSTimeInterval)cycleTime
{
    if (cycleTime < _sliderTime)
    {
        _cycleTime = _sliderTime;
        _cycleTime = cycleTime;
    }
    else
    {
        _cycleTime = cycleTime;
    }
}

- (void)setFontSize:(NSInteger)fontSize
{
    _fontSize = fontSize;
    _textLabel.font = [UIFont systemFontOfSize:fontSize];
}

- (void)setText:(NSString *)text
{
    _text = text;
    _textLabel.text = text;
}

- (void)setNormalColor:(UIColor *)normalColor
{
    _normalColor = normalColor;
    _textLabel.backgroundColor = normalColor;
    _leftCover.backgroundColor = normalColor;
    _rightCover.backgroundColor = normalColor;
}

- (UIView *)leftCover
{
    if (!_leftCover) {
        _leftCover = [[UIView alloc] init];
        _leftCover.frame = CGRectMake(0, 0, leftCoverLength, self.height);
        _leftCover.alpha = coverAlpha;
        _leftCover.backgroundColor = [UIColor grayColor];
    }
    return _leftCover;
}


- (UIView *)rightCover
{
    if (!_rightCover) {
        _rightCover = [[UIView alloc] init];
        _rightCover.frame = CGRectMake(leftCoverLength + middleMargin, 0, rightCoverLength, self.height);
        _rightCover.backgroundColor = [UIColor grayColor];
        _rightCover.alpha = coverAlpha;
    }
    return _rightCover;
}

- (UILabel *)textLabel
{
    if (_textLabel == nil) {
        _textLabel  = [[UILabel alloc] init];
        _textLabel.frame = CGRectMake(0, 0, ScreenWidth, self.height);
        _textLabel.text = @">>> 滑动来解锁 >>>";
        _textLabel.font = [UIFont systemFontOfSize:30];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.backgroundColor = [UIColor grayColor];
    }
    return _textLabel;
}
@end
