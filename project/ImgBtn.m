//
//  ImgBtn.m
//  project
//
//  Created by tao shiqiang on 2017/9/12.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "ImgBtn.h"

@implementation ImgBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame imagestr:(NSString *)imagestr tag:(NSInteger)tag
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.adjustsImageWhenHighlighted = NO;
        btn.tag = tag;
        btn.frame = self.bounds;
        [btn setImage:[UIImage imageNamed:imagestr] forState:(UIControlStateNormal)];
        [btn addTarget:self action:@selector(btnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:btn];
        
    }
    return self;
}
- (void)btnaction:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(clickbtnaction:)]) {
        [self.delegate clickbtnaction:sender.tag];
    }
}

@end
