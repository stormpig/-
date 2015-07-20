//
//  ZKDFollowCell.m
//  我的手工客
//
//  Created by ZengKai on 15/7/19.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKDFollowCell.h"

@interface ZKDFollowCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *actionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *fHeadImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLineLabel;
@property (weak, nonatomic) IBOutlet UILabel *fUserNameLabel;

@end

@implementation ZKDFollowCell

#pragma mark - Setter

- (void)setDFollow:(ZKDFollow *)DFollow
{
    [self.headImageView  setImageWithURL:[NSURL URLWithString:DFollow.head_pic]];
    self.headImageView.layer.cornerRadius = self.headImageView.frame.size.width / 2;
    self.headImageView.clipsToBounds = YES;
    self.userNameLabel.text = DFollow.user_name;
    self.actionLabel.text = DFollow.event_action;
    [self.fHeadImageView setImageWithURL:[NSURL URLWithString:DFollow.follow.head_pic]];
    self.timeLineLabel.text = DFollow.timeline;
    self.fUserNameLabel.text = DFollow.follow.user_name;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
