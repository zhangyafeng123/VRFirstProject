//
//  firstView.m
//  project
//
//  Created by tao shiqiang on 2017/9/12.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//
 
#import "firstView.h"

@implementation firstView

- (instancetype)initWithFrame:(CGRect)frame backimageStr:(NSString *)imagestr;
{
    if ([super initWithFrame:frame]) {
    
        UIImageView *imagev = [[UIImageView alloc] initWithFrame:self.bounds];
        imagev.image = [UIImage imageNamed:imagestr];
        [self addSubview:imagev];
       
        UIButton *btn  = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame = CGRectMake(920, 40, 40, 40);
        btn.backgroundColor = [UIColor clearColor];
        [btn addTarget:self action:@selector(btnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:btn];
        
        
    }
    
    return self;
}
- (void)btnaction:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(clickbtnaction)]) {
        [self.delegate clickbtnaction];
    }
}
@end
