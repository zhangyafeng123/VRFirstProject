//
//  leftView.m
//  project
//
//  Created by tao shiqiang on 2017/9/12.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "leftView.h"

@implementation leftView
- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:self.bounds];
        image.userInteractionEnabled = YES;
        image.image = [UIImage imageNamed:@"项目概况底"];
        [self addSubview:image];
        UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(25, 120, self.frame.size.width - 60, self.frame.size.height - 130)];
        scrollview.contentSize = CGSizeMake(self.frame.size.width - 60, 800);
        scrollview.scrollEnabled = YES;
        scrollview.showsHorizontalScrollIndicator = NO;
        scrollview.showsVerticalScrollIndicator = NO;
        [image addSubview:scrollview];
        UIImageView *imagev= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 60, 800)];
        imagev.userInteractionEnabled = YES;
        imagev.image = [UIImage imageNamed:@"文字"];
        [scrollview addSubview:imagev];
        
    }
    return self;
}

@end
