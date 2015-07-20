//
//  ZKFindTopToolView.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-15.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKFindTopToolView.h"

@implementation ZKFindTopToolView

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    NSLog(@"willMoveToSuperview");
    [self.leftButton setBackgroundImage:[UIImage imageNamed:@"pp_about_step"] forState:UIControlStateNormal];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
