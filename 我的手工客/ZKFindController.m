//
//  ZKFindController.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-15.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKFindController.h"
#import "MenuViewController.h"
#import "ZKEliteController.h"
#import "ZKDynamicController.h"

@interface ZKFindController ()

@property (strong, nonatomic) MenuViewController *mvc;

@end

@implementation ZKFindController

#pragma mark - Getter

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self preSetting];
    ZKEliteController *eliteController = [ZKEliteController eliteController];
    ZKDynamicController *dynamicController = [ZKDynamicController dynamicController];
    self.mvc = [[MenuViewController alloc] initViewControllerWithTitleArray:@[@"精选", @"动态"] vcArray:@[eliteController, dynamicController]];
    CGRect eFrame = self.mvc.view.frame;
    eFrame.origin.x = 0;
    eFrame.origin.y = 73;
    self.mvc.view.frame = eFrame;
    [self.view addSubview:self.mvc.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
//     Dispose of any resources that can be recreated.
}

- (void)preSetting
{
    self.navigationController.tabBarItem.image = [[UIImage imageNamed:@"tb_findD"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.tabBarItem.selectedImage = [[UIImage imageNamed:@"tb_findS"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
