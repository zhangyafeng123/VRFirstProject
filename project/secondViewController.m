//
//  secondViewController.m
//  project
//
//  Created by tao shiqiang on 2017/9/11.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//
#import "ViewController.h"
#import "secondViewController.h"
#import "threeViewController.h"
#import "fourViewController.h"
@interface secondViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *topimageView;
@property (weak, nonatomic) IBOutlet UIImageView *bigimageView;

@end

@implementation secondViewController
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
- (IBAction)topbtnaction:(UIButton *)sender {
    if (sender.tag == 200) {
        self.topimageView.image = [UIImage imageNamed:@"1总区位"];
        self.bigimageView.image = [UIImage imageNamed:@"1区位图"];
    } else if (sender.tag == 201){
        self.topimageView.image = [UIImage imageNamed:@"2教育配套"];
        self.bigimageView.image = [UIImage imageNamed:@"教育配套new"];
    } else if (sender.tag == 202){
        self.topimageView.image = [UIImage imageNamed:@"3医疗配套"];
        self.bigimageView.image = [UIImage imageNamed:@"3医疗配套new"];
    } else if (sender.tag == 203){
        self.topimageView.image = [UIImage imageNamed:@"4生活配套"];
        self.bigimageView.image = [UIImage imageNamed:@"3生活配套"];
    } else {
        self.topimageView.image = [UIImage imageNamed:@"5市政配套"];
        self.bigimageView.image = [UIImage imageNamed:@"4市政配套"];
    }
}

- (IBAction)bottombtnaction:(UIButton *)sender {
    if (sender.tag == 100) {
        
        [self transitionwithsubtype:kCATransitionFromLeft];
        [self dismissViewControllerAnimated:NO completion:nil];
    } else if (sender.tag == 101){
        
    } else if (sender.tag == 102){
        threeViewController *three = [threeViewController new];
        [self transitionwithsubtype:kCATransitionFromTop];
        [self presentViewController:three animated:NO completion:nil];
    } else{
        fourViewController *four = [fourViewController new];
        [self transitionwithsubtype:kCATransitionFromBottom];
        [self presentViewController:four animated:NO completion:nil];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



@end
