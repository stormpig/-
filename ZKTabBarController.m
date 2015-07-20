//
//  ZKTabBarController.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-15.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKTabBarController.h"

@interface ZKTabBarController ()

@end


@implementation ZKTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self preSetting];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)preSetting
{
    self.tabBar.tintColor = [UIColor redColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
