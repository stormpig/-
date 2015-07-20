//
//  ZKCourseController.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKCourseController.h"
#import "AFHTTPRequestOperationManager.h"
#import "ZKItemCell.h"
#import "ZKItem.h"
#import "DOPDropDownMenu.h"

// 下拉刷新
#import "MJRefresh.h"

#define URL1 @"http://m.shougongke.com/index.php?&c=Course&a=newCourseList&cate_id=%@&gcate=cate&order=%@&pub_time=%@&last_id=%@"
@interface ZKCourseController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, DOPDropDownMenuDataSource, DOPDropDownMenuDelegate>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSDictionary *data;
@property (strong, nonatomic) NSMutableArray *items;
@property (weak, nonatomic) DOPDropDownMenu *menu;
@property (strong, nonatomic) NSArray *menuTitles;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *cate_id;
@property (strong, nonatomic) NSString *pubTime;
@property (strong, nonatomic) NSString *order;
@property (strong, nonatomic) NSString *last_id;



@end

@implementation ZKCourseController

+ (id)courseController
{
    return [[self alloc] initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}

#pragma mark - Getter

- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray new];
    }
    return _items;
}


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
        _url = @"http://m.shougongke.com/index.php?&c=Course&a=newCourseList&order=hot";
    }
    return _url;
}

- (NSArray *)menuTitles
{
    if (_menuTitles == nil) {
        NSArray *m1 = @[@"全部分类", @"美食园艺", @"旧物改造", @"美容护肤", @"手工布艺", @"手工皮具", @"折纸剪纸"];
        NSArray *m2 = @[@"一周", @"一月", @"全部教程"];
        NSArray *m3 = @[@"最热教程", @"最新更新", @"评论最多", @"收藏最多", @"材料包有售", @"成品有售"];
        _menuTitles = @[m1, m2, m3];
    }
    return _menuTitles;
}

#pragma mark - 请求网络数据

- (void)requestData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *URL = [NSString stringWithFormat:URL1, self.cate_id, self.order, self.pubTime, self.last_id];
    
    NSLog(@"URL: %@", URL);
    
    [manager GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //        [dict writeToFile:@"/Users/ms/Desktop/ZKCourseController.plist" atomically:YES];
        
        self.data = dict[@"data"];
        
        NSMutableArray *temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data) {
            ZKItem *item = [ZKItem baseWithDict:dict];
            [temp addObject:item];
        }
        [self.items addObjectsFromArray:temp];
        self.last_id = [NSString stringWithFormat:@"%tu", self.items.count];
        [self.collectionView reloadData];
        [self.collectionView.header endRefreshing];
        [self.collectionView.footer endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"网络请求失败");
     }];
}

#pragma mark 协议方法UICollectionViewDataSource

// item 的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

// 返回定制 cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZKItemCell *cell = [ZKItemCell cellWithCollectionView:collectionView indexPath:indexPath];
    cell.item = self.items[indexPath.item];
    return cell;
}

#pragma mark 协议方法UICollectionViewDelegateFlowLayout


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
    if ([item isEqualToString:@"全部分类"]) {
        self.cate_id = @"0";
    } else if ([item isEqualToString:@"美食园艺"]) {
        self.cate_id = @"1";
    } else if ([item isEqualToString:@"旧物改造"]) {
        self.cate_id = @"3";
    } else if ([item isEqualToString:@"美容护肤"]) {
        self.cate_id = @"27";
    } else if ([item isEqualToString:@"手工布艺"]) {
        self.cate_id = @"41";
    } else if ([item isEqualToString:@"手工皮具"]) {
        self.cate_id = @"52";
    } else if ([item isEqualToString:@"折纸剪纸"]) {
        self.cate_id = @"59";
    } else if ([item isEqualToString:@"一周"]) {
        self.pubTime = @"week";
    } else if ([item isEqualToString:@"一月"]) {
        self.pubTime = @"month";
    } else if ([item isEqualToString:@"最热教程"]) {
        self.order = @"hot";
    } else if ([item isEqualToString:@"最新更新"]) {
        self.order = @"new";
    } else if ([item isEqualToString:@"评论最多"]) {
        self.pubTime = @"comment";
    } else if ([item isEqualToString:@"收藏最多"]) {
        self.pubTime = @"collect";
    } else if ([item isEqualToString:@"材料包有售"]) {
        self.pubTime = @"material";
    } else if ([item isEqualToString:@"成品有售"]) {
        self.pubTime = @"goods";
    }
    [self.collectionView.header beginRefreshing];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self preSetting];
    [self requestData];
    // 载入下拉多选框
    [self menu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self preSetting];
}

- (void)preSetting
{
    self.navigationController.tabBarItem.image = [[UIImage imageNamed:@"tb_teachD"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.tabBarItem.selectedImage = [[UIImage imageNamed:@"tb_teachS"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 预设查询条件
    self.last_id = 0;
    self.cate_id = 0;
    self.pubTime= @"week";
    self.order = @"hot";
    
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.items removeAllObjects];
        self.last_id = 0;
        [self requestData];
    }];
    
    // 上拉刷新
    self.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self requestData];
    }];
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
