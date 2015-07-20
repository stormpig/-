//
//  ZKDarenCell.m
//  我的手工客
//
//  Created by ZengKai on 15/7/16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKDarenCell.h"
#import "UIImage+ResizeImage.h"

@interface ZKDarenCell ()

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *unameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *genderImageView;
@property (weak, nonatomic) IBOutlet UILabel *regionLabel;
@property (weak, nonatomic) IBOutlet UILabel *coursecountLabel;
@property (weak, nonatomic) IBOutlet UILabel *fen_numLabel;
@property (weak, nonatomic) IBOutlet UILabel *circle_countLabel;
@property (weak, nonatomic) IBOutlet UIButton *guan_statusButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *guanIndicator;

@end

@implementation ZKDarenCell

- (void)setDaren:(ZKDaren *)daren
{
    _daren = daren;
    [self.bgImageView setImageWithURL:[NSURL URLWithString:daren.bg_image]];
    [self.avatarImageView setImageWithURL:[NSURL URLWithString:daren.avatar]];
    self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.width / 2;
    self.avatarImageView.layer.borderWidth = 2.0f;
    self.avatarImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.avatarImageView.clipsToBounds = YES;
    self.unameLabel.text = daren.uname;
//    self.genderImageView
    self.regionLabel.text = daren.region;
    self.coursecountLabel.text = daren.coursecount;
    self.fen_numLabel.text = daren.fen_num;
    self.circle_countLabel.text = daren.circle_count;
    [self.guan_statusButton setBackgroundImage:[UIImage resizableImageNamed:@"ws_photo_unselected"] forState:UIControlStateNormal];
    self.guan_statusButton.tintColor = [UIColor whiteColor];
}

#pragma mark - 事件响应方法

- (IBAction)guanButtonClick:(id)sender {
    UIButton *button = sender;
    static NSInteger i = 0;
    [button setTitle:@"" forState:UIControlStateNormal];
    [self.guanIndicator startAnimating];
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 1);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [self.guanIndicator stopAnimating];
        if ((i++ % 2) == 0) {
            [button setTitle:@"已关注" forState:UIControlStateNormal];
        } else {
            [button setTitle:@"关注" forState:UIControlStateNormal];
        }
    });
}


- (void)awakeFromNib {
    // Initialization code
}

@end
