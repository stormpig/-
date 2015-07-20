//
//  ZKSlideCell.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKSlideCell.h"
#import "ZKSlide.h"
#import "UIImageView+AFNetworking.h"
#import "ZKNav.h"
#import "ZKAdv.h"

@interface ZKSlideCell ()

@property (weak, nonatomic) IBOutlet UIScrollView *sliderScrollView;

@property (weak, nonatomic) IBOutlet UIImageView *navImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *navImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *navImageView3;
@property (weak, nonatomic) IBOutlet UIImageView *navImageView4;

@property (weak, nonatomic) IBOutlet UILabel *navLabel1;
@property (weak, nonatomic) IBOutlet UILabel *navLabel2;
@property (weak, nonatomic) IBOutlet UILabel *navLabel3;
@property (weak, nonatomic) IBOutlet UILabel *navLabel4;

@property (weak, nonatomic) IBOutlet UIImageView *advImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *advImageView2;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ZKSlideCell

#pragma mark - Getter

- (NSTimer *)timer
{
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changePic) userInfo:nil repeats:YES];
    }
    return _timer;
}

#pragma mark - Setter

- (void)setSlides:(NSArray *)slides
{
    _slides = slides;
    //    setImageWithURL:[NSURL URLWithString:model.iconUrl]];
    CGFloat pWidth = self.sliderScrollView.frame.size.width;
    CGFloat pHeight = self.sliderScrollView.frame.size.height;
    int i;
    for (i = 0; i < slides.count; i++) {
        ZKSlide *slide = slides[i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * pWidth, 0, pWidth, pHeight)];
        [imageView setImageWithURL:[NSURL URLWithString:slide.host_pic]];
        [self.sliderScrollView addSubview:imageView];
    }
    self.sliderScrollView.contentSize = CGSizeMake(pWidth * i, pHeight);
    // 启动定时器
    [self timer];
}

- (void)setNavs:(NSArray *)navs
{
    _navs = navs;
    NSArray *navImageViews = @[self.navImageView1, self.navImageView2, self.navImageView3, self.navImageView4];
    NSArray *navLabels = @[self.navLabel1, self.navLabel2, self.navLabel3, self.navLabel4];
    for (int i = 0; i < 4; i++) {
        ZKNav *nav = navs[i];
        [(UIImageView *)navImageViews[i] setImageWithURL:[NSURL URLWithString:nav.host_pic]];
        ((UILabel *)navLabels[i]).text = nav.subject;
    }
}

- (void)changePic
{
    CGPoint offset = self.sliderScrollView.contentOffset;
    offset.x += 375;
    offset.x  = (NSInteger)offset.x % (375 * (self.slides.count - 1));
    if (offset.x == 0) {
        self.sliderScrollView.contentOffset = offset;
    } else {
        [UIView animateWithDuration:1 animations:^{
            self.sliderScrollView.contentOffset = offset;
        }];
    }
}

- (void)setAdvs:(NSArray *)advs
{
    _advs = advs;
    [self.advImageView1 setImageWithURL:[NSURL URLWithString:((ZKAdv *)advs[0]).ad_img]];
    [self.advImageView2 setImageWithURL:[NSURL URLWithString:((ZKAdv *)advs[1]).ad_img]];
}

- (void)awakeFromNib {
    // Initialization code
}

@end
