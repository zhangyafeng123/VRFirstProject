//
//  firstDetailViewController.m
//  project
//
//  Created by tao shiqiang on 2017/9/12.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//
#define DURATION 0.7f
#import "firstDetailViewController.h"

#import "MMSpinImageView.h"
@interface firstDetailViewController ()

@property (weak, nonatomic) IBOutlet UIButton *onebtn;
@property (weak, nonatomic) IBOutlet UIButton *twobtn;
@property (weak, nonatomic) IBOutlet UIButton *threebtn;
@property (nonatomic, strong)MMSpinImageView *spinimageView;

@property (nonatomic, strong)MMSpinImageView *spinimageView1;

@property (nonatomic, strong)MMSpinImageView *spinimageView2;

@property (nonatomic, strong)NSTimer *timer;

@property (nonatomic, strong)NSTimer *timer1;

@property (nonatomic, strong)NSTimer *timer0;
@end

@implementation firstDetailViewController



- (IBAction)firstbtn:(UIButton *)sender {
    [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
   
    self.spinimageView.hidden = NO;
    self.spinimageView1.hidden = YES;
    self.spinimageView2.hidden = YES;
}
- (IBAction)secondBtn:(id)sender {
    [self transitionWithSubtype:kCATransitionFromBottom ForView:self.view];
   
    self.spinimageView.hidden = YES;
    self.spinimageView1.hidden = NO;
    self.spinimageView2.hidden = YES;
}
- (IBAction)threebtn:(id)sender {
     [self transitionWithSubtype:kCATransitionFromBottom ForView:self.view];
    self.spinimageView.hidden = YES;
    self.spinimageView1.hidden = YES;
    self.spinimageView2.hidden = NO;
}
- (IBAction)backbtn:(id)sender {
    [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
    [self dismissViewControllerAnimated:NO completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.num == 2) {
        self.threebtn.hidden = YES;
    }
    if (self.num == 3) {
        self.twobtn.hidden = YES;
        self.threebtn.hidden = YES;
    }
    [self createV];
}
- (void)createV
{
    
    self.spinimageView = [[MMSpinImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [self.view addSubview:self.spinimageView];
    self.spinimageView.imagesArray = [self.firstArray mutableCopy];
   
    [self.view sendSubviewToBack:self.spinimageView];
    UITapGestureRecognizer *tap0 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapaction0:)];
    tap0.numberOfTapsRequired = 2;
    [self.spinimageView addGestureRecognizer:tap0];
    
    
    self.spinimageView1 = [[MMSpinImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [self.view addSubview:self.spinimageView1];
    
    self.spinimageView1.imagesArray = [self.secondArray mutableCopy];
    self.spinimageView1.hidden = YES;
    [self.view sendSubviewToBack:self.spinimageView1];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapaction:)];
    tap.numberOfTapsRequired = 2;
    [self.spinimageView1 addGestureRecognizer:tap];
    self.spinimageView2 = [[MMSpinImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [self.view addSubview:self.spinimageView2];
    self.spinimageView2.imagesArray = [self.thridArray mutableCopy];
    self.spinimageView2.hidden = YES;
    [self.view sendSubviewToBack:self.spinimageView2];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapaction1:)];
    tap1.numberOfTapsRequired = 2;
    [self.spinimageView2 addGestureRecognizer:tap1];
    
    if (self.num == 3) {
        self.timer0 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timer0action:) userInfo:nil repeats:YES];
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeraction:) userInfo:nil repeats:YES];
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(timer1action:) userInfo:nil repeats:YES];
}
- (void)timer0action:(NSTimer *)newtimer
{
    if (self.spinimageView.currentIndex == self.firstArray.count - 1) {
        self.spinimageView.currentIndex = 0;
    }
    self.spinimageView.currentIndex += 1;
}
- (void)timeraction:(NSTimer *)newtimer
{
    if (self.spinimageView1.currentIndex == self.secondArray.count - 1) {
        self.spinimageView1.currentIndex = 0;
    }
    self.spinimageView1.currentIndex += 1;
}
- (void)timer1action:(NSTimer *)newtimer
{
    if (self.spinimageView2.currentIndex == self.thridArray.count - 1) {
        self.spinimageView2.currentIndex = 0;
    }
    self.spinimageView2.currentIndex += 1;
}
//双加
- (void)tapaction0:(UITapGestureRecognizer *)tap
{
    [self.timer0 setFireDate:[NSDate distantPast]];
}
- (void)tapaction:(UITapGestureRecognizer *)tap
{
    [self.timer setFireDate:[NSDate distantPast]];
}
- (void)tapaction1:(UITapGestureRecognizer *)tap
{
    [self.timer1 setFireDate:[NSDate distantPast]];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //关闭定时器
    [self.timer0 setFireDate:[NSDate distantFuture]];
    [self.timer setFireDate:[NSDate distantFuture]];
    [self.timer1 setFireDate:[NSDate distantFuture]];
}
- (void)dealloc
{
    [self.timer0 invalidate];
    self.timer0 = nil;
    [self.timer invalidate];
    self.timer = nil;
    [self.timer1 invalidate];
    self.timer1 = nil;
}
#pragma CATransition动画实现
#pragma CATransition动画实现
- (void) transitionWithSubtype:(NSString *) subtype ForView : (UIView *) view
{
    int value = (arc4random() % 6) + 1;
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = DURATION;
    
    //设置运动type
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
    if (subtype != nil) {
        
        //设置子类
        animation.subtype = subtype;
    }
    
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.layer addAnimation:animation forKey:@"animation"];
}

@end
