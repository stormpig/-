//
//  ZKClassCell.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKClassCell.h"

@interface ZKClassCell ()

@property (weak, nonatomic) IBOutlet UIImageView *classImageView;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;

@end

@implementation ZKClassCell

- (void)setClassN:(ZKClass *)classN
{
    _classN = classN;
    [self.classImageView setImageWithURL:[NSURL URLWithString:classN.host_pic]];
    self.classLabel.text = classN.subject;
}

- (void)awakeFromNib {
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

@end
