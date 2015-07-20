//
//  ZKRootClassController.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKRootClassController.h"
#import "ZKClassController.h"

@interface ZKRootClassController ()

@property (strong, nonatomic) ZKClassController *classController;

@end

@implementation ZKRootClassController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.classController = [ZKClassController classController];
    CGRect frame = self.classController.view.frame;
    frame.origin.y = 73;
    self.classController.view.frame = frame;
    [self.view addSubview:self.classController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
