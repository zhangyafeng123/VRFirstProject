//
//  secondView.h
//  project
//
//  Created by tao shiqiang on 2017/9/13.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol secondViewDeleagate <NSObject>

- (void)clicksecondBtnaction;

@end


@interface secondView : UIView
@property (nonatomic, assign)id<secondViewDeleagate>delegate;

- (instancetype)initWithFrame:(CGRect)frame imagestr:(NSString *)imgstr imageArr:(NSArray *)arr;

@end
