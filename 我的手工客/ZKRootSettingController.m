//
//  ZKRootSettingController.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKRootSettingController.h"
#import "MenuViewController.h"
#import "ZKMySettingController.h"
#import "ZKMessageNoticeController.h"

@interface ZKRootSettingController ()

@property (strong, nonatomic) MenuViewController *mvc;

@end

@implementation ZKRootSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self preSetting];
    ZKMessageNoticeController *messageNoticeController = [ZKMessageNoticeController messageNoticeController];
    ZKMySettingController *mySettingController = [ZKMySettingController mySettingController];
    self.mvc = [[MenuViewController alloc] initViewControllerWithTitleArray:@[@"消消息通知", @"个人设置"] vcArray:@[messageNoticeController, mySettingController]];
    CGRect eFrame = self.mvc.view.frame;
    eFrame.origin.x = 0;
    eFrame.origin.y = 73;
    self.mvc.view.frame = eFrame;
    [self.view addSubview:self.mvc.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)preSetting
{
    self.navigationController.tabBarItem.image = [[UIImage imageNamed:@"tb_perD"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.tabBarItem.selectedImage = [[UIImage imageNamed:@"tb_perS"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
