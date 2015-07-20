//
//  ZKDCricleCell.m
//  我的手工客
//
//  Created by ZengKai on 15/7/19.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKDCricleCell.h"

@interface ZKDCricleCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *actionLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cHeadImageView;
@property (weak, nonatomic) IBOutlet UIImageView *cHostImageView;
@property (weak, nonatomic) IBOutlet UILabel *cMessage;
@property (weak, nonatomic) IBOutlet UILabel *cUserNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLineLabel;

@end

@implementation ZKDCricleCell

- (void)setDCirrle:(ZKDCircle *)dCirrle
{
    [self.headImageView  setImageWithURL:[NSURL URLWithString:dCirrle.head_pic]];
    self.headImageView.layer.cornerRadius = self.headImageView.frame.size.width / 2;
    self.headImageView.clipsToBounds = YES;
    self.userNameLabel.text = dCirrle.user_name;
    self.actionLabel.text = dCirrle.event_action;
    self.messageLabel.text = dCirrle.event_message;
    [self.cHeadImageView  setImageWithURL:[NSURL URLWithString:dCirrle.circle.head_pic]];
    self.cMessage.text = dCirrle.circle.message;
    self.cUserNameLabel.text = dCirrle.circle.username;
    self.timeLineLabel.text = dCirrle.timeline;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
