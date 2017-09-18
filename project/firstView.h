//
//  firstView.h
//  project
//
//  Created by tao shiqiang on 2017/9/12.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol firstViewDelegate <NSObject>

- (void)clickbtnaction;

@end

@interface firstView : UIView
@property (nonatomic, assign)id<firstViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame backimageStr:(NSString *)imagestr;

@end
