//
//  ZKMessageNoticeController.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKMessageNoticeController.h"

@interface ZKMessageNoticeController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *itemTitles;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ZKMessageNoticeController

#pragma mark - Getter

- (NSArray *)itemTitles
{
    if (_itemTitles == nil) {
        _itemTitles = @[@"quser", @"评论", @"回复", @"@我", @"私信", @"手工圈"];
    }
    return _itemTitles;
}

+ (id)messageNoticeController
{
    return [[self alloc] initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}

#pragma mark - 协议方法UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.itemTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.imageView.image = [UIImage imageNamed:@"weixin"];
        cell.textLabel.text = self.itemTitles[indexPath.row];
        return cell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = self.itemTitles[indexPath.row];
        cell.detailTextLabel.text = @"0";
        cell.detailTextLabel.textColor = [UIColor redColor];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 60.0f;
    }
    return 40.0f;
}

#pragma mark - 其他

- (void)viewDidLoad {
    [super viewDidLoad];
    // 防止没有数据还显示行
    self.tableView.tableFooterView = [UIView new];
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
