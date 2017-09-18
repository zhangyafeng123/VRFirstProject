//
//  threeViewController.m
//  project
//
//  Created by tao shiqiang on 2017/9/11.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "threeViewController.h"
#import "secondViewController.h"
#import "fourViewController.h"
@interface threeViewController ()

@end

@implementation threeViewController
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
    /* 过渡效果
     fade     //交叉淡化过渡(不支持过渡方向)
     push     //新视图把旧视图推出去
     moveIn   //新视图移到旧视图上面
     reveal   //将旧视图移开,显示下面的新视图
     cube     //立方体翻滚效果
     oglFlip  //上下左右翻转效果
     suckEffect   //收缩效果，如一块布被抽走(不支持过渡方向)
     rippleEffect //滴水效果(不支持过渡方向)
     pageCurl     //向上翻页效果
     pageUnCurl   //向下翻页效果
     cameraIrisHollowOpen  //相机镜头打开效果(不支持过渡方向)
     cameraIrisHollowClose //相机镜头关上效果(不支持过渡方向)
     */
    /* 过渡方向
     fromRight;
     fromLeft;
     fromTop;
     fromBottom;
     */
}
- (IBAction)btnaction:(UIButton *)sender {
    if (sender.tag == 150) {
        [self transitionwithsubtype:kCATransitionFromLeft];
        [self dismissViewControllerAnimated:NO completion:nil];
    } else if (sender.tag == 151){
        secondViewController *sec = [secondViewController new];
         [self transitionwithsubtype:kCATransitionFromLeft];
        [self presentViewController:sec animated:NO completion:nil];
    } else if (sender.tag == 152){
       //  [self transitionwithtype:@"pageCurl" withsubtype:kCATransitionFromLeft];
    } else {
        fourViewController *four = [fourViewController new];
         [self transitionwithsubtype:kCATransitionFromLeft];
         [self presentViewController:four animated:NO completion:nil];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
@end
