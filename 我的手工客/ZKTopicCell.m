//
//  ZKTopicCell.m
//  我的手工客
//
//  Created by ZengKai on 15/7/17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKTopicCell.h"

@interface ZKTopicCell ()

@property (weak, nonatomic) IBOutlet UIImageView *picImageView0;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView3;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView4;
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;

@end

@implementation ZKTopicCell

- (void)setTopic:(ZKTopic *)topic
{
    _topic = topic;
    NSArray *pices = @[self.picImageView0, self.picImageView1, self.picImageView2, self.picImageView3, self.picImageView4];
    int i = 0;
    for (NSString *picURL in topic.pic) {
        [(UIImageView *)pices[i++] setImageWithURL:[NSURL URLWithString:picURL]];
    }
    self.subjectLabel.text = topic.subject;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
