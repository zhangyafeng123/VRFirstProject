//
//  secondView.m
//  project
//
//  Created by tao shiqiang on 2017/9/13.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "secondView.h"


@interface secondView ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIPageControl *pageC;
@end



@implementation secondView

- (instancetype)initWithFrame:(CGRect)frame imagestr:(NSString *)imgstr imageArr:(NSArray *)arr
{
    if ([super initWithFrame:frame]) {
    
        
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:frame];
        imageV.image = [UIImage imageNamed:imgstr];
        imageV.userInteractionEnabled = YES;
        [self addSubview:imageV];
        
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame  = CGRectMake(frame.size.width - 110, 40, 50, 50);
        [btn addTarget:self action:@selector(btnaction) forControlEvents:(UIControlEventTouchUpInside)];
        [imageV addSubview:btn];
       
        
        UIScrollView *scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(110, 50, frame.size.width - 220, 500)];
        scrollV.delegate  = self;
        scrollV.pagingEnabled = YES;
        scrollV.contentSize = CGSizeMake(arr.count * (frame.size.width - 220), 500);
        [imageV addSubview:scrollV];
        
        for (int i = 0; i < arr.count; i++) {
            UIImageView *imagesubV = [[UIImageView alloc] initWithFrame:CGRectMake(i * (frame.size.width - 220), 0, frame.size.width - 220, 500)];
            imagesubV.userInteractionEnabled= YES;
            imagesubV.image = [UIImage imageNamed:arr[i]];
            [scrollV addSubview:imagesubV];
        }
        self.pageC = [[UIPageControl alloc] initWithFrame:CGRectMake(frame.size.width/2 - 50, 70, 100, 20)];
        self.pageC.numberOfPages = arr.count;
        self.pageC.tintColor = [UIColor redColor];
        [self addSubview:self.pageC];
        [self bringSubviewToFront:self.pageC];
    }
    return self;
}

- (void)btnaction
{
    if ([self.delegate respondsToSelector:@selector(clicksecondBtnaction)]) {
        [self.delegate clicksecondBtnaction];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.contentOffset.x;
    NSInteger i = y / scrollView.frame.size.width;
    self.pageC.currentPage = i;
    
}

@end
