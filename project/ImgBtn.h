//
//  ImgBtn.h
//  project
//
//  Created by tao shiqiang on 2017/9/12.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImgBtnDelegate <NSObject>

- (void)clickbtnaction:(NSInteger)index;

@end

@interface ImgBtn : UIView
@property (nonatomic, assign)id<ImgBtnDelegate>delegate;
- (instancetype)initWithFrame:(CGRect)frame imagestr:(NSString *)imagestr tag:(NSInteger)tag;

@end
