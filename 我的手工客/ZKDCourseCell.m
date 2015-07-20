//
//  ZKDCourseCell.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKDCourseCell.h"

@interface ZKDCourseCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *actionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cHeadImageView;
@property (weak, nonatomic) IBOutlet UIImageView *cHostImageView;
@property (weak, nonatomic) IBOutlet UILabel *cZhutiLabel;
@property (weak, nonatomic) IBOutlet UILabel *cUserNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLineLabel;

@end

@implementation ZKDCourseCell

- (void)setDCourse:(ZKDCourse *)dCourse
{
    [self.headImageView  setImageWithURL:[NSURL URLWithString:dCourse.head_pic]];
    self.headImageView.layer.cornerRadius = self.headImageView.frame.size.width / 2;
    self.headImageView.clipsToBounds = YES;
    self.userNameLabel.text = dCourse.user_name;
    self.actionLabel.text = dCourse.event_action;
    [self.cHeadImageView  setImageWithURL:[NSURL URLWithString:dCourse.course.head_pic]];
    self.cZhutiLabel.text = dCourse.course.zhuti;
    self.cUserNameLabel.text = dCourse.course.user_name;
    self.timeLineLabel.text = dCourse.timeline;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
