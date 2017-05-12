//
//  ViewController.m
//  SlideLightLabel
//
//  Created by yejunyou on 2017/5/11.
//  Copyright © 2017年 yejunyou. All rights reserved.
//

#import "ViewController.h"
#import "UnlockView.h"

static NSInteger flag = 0;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    
    [self setupUnlockView];
    [self adTapGes];
}

- (void)adTapGes
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:tap];
    
//    for (UnlockView *view in self.view.subviews)
//    {
//        if (![view isKindOfClass:[UnlockView class]]) continue;
//        [view.leftCover addGestureRecognizer:tap];
//        [view.rightCover addGestureRecognizer:tap];
//    }
}

- (void)tapClick
{
    for (NSInteger i = 0; i < self.view.subviews.count; i ++)
    {
        UnlockView *unlockView = [self.view viewWithTag:i];
        if (![unlockView isKindOfClass:[UnlockView class]]) continue;
        [self setBGClolor:unlockView idnex:i];
    }
    flag++;
}

- (void)setupUnlockView
{
    CGFloat height = 40;
    NSInteger count = (NSInteger) ScreenHeight / height;
    CGFloat width = ScreenWidth;
    CGFloat x = 0;
    
    for (NSInteger i = 0; i < count ; i ++)
    {
        CGFloat y = i * (height) + 20;
        CGRect frame = CGRectMake(x, y, width, height);
        UnlockView *unlockView = [[UnlockView alloc] initWithFrame:frame];
        unlockView.sliderTime = (i * 0.2 + 1) ;
        unlockView.fontSize = 20;
        unlockView.tag = i;
        
        
        [self setBGClolor:unlockView idnex:i];
        
        [self.view addSubview:unlockView];
    }
}

- (void)setBGClolor:(UnlockView *)unlockView idnex:(NSInteger)i
{
    
    CGFloat R = arc4random_uniform(255) / 255.0;
    CGFloat G = arc4random_uniform(255) / 255.0;
    CGFloat B = arc4random_uniform(255) / 255.0;
    
    if (flag % 3 == 0)
    {
        unlockView.normalColor = [UIColor colorWithRed:R green:G blue:B alpha:1.0];
    }
    else if (flag % 3 == 1)
    {
        unlockView.normalColor = [UIColor grayColor];
    }else
    {
        if (i%2 == 0)
        {
            unlockView.normalColor = [UIColor grayColor];
        }
        else
        {
            unlockView.normalColor = [UIColor colorWithRed:R green:G blue:B alpha:1.0];
        }
    }
}

- (void)viewDidPan:(UIPanGestureRecognizer *)pan
{
    CGPoint offert = [pan translationInView:self.view];
    UIView *drapObj;
    
    CGFloat x = drapObj.center.x + offert.x;
    CGFloat y = drapObj.center.y + offert.y;
    
    drapObj.center = CGPointMake(x, y);
    [pan setTranslation:CGPointZero inView:drapObj];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
@end
