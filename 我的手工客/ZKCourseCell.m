//
//  ZKCourseCell.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKCourseCell.h"

@interface ZKCourseCell ()

@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;
@property (weak, nonatomic) IBOutlet UIImageView *avtarImageView;
@property (weak, nonatomic) IBOutlet UIImageView *darenImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ZKCourseCell

- (void)setCourse:(ZKCourse *)course
{
    _course = course;
    [self.picImageView setImageWithURL:[NSURL URLWithString:course.host_pic]];
    self.subjectLabel.text = course.subject;
    [self.avtarImageView setImageWithURL:[NSURL URLWithString:course.avatar]];
    self.avtarImageView.layer.cornerRadius = self.avtarImageView.frame.size.width / 2;
    self.avtarImageView.clipsToBounds = YES;
    CGRect nFrame = self.nameLabel.frame;
#warning 计算Label的位置还存在问题
    if ([course.is_daren isEqualToString:@"1"]) {
        self.darenImageView.image = [UIImage imageNamed:@"userIdentifer"];
        nFrame.origin.x  = CGRectGetMaxX(self.darenImageView.frame) + 5;
    } else {
        nFrame.origin.x  = CGRectGetMaxX(self.avtarImageView.frame) + 5;
        self.darenImageView.image = nil;
    }
    NSLog(@"%@", NSStringFromCGRect(nFrame));
    self.nameLabel.frame = nFrame;
    self.nameLabel.text = course.user_name;
}

- (void)awakeFromNib {
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

@end
