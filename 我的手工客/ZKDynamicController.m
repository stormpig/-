//
//  ZKDynamicController.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKDynamicController.h"
#import "AFHTTPRequestOperationManager.h"
#import "ZKDynamicFactory.h"
#import "MJRefresh.h"
#import "ZKDCourseCell.h"
#import "ZKDCricleCell.h"
#import "ZKDFollowCell.h"

#define URL1 @"http://d.shougongke.com/index.php?c=Mobnotice&a=dynami&"

@interface ZKDynamicController ()

@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) NSMutableArray *dynamices;

@end

@implementation ZKDynamicController

+ (ZKDynamicController *)dynamicController
{
    return [[self alloc] initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}

#pragma mark - Getter

- (NSMutableArray *)dynamices
{
    if (_dynamices == nil) {
        _dynamices = [NSMutableArray new];
    }
    return _dynamices;
}

#pragma mark - 请求网络数据

- (void)requestData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:URL1 parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //        [dict writeToFile:@"/Users/ms/Desktop/ZKDynamicController.plist" atomically:YES];
                [dict writeToFile:@"/Users/zengkai/Desktop/ZKDynamicController.plist" atomically:YES];
        self.data = dict[@"data"];
        NSMutableArray *temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data) {
            ZKDynamic *dynamic = [ZKDynamicFactory dynamicWithDict:dict];
            [temp addObject:dynamic];
        }
        [self.dynamices addObjectsFromArray:temp];
        
        if (self.dynamices.count > 0) {
            [self.tableView reloadData];
        }
        [self.tableView.header endRefreshing];
        [self.tableView.footer endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"网络请求失败");
     }];
}



#pragma mark - 其他

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self preSetting];
    [self.tableView.header beginRefreshing];
}

- (void)preSetting
{
    // 下拉刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.dynamices removeAllObjects];
        [self requestData];
    }];
    
    // 上拉刷新
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self requestData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dynamices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if([self.dynamices[indexPath.row] isKindOfClass:[ZKDCourse class]]) {
        ZKDCourseCell *cell = [ZKDCourseCell DBaseCellWithTableView:tableView];
        cell.dCourse = self.dynamices[indexPath.row];
        return cell;
    } else if ([self.dynamices[indexPath.row] isKindOfClass:[ZKDCircle class]]) {
        ZKDCricleCell *cell = [ZKDCricleCell DBaseCellWithTableView:tableView];
        cell.dCirrle = self.dynamices[indexPath.row];
        return cell;
    } else if ([self.dynamices[indexPath.row] isKindOfClass:[ZKDFollow class]]) {
        ZKDFollowCell *cell = [ZKDFollowCell DBaseCellWithTableView:tableView];
        cell.DFollow = self.dynamices[indexPath.row];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 183.0f;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
