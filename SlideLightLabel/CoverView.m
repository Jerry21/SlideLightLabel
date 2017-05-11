//
//  CoverView.m
//  SlideLightLabel
//
//  Created by yejunyou on 2017/5/11.
//  Copyright © 2017年 yejunyou. All rights reserved.
//

#import "CoverView.h"

@interface CoverView ()
{
    CGFloat leftCoverLength;
    CGFloat middleMargin;
    CGFloat rightCoverLength;
    CGFloat coverAlpha;
}
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation CoverView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        middleMargin = 86;
        leftCoverLength = ScreenWidth - middleMargin / 2;
        rightCoverLength = ScreenWidth - middleMargin / 2;
        coverAlpha = 0.7;
        
        [self addSubview:self.leftCover];
        [self addSubview:self.rightCover];
        self.backgroundColor = [UIColor clearColor];
        
//        [self startAnimation];
    }
    return self;
}

- (void)step
{
    NSLog(@"step");
    _leftCover.x += 1;
    _rightCover.x += 1;
    
    if (_leftCover.x > ScreenWidth - middleMargin / 2) {
        _leftCover.x = 0;
        _rightCover.x = _leftCover.width + middleMargin;
    }
}

- (void)startAnimation
{
    if (!_timer)
    {
        self.timer = [NSTimer timerWithTimeInterval:1.0/600.0
                                             target:self
                                           selector:@selector(step)
                                           userInfo:nil
                                            repeats:YES];
        
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:UITrackingRunLoopMode];
    }
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
@end
