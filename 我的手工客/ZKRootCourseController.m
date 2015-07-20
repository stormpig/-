//
//  ZKRootCourseController.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKRootCourseController.h"
#import "ZKCourseController.h"

@interface ZKRootCourseController ()

@property (strong, nonatomic) ZKCourseController *cousreController;

@end

@implementation ZKRootCourseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cousreController = [ZKCourseController courseController];
    CGRect frame = self.cousreController.view.frame;
    frame.origin.y = 73;
    self.cousreController.view.frame = frame;
    [self.view addSubview:self.cousreController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
