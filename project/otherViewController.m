//
//  otherViewController.m
//  project
//
//  Created by tao shiqiang on 2017/9/14.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "otherViewController.h"

@interface otherViewController ()
@property (nonatomic, strong)UIButton *btn;
@end

@implementation otherViewController
//动画实现
- (void)transitionwithsubtype:(NSString *)newtypestr
{
    int value = (arc4random() % 6) + 1;
    CATransition *animation = [CATransition animation];
    //设置运动轨迹的速度
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    //设置动画类型为立方体动画
    if (value==1) {
        animation.type = @"cube";
    }
    if (value==2) {
        animation.type = @"fade";
    }
    if (value==3) {
        animation.type = @"oglFlip";
    }
    if (value==5) {
        animation.type = @"rippleEffect";
    }
    if (value==4) {
        animation.type = @"pageCurl";
    }
    if (value==6) {
        animation.type = @"suckEffect";
    }
    
    //设置动画时长
    animation.duration =1.0f;
    //控制器间跳转动画
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    JAPanoView *panoView=[[JAPanoView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    self.view=panoView;
    panoView.delegate=self;
    [panoView setFrontImage:[UIImage imageNamed:@"output0_cube_0.jpg"] rightImage:[UIImage imageNamed:@"output0_cube_1.jpg"] backImage:[UIImage imageNamed:@"output0_cube_2.jpg"] leftImage:[UIImage imageNamed:@"output0_cube_3.jpg"] topImage:[UIImage imageNamed:@"output0_cube_4.jpg"] bottomImage:[UIImage imageNamed:@"output0_cube_5.jpg"]];
    self.btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.btn.frame = CGRectMake(50, 50, 60, 30);
    [self.btn setTitle:@"back" forState:(UIControlStateNormal)];
    [self.btn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.btn];
}
- (void)action:(UIButton *)sender
{
    [self transitionwithsubtype:kCATransitionFromLeft];
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
