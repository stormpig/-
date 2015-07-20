//
//  ZKEliteController.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKEliteController.h"
#import "ZKSlideCell.h"
#import "ZKSlide.h"
#import "ZKNav.h"
#import "ZKAdv.h"
#import "AFHTTPRequestOperationManager.h"
#import "ZKClass.h"
#import "ZKClassCell.h"
#import "ZKSectionHeader.h"
#import "ZKProduct.h"
#import "ZKProductCell.h"
#import "ZKDaren.h"
#import "ZKDarenCell.h"
#import "ZKTopic.h"
#import "ZKTopicCell.h"
#import "ZKCourse.h"
#import "ZKCourseCell.h"

// 下拉刷新
#import "MJRefresh.h"

#define URL1 @"http://m.shougongke.com/index.php?&c=index&a=indexnew&vid=9&"


@interface ZKEliteController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSDictionary *data;
@property (strong, nonatomic) NSArray *slides;
@property (strong, nonatomic) NSArray *navs;
@property (strong, nonatomic) NSArray *advs;
@property (strong, nonatomic) NSArray *classNes;
@property (strong, nonatomic) NSArray *sectionTitle;
@property (strong, nonatomic) NSArray *products;
@property (strong, nonatomic) ZKDaren *daren;
@property (strong, nonatomic) NSArray *topices;
@property (strong, nonatomic) NSArray *courses;

@end

@implementation ZKEliteController

#pragma mark - Getter

+ (ZKEliteController *)eliteController
{
    return [[self alloc] initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}

- (NSArray *)sectionTitle
{
    return @[@"头视图",@"互动课堂", @"限时抢购", @"达人推荐", @"手工专题", @"热门教程",@"其他"];
}

#pragma mark - 请求网络数据

- (void)requestData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:URL1 parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [dict writeToFile:@"/Users/ms/Desktop/ZKEliteController.plist" atomically:YES];
        self.data = dict[@"data"];
        
        NSMutableArray *temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data[@"slide"]) {
            ZKSlide *slide = [ZKSlide baseWithDict:dict];
            [temp addObject:slide];
        }
        self.slides = temp;
        
        temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data[@"nav"]) {
            ZKNav *slide = [ZKNav baseWithDict:dict];
            [temp addObject:slide];
        }
        self.navs = temp;
        
        temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data[@"adv"]) {
            ZKAdv *adv = [ZKAdv baseWithDict:dict];
            [temp addObject:adv];
        }
        self.advs = temp;
        
        temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data[@"classs"]) {
            ZKClass *classN = [ZKClass baseWithDict:dict];
            [temp addObject:classN];
        }
        self.classNes = temp;
        
        temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data[@"products"]) {
            ZKClass *product = [ZKClass baseWithDict:dict];
            [temp addObject:product];
        }
        self.products = temp;
        
        self.daren = [ZKDaren baseWithDict:self.data[@"daren"]];
        
        temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data[@"topic"]) {
            ZKTopic *topic = [ZKTopic baseWithDict:dict];
            [temp addObject:topic];
        }
        self.topices = temp;
        
        temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data[@"course"]) {
            ZKCourse *course = [ZKCourse baseWithDict:dict];
            [temp addObject:course];
        }
        self.courses = temp;
        
        [self.collectionView reloadData];
        
        [self.collectionView.header endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"网络请求失败");
     }];
}

#pragma mark 协议方法UICollectionViewDataSource

// section 的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 6;
}

// item 的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return self.classNes.count;
    } else if (section == 2) {
        return 1;
    } else if (section == 3) {
        return 1;
    } else if (section == 4) {
        return 2;
    } else if (section == 5) {
        return self.courses.count;
    }
    return 1;
}

// 返回定制 cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        ZKSlideCell *cell = [ZKSlideCell cellWithCollectionView:collectionView indexPath:indexPath];
        cell.slides = self.slides;
        cell.navs = self.navs;
        cell.advs = self.advs;
        return cell;
    } else if (indexPath.section == 1) {
        ZKClassCell *cell = [ZKClassCell cellWithCollectionView:collectionView indexPath:indexPath];
        cell.classN= self.classNes[indexPath.item];
        return cell;
    } else if (indexPath.section == 2) {
        ZKProductCell *cell = [ZKProductCell cellWithCollectionView:collectionView indexPath:indexPath];
        cell.product = self.products[3];
        return cell;
    } else if (indexPath.section == 3) {
        ZKDarenCell *cell = [ZKDarenCell cellWithCollectionView:collectionView indexPath:indexPath];
        cell.daren = self.daren;
        return cell;
    } else if (indexPath.section == 4) {
        ZKTopicCell *cell = [ZKTopicCell cellWithCollectionView:collectionView indexPath:indexPath];
        cell.topic = self.topices[indexPath.item];
        return cell;
    } else if (indexPath.section == 5) {
        ZKCourseCell *cell = [ZKCourseCell cellWithCollectionView:collectionView indexPath:indexPath];
        cell.course = self.courses[indexPath.item];
        return cell;
        
    }
    return nil;
}

// 定制 sectionHeader
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section != 0 && [kind isEqualToString:UICollectionElementKindSectionHeader]) {
        ZKSectionHeader *header = [ZKSectionHeader cellWithCollectionView:collectionView indexPath:indexPath];
        header.title = self.sectionTitle[indexPath.section];
        return header;
    }
    return nil;
}

#pragma mark 协议方法UICollectionViewDelegateFlowLayout

// cell 大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(375, 366);
    } else if (indexPath.section == 1) {
        return CGSizeMake(180, 135);
    } else if (indexPath.section == 2) {
        return CGSizeMake(365, 180);
    } else if (indexPath.section == 3) {
        return CGSizeMake(365, 200);
    } else if (indexPath.section == 4) {
        return CGSizeMake(365, 221);
    } else if (indexPath.section == 5) {
        return CGSizeMake(180, 149);
    }
    return CGSizeMake(365, 180);
}

// sectionHeader 大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeZero;
    }
    return CGSizeMake(375, 35);
//    return CGSizeZero;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 其他

- (void)viewDidLoad {
    [super viewDidLoad];
    [self preSetting];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self requestData];
}

- (void)preSetting
{
    // 下拉刷新
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
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
