//
//  ZKClassController.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKClassController.h"
#import "AFHTTPRequestOperationManager.h"
#import "ZKItem2.h"
#import "ZKItem2Cell.h"
#import "DOPDropDownMenu.h"
// 下拉刷新
#import "MJRefresh.h"

#define URL1 @"http://yuntuapi.amap.com/datasearch/around?center=116.370002,40.037478&filter=line_type%3A2%2Bteacher_tagid%3A5&key=9143eea89b237f972287d8df3361a525&keywords=&limit=10&output=json&page=1&radius=50000&sortrule=_distance:0&tableid=550fa56ce4b050797967f047&ts=1437118311917&scode=61346ee4f1e57c16fd52afa34dea2d9f"

@interface ZKClassController ()<UITableViewDataSource, UITableViewDelegate, DOPDropDownMenuDataSource, DOPDropDownMenuDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSDictionary *data;
@property (strong, nonatomic) NSArray *items;
@property (weak, nonatomic) DOPDropDownMenu *menu;
@property (strong, nonatomic) NSArray *menuTitles;
@property (strong, nonatomic) NSString *url;

@end

@implementation ZKClassController

+ (id)classController
{
    return [[self alloc] initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}

#pragma mark - Getter

- (DOPDropDownMenu *)menu
{
    if (_menu == nil) {
        DOPDropDownMenu *tempMenu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 0) andHeight:40];
        tempMenu.delegate = self;
        tempMenu.dataSource = self;
        _menu = tempMenu;
        [self.view addSubview:tempMenu];
    }
    return _menu;
}

- (NSString *)url
{
    if (_url == nil) {
        _url = @"http://yuntuapi.amap.com/datasearch/around?center=116.370002,40.037478&filter=line_type%3A2%2Bteacher_tagid%3A5&key=9143eea89b237f972287d8df3361a525&keywords=&limit=10&output=json&page=1&radius=50000&sortrule=_distance:0&tableid=550fa56ce4b050797967f047&ts=1437118311917&scode=61346ee4f1e57c16fd52afa34dea2d9f";
    }
    return _url;
}

- (NSArray *)menuTitles
{
    if (_menuTitles == nil) {
        NSArray *m1 = @[@"全部类型", @"绘画书法", @"美食烘焙", @"竹艺木艺术", @"粘土陶艺", @"插花园艺", @"服装饰品", @"美容护肤"];
        NSArray *m2 = @[@"全部课程", @"线下课程", @"线上课程"];
        NSArray *m3 = @[@"最新更新", @"人气", @"好评度", @"免费课", @"价格低到高", @"价格高到低"];
        _menuTitles = @[m1, m2, m3];
    }
    return _menuTitles;
}

#pragma mark - 请求网络数据

- (void)requestData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:self.url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        [dict writeToFile:@"/Users/ms/Desktop/ZKClassController.plist" atomically:YES];
        
        self.data = dict[@"datas"];
        
        NSMutableArray *temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data) {
            ZKItem2 *item2 = [ZKItem2 baseWithDict:dict];
            [temp addObject:item2];
        }
        self.items = temp;
        
        [self.tableView reloadData];
        
        [self.tableView.header endRefreshing];
        [self.tableView.footer endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"网络请求失败");
     }];
}

#pragma mark 协议方法UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZKItem2Cell *cell = [ZKItem2Cell cellWithTableView:tableView];
    cell.item2 = self.items[indexPath.item];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 190.0f;
}

#pragma mark 协议方法DOPDropDownMenuDataSource

- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return self.menuTitles.count;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    NSArray *list = self.menuTitles[column];
    return list.count;
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    NSArray *list = self.menuTitles[indexPath.column];
    return list[indexPath.row];
}


#pragma mark 协议方法DOPDropDownMenuDelegate

- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath
{
    NSString *item = self.menuTitles[indexPath.column][indexPath.row];
    // 由于无法找到 GET 请求组织的规律 暂时假数据
    [self resolveItem:item];
}

#pragma mark - 其他

- (void)resolveItem:(NSString *)item
{
    if ([item isEqualToString:@"全部类型"] || [item isEqualToString:@"全部课程"]) {
        self.url = @"http://yuntuapi.amap.com/datasearch/around?center=116.370002,40.037478&filter=line_type%3A2%2Bteacher_tagid%3A5&key=9143eea89b237f972287d8df3361a525&keywords=&limit=10&output=json&page=1&radius=50000&sortrule=_distance:0&tableid=550fa56ce4b050797967f047&ts=1437118311917&scode=61346ee4f1e57c16fd52afa34dea2d9f";
    } else if ([item isEqualToString:@"绘画书法"]) {
        self.url = @"http://yuntuapi.amap.com/datasearch/local?tableid=550fa56ce4b050797967f047&city=%E5%85%A8%E5%9B%BD&keywords=&filter=line_type%3A1%2Bcity_name%3A%E5%8C%97%E4%BA%AC%2Bteacher_tagid%3A4&sortrule=_createtime%3A0&limit=20&page=1&key=5903bca6ea4b1a2655332d64fb3a328b&ts=1437134287910&scode=cfb413edce7e1dec4a2621815f49b11d";
    } else if ([item isEqualToString:@"线下课程"]) {
        self.url = @"http://yuntuapi.amap.com/datasearch/local?tableid=550fa56ce4b050797967f047&city=%E5%85%A8%E5%9B%BD&keywords=&filter=line_type%3A2%2Bcity_name%3A%E5%8C%97%E4%BA%AC%2Bteacher_tagid%3A4&sortrule=_createtime%3A0&limit=20&page=1&key=5903bca6ea4b1a2655332d64fb3a328b&ts=1437134780718&scode=9d7e0cbfcc35d813f3419559e96222b2";
    
    }
    [self.tableView.header beginRefreshing];
}

#pragma mark - 其他

- (void)viewDidLoad {
    [super viewDidLoad];
    [self preSetting];
    [self requestData];
    // 载入下拉选择框
    [self menu];
}

- (void)preSetting
{
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
