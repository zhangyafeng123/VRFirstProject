//
//  ViewController.m
//  project
//
//  Created by tao shiqiang on 2017/9/8.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//
#define DURATION 0.7f
#import "secondViewController.h"
#import "ViewController.h"
#import "threeViewController.h"
#import "fourViewController.h"
#import "MMSpinImageView.h"
#import "ImgBtn.h"
#import "firstDetailViewController.h"
#import "leftView.h"
#import "firstView.h"
#import "secondView.h"
#import "otherViewController.h"
@interface ViewController ()<MMSpinImageViewDelegate,ImgBtnDelegate,firstViewDelegate,secondViewDeleagate>
@property (weak, nonatomic) IBOutlet UIButton *firstbtn;
@property (weak, nonatomic) IBOutlet UIButton *secondbtn;
@property (weak, nonatomic) IBOutlet UIButton *threebtn;
@property (weak, nonatomic) IBOutlet UIButton *fourbtn;
@property (nonatomic, strong)MMSpinImageView *spinimageView;
@property (weak, nonatomic) IBOutlet UIView *backV;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImg;
//
@property (nonatomic, strong)ImgBtn *hudongBtn1;
@property (nonatomic, strong)ImgBtn *hudongBtn2;
@property (nonatomic, strong)ImgBtn *hudongBtn3;
@property (nonatomic, strong)ImgBtn *hudongBtn4;
@property (nonatomic, strong)leftView *leftV;

@property (nonatomic, strong)ImgBtn *peitaoBtn1;
@property (nonatomic, strong)ImgBtn *peitaoBtn2;
@property (nonatomic, strong)ImgBtn *peitaoBtn3;
@property (nonatomic, strong)ImgBtn *peitaoBtn4;
@property (nonatomic, strong)ImgBtn *peitaoBtn5;

@property (nonatomic, strong)ImgBtn *fuwuBtn1;
@property (nonatomic, strong)ImgBtn *fuwuBtn2;
@property (nonatomic, strong)ImgBtn *fuwuBtn3;
@property (nonatomic, strong)ImgBtn *fuwuBtn4;

@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic, strong)firstView *firstV;

@property (nonatomic, strong)secondView *secondV;

//计时器
@property (nonatomic, strong)NSTimer *timer;
//区分是第几个按钮
@property (nonatomic, assign)NSInteger btnnum;

@end

@implementation ViewController
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

- (IBAction)rightbtnAction:(UIButton *)sender {
   
    if (sender.tag == 100) {
        sender.selected = YES;
        self.secondbtn.selected = NO;
        self.threebtn.selected  = NO;
        self.fourbtn.selected = NO;
        self.leftV.hidden = YES;
        self.peitaoBtn1.hidden = YES;
        self.peitaoBtn2.hidden = YES;
        self.peitaoBtn3.hidden = YES;
        self.peitaoBtn4.hidden = YES;
        self.peitaoBtn5.hidden = YES;
        self.fuwuBtn1.hidden = YES;
        self.fuwuBtn2.hidden = YES;
        self.fuwuBtn3.hidden = YES;
        self.fuwuBtn4.hidden = YES;
        self.btnnum = 1;
        [self.timer setFireDate:[NSDate distantPast]];
       
    } else if (sender.tag == 101){
        sender.selected = YES;
        self.firstbtn.selected = NO;
        self.threebtn.selected = NO;
        self.fourbtn.selected = NO;
        
        //隐藏
        self.hudongBtn1.hidden = YES;
        self.hudongBtn2.hidden = YES;
        self.hudongBtn3.hidden = YES;
        self.hudongBtn4.hidden = YES;
        self.leftV.hidden = NO;
        self.peitaoBtn1.hidden = YES;
        self.peitaoBtn2.hidden = YES;
        self.peitaoBtn3.hidden = YES;
        self.peitaoBtn4.hidden = YES;
        self.peitaoBtn5.hidden = YES;
        
        self.fuwuBtn1.hidden = YES;
        self.fuwuBtn2.hidden = YES;
        self.fuwuBtn3.hidden = YES;
        self.fuwuBtn4.hidden = YES;
    } else if (sender.tag == 102){
        sender.selected = YES;
        self.firstbtn.selected = NO;
        self.secondbtn.selected = NO;
        self.fourbtn.selected = NO;
        //隐藏
        self.hudongBtn1.hidden = YES;
        self.hudongBtn2.hidden = YES;
        self.hudongBtn3.hidden = YES;
        self.hudongBtn4.hidden = YES;
        self.leftV.hidden = YES;
        self.fuwuBtn1.hidden = YES;
        self.fuwuBtn2.hidden = YES;
        self.fuwuBtn3.hidden = YES;
        self.fuwuBtn4.hidden = YES;
        self.btnnum = 3;
        [self.timer setFireDate:[NSDate distantPast]];
        
    } else {
        sender.selected = YES;
        self.firstbtn.selected = NO;
        self.secondbtn.selected = NO;
        self.threebtn.selected = NO;
        //隐藏
        self.hudongBtn1.hidden = YES;
        self.hudongBtn2.hidden = YES;
        self.hudongBtn3.hidden = YES;
        self.hudongBtn4.hidden = YES;
        self.leftV.hidden = YES;
        self.peitaoBtn1.hidden = YES;
        self.peitaoBtn2.hidden = YES;
        self.peitaoBtn3.hidden = YES;
        self.peitaoBtn4.hidden = YES;
        self.peitaoBtn5.hidden = YES;
        self.btnnum = 2;
         [self.timer setFireDate:[NSDate distantPast]];
       
        
    }
}

- (IBAction)bottombtnaction:(UIButton *)sender {
    if (sender.tag == 201) {
        
    } else if (sender.tag == 202){
        secondViewController *sec = [secondViewController new];
        [self transitionwithsubtype:kCATransitionFromRight];
        [self presentViewController:sec animated:NO completion:nil];
    } else if (sender.tag == 203){
        threeViewController *three = [threeViewController new];
        [self transitionwithsubtype:kCATransitionFromTop];
        [self presentViewController:three animated:NO completion:nil];
    } else {
        fourViewController *four = [fourViewController new];
        [self transitionwithsubtype:kCATransitionFromLeft];
        [self presentViewController:four animated:NO completion:nil];
    }
}

- (void)dealloc
{
    [self.timer invalidate];
    self.timer = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.spinimageView = [[MMSpinImageView alloc] initWithFrame:self.view.bounds];
    
    [self.backV addSubview:self.spinimageView];
    
    
    self.spinimageView.delegate = self;
    
    for (int i = 0; i <60; i++) {
        [self.dataArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"00-%d.jpg",i]]];
    }
    
    self.spinimageView.imagesArray = [self.dataArray mutableCopy];
    
    
    //创建计时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeraction:) userInfo:nil repeats:YES];
    
    [self setdiffrentview];
    
}
//计时器点击事件
- (void)timeraction:(NSTimer *)newtimer
{
    if (self.btnnum == 1) {
        //第一个按钮
        if (self.spinimageView.currentIndex == 0) {
            //关闭定时器
            [newtimer setFireDate:[NSDate distantFuture]];
            self.hudongBtn1.hidden = NO;
            self.hudongBtn4.hidden = NO;
            self.hudongBtn3.hidden = NO;
            self.hudongBtn2.hidden = NO;
            
            
            return;
        }
        self.spinimageView.currentIndex -= 1;
        //第四个按钮
    } else if (self.btnnum == 2){
        if (self.spinimageView.currentIndex == 6) {
            //关闭定时器
            [newtimer setFireDate:[NSDate distantFuture]];
           
            
            self.fuwuBtn1.hidden = NO;
            self.fuwuBtn2.hidden = NO;
            self.fuwuBtn3.hidden = NO;
            self.fuwuBtn4.hidden = NO;
            return;
        }
        if (self.spinimageView.currentIndex >= 0 && self.spinimageView.currentIndex < 6) {
            self.spinimageView.currentIndex += 1;
        } else {
             self.spinimageView.currentIndex -= 1;
        }
       //第三个按钮
    } else if (self.btnnum == 3){
        if (self.spinimageView.currentIndex == 0) {
            //关闭定时器
            [newtimer setFireDate:[NSDate distantFuture]];
          
            self.peitaoBtn1.hidden = NO;
            self.peitaoBtn2.hidden = NO;
            self.peitaoBtn3.hidden = NO;
            self.peitaoBtn4.hidden = NO;
            self.peitaoBtn5.hidden = NO;
          
            return;
        }
         self.spinimageView.currentIndex -= 1;
    }
}
//----------MMSpinImageViewDeleaget--------
- (void)spinImageView:(MMSpinImageView *)view didSelectAtIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
}
//当进行拖动的时候
- (void)spinImageViewchangepan:(CGPoint)point inde:(NSInteger)index
{
    
}

- (void)spinImageViewBeginpan
{
    //隐藏
    self.hudongBtn1.hidden = YES;
    self.hudongBtn2.hidden = YES;
    self.hudongBtn3.hidden = YES;
    self.hudongBtn4.hidden = YES;
    self.leftV.hidden = YES;
    self.peitaoBtn1.hidden = YES;
    self.peitaoBtn2.hidden = YES;
    self.peitaoBtn3.hidden = YES;
    self.peitaoBtn4.hidden = YES;
    self.peitaoBtn5.hidden = YES;
    self.fuwuBtn1.hidden = YES;
    self.fuwuBtn2.hidden = YES;
    self.fuwuBtn3.hidden = YES;
    self.fuwuBtn4.hidden = YES;
}

- (void)setdiffrentview
{
    //firstView
    
    //创建（互动展示按钮）
   //1
    self.hudongBtn1 = [[ImgBtn alloc] initWithFrame:CGRectMake(350, 300, 150, 20) imagestr:@"20层楼层展示" tag:1000];
    self.hudongBtn1.tag = 1000;
    self.hudongBtn1.delegate = self;
    [self.spinimageView addSubview:self.hudongBtn1];
    
    //2
    self.hudongBtn2 = [[ImgBtn alloc] initWithFrame:CGRectMake(370, 430, 120, 20) imagestr:@"6层楼层展示" tag:1001];
    
    self.hudongBtn2.delegate = self;
    [self.spinimageView addSubview:self.hudongBtn2];
    
    //3
    self.hudongBtn3 = [[ImgBtn alloc] initWithFrame:CGRectMake(380, 460, 90, 20) imagestr:@"大堂体验" tag:1002];
    
    self.hudongBtn3.delegate = self;
    [self.spinimageView addSubview:self.hudongBtn3];
    //4
    self.hudongBtn4 = [[ImgBtn alloc] initWithFrame:CGRectMake(650, 550, 100, 20) imagestr:@"商业街漫游" tag:1003];
    
    self.hudongBtn4.delegate = self;
    [self.spinimageView addSubview:self.hudongBtn4];
    //隐藏
    self.hudongBtn1.hidden = YES;
    self.hudongBtn2.hidden = YES;
    self.hudongBtn3.hidden = YES;
    self.hudongBtn4.hidden = YES;
    //项目概况
    self.leftV = [[leftView alloc] initWithFrame:CGRectMake(50, 70, 400, 500)];
    [self.view addSubview:self.leftV];
    self.leftV.hidden = YES;
    
    //项目配套
    self.peitaoBtn1 = [[ImgBtn alloc] initWithFrame:CGRectMake(350, 300, 140, 20) imagestr:@"1 智能化系统" tag:1500];
    self.peitaoBtn1.delegate = self;
    [self.spinimageView addSubview:self.peitaoBtn1];
    self.peitaoBtn2 = [[ImgBtn alloc] initWithFrame:CGRectMake(340, 350, 80, 60) imagestr:@"3 地下车位" tag:1501];
    self.peitaoBtn2.delegate = self;
    [self.spinimageView addSubview:self.peitaoBtn2];
    self.peitaoBtn3 = [[ImgBtn alloc] initWithFrame:CGRectMake(380, 460, 90, 20) imagestr:@"2 大堂" tag:1502];
    self.peitaoBtn3.delegate = self;
    [self.spinimageView addSubview:self.peitaoBtn3];
    self.peitaoBtn4 = [[ImgBtn alloc] initWithFrame:CGRectMake(650, 350, 120, 20) imagestr:@"5 建筑幕墙" tag:1503];
    self.peitaoBtn4.delegate = self;
    [self.spinimageView addSubview:self.peitaoBtn4];
    self.peitaoBtn5 = [[ImgBtn alloc] initWithFrame:CGRectMake(600, 400, 120, 20) imagestr:@"4 电梯" tag:1504];
    self.peitaoBtn5.delegate = self;
    [self.spinimageView addSubview:self.peitaoBtn5];
    self.peitaoBtn1.hidden = YES;
    self.peitaoBtn2.hidden = YES;
    self.peitaoBtn3.hidden = YES;
    self.peitaoBtn4.hidden = YES;
    self.peitaoBtn5.hidden = YES;
    
    //SVO服务体系
    self.fuwuBtn1 = [[ImgBtn alloc] initWithFrame:CGRectMake(380, 300, 150, 20) imagestr:@"商业配套服务" tag:2000];
    self.fuwuBtn1.delegate = self;
    [self.spinimageView addSubview:self.fuwuBtn1];
    self.fuwuBtn2 = [[ImgBtn alloc] initWithFrame:CGRectMake(360, 460, 120, 20) imagestr:@"大堂功能区" tag:2001];
    self.fuwuBtn2.delegate = self;
    [self.spinimageView addSubview:self.fuwuBtn2];
    self.fuwuBtn3 = [[ImgBtn alloc] initWithFrame:CGRectMake(660, 100, 150, 300) imagestr:@"10-30层创智总部办公区" tag:2002];
    self.fuwuBtn3.delegate = self;
    [self.spinimageView addSubview:self.fuwuBtn3];
    self.fuwuBtn4 = [[ImgBtn alloc] initWithFrame:CGRectMake(660, 405, 120, 50) imagestr:@"6-9层联合办公区" tag:2003];
    self.fuwuBtn4.delegate = self;
    [self.spinimageView addSubview:self.fuwuBtn4];
    self.fuwuBtn1.hidden = YES;
    self.fuwuBtn2.hidden = YES;
    self.fuwuBtn3.hidden = YES;
    self.fuwuBtn4.hidden = YES;
}
//代理方法
- (void)clickbtnaction:(NSInteger)index
{
    firstDetailViewController *first = [firstDetailViewController new];
    [self transitionwithsubtype:kCATransitionFromRight];
    switch (index) {
        case 1000:
        {
            NSMutableArray *arr = [NSMutableArray new];
            NSMutableArray *arr1 = [NSMutableArray new];
            NSMutableArray *threearr = [NSMutableArray new];
            for (int i = 0; i <61; i++) {
                @autoreleasepool {
                    NSString *filepath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"NK%04d",i] ofType:@"jpg"];
                    [arr addObject:[UIImage imageWithContentsOfFile:filepath]];
                }
                
            }
            for (int i = 0; i <1001; i++) {
                @autoreleasepool {
                     NSString *filepath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%05d",i] ofType:@"jpg"];
                    [arr1 addObject:[UIImage imageWithContentsOfFile:filepath]];
                }
            }
            for (int i = 0; i <6; i++) {
                @autoreleasepool {
                    NSString *filepath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"output0_cube_%d",i] ofType:@"jpg"];
                    [threearr addObject:[UIImage imageWithContentsOfFile:filepath]];
                }
            }
            
            first.firstArray = arr;
            first.secondArray = arr1;
            first.thridArray = threearr;
            first.num = 1;
             [self presentViewController:first animated:NO completion:nil];
        }
            
            break;
        case 1001:
        {
            NSMutableArray *arr = [NSMutableArray new];
            NSMutableArray *arr1 = [NSMutableArray new];
            for (int i = 0; i <61; i++) {
                @autoreleasepool {
                    NSString *filepath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"NK%04d",i] ofType:@"jpg"];
                    [arr addObject:[UIImage imageWithContentsOfFile:filepath]];
                }
                
            }
            for (int i = 0; i <1000; i++) {
                @autoreleasepool {
                    NSString *filepath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"0-%d",i] ofType:@"jpg"];
                    [arr1 addObject:[UIImage imageWithContentsOfFile:filepath]];
                }
            }
            first.firstArray = arr;
            first.secondArray = arr1;
            first.num = 2;
             [self presentViewController:first animated:NO completion:nil];
        }
            
            break;
        case 1002:
        {
            NSMutableArray *arr = [NSMutableArray new];
            for (int i = 0; i <1000; i++) {
                @autoreleasepool {
                    NSString *filepath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"0-%d",i] ofType:@"jpg"];
                    [arr addObject:[UIImage imageWithContentsOfFile:filepath]];
                }
            }
             first.firstArray = arr;
            first.num =3;
             [self presentViewController:first animated:NO completion:nil];
        }
            
            break;
        case 1003:
        {
            otherViewController *other = [otherViewController new];
             [self transitionwithsubtype:kCATransitionFromRight];
            [self presentViewController:other animated:NO completion:nil];
        }
            
            break;
        case 1500:
        {
           
            [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
            self.firstV = [[firstView alloc ] initWithFrame:self.view.bounds backimageStr:@"智能化系统"];
            self.firstV.delegate = self;
            [self.view insertSubview:self.firstV belowSubview:self.bottomImg];
            
        }
            
            break;
        case 1501:
            [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
            self.firstV = [[firstView alloc ] initWithFrame:self.view.bounds backimageStr:@"地下车位"];
            self.firstV.delegate = self;
            [self.view insertSubview:self.firstV belowSubview:self.bottomImg];
            break;
        case 1502:
        {
            [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
            self.secondV = [[secondView alloc] initWithFrame:self.view.bounds imagestr:@"大堂-1" imageArr: @[@"大堂-2",@"大堂-3",@"大堂-4"]];
            self.secondV.delegate = self;
            [self.view insertSubview:self.secondV belowSubview:self.bottomImg];
        }
            
            break;
        case 1503:
            [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
            self.firstV = [[firstView alloc ] initWithFrame:self.view.bounds backimageStr:@"建筑幕墙"];
            self.firstV.delegate = self;
            [self.view insertSubview:self.firstV belowSubview:self.bottomImg];
            
            break;
        case 1504:
            [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
            self.secondV = [[secondView alloc] initWithFrame:self.view.bounds imagestr:@"电梯-1" imageArr: @[@"电梯-2",@"电梯-3"]];
            self.secondV.delegate = self;
            [self.view insertSubview:self.secondV belowSubview:self.bottomImg];
            break;
        case 2000:
            [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
            self.firstV = [[firstView alloc ] initWithFrame:self.view.bounds backimageStr:@"商业配套服务1"];
            self.firstV.delegate = self;
            [self.view insertSubview:self.firstV belowSubview:self.bottomImg];
            break;
        case 2001:
            [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
            self.firstV = [[firstView alloc ] initWithFrame:self.view.bounds backimageStr:@"大堂功能区1"];
            self.firstV.delegate = self;
            [self.view insertSubview:self.firstV belowSubview:self.bottomImg];
            break;
        case 2002:
            [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
            self.firstV = [[firstView alloc ] initWithFrame:self.view.bounds backimageStr:@"10-30层创智总部区1"];
            self.firstV.delegate = self;
            [self.view insertSubview:self.firstV belowSubview:self.bottomImg];
            break;
        case 2003:
            [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
            self.firstV = [[firstView alloc ] initWithFrame:self.view.bounds backimageStr:@"6-9层联合办公区1"];
            self.firstV.delegate = self;
            [self.view insertSubview:self.firstV belowSubview:self.bottomImg];
            break;
         
        default:
            break;
    }
   
   
}
//代理方法
- (void)clickbtnaction
{
   
    [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
    [self.firstV removeFromSuperview];
}
- (void)clicksecondBtnaction
{
    [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
    [self.secondV removeFromSuperview];
}
- (UIButton *)getimageButton:(NSString *)imagestr frame:(CGRect)rect
{
    UIButton *btn = [UIButton  buttonWithType:(UIButtonTypeCustom)];
    [btn setImage:[UIImage imageNamed:imagestr] forState:(UIControlStateNormal)];
    btn.frame = rect;
    return btn;
}

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
#pragma UIView实现动画
- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition
{
    [UIView animateWithDuration:DURATION animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}

@end
