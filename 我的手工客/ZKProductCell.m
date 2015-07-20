//
//  ZKProductCell.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKProductCell.h"

@interface ZKProductCell ()

@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;

@end

@implementation ZKProductCell

- (void)setProduct:(ZKProduct *)product
{
    _product = product;
    [self.picImageView setImageWithURL:[NSURL URLWithString:product.host_pic]];
    self.subjectLabel.text = product.subject;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
