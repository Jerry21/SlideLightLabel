//
//  UnlockView.h
//  SlideLightLabel
//
//  Created by yejunyou on 2017/5/12.
//  Copyright © 2017年 yejunyou. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UnlockView : UIView
@property (nonatomic, strong) UIView *leftCover;
@property (nonatomic, strong) UIView *rightCover;
@property (nonatomic, assign) NSTimeInterval sliderTime; // 滑动时长，默认2.0s
@property (nonatomic, assign) NSTimeInterval cycleTime; // 默认和sliderTime一样
@property (nonatomic, assign) NSInteger fontSize;
@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) UIColor *normalColor; // 默认灰色
@end
