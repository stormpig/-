//
//  ZKItem2Cell.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKItem2Cell.h"
#import "UIImageView+AFNetworking.h"

@interface ZKItem2Cell ()

@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;

@end

@implementation ZKItem2Cell


+(id)cellWithTableView:(UITableView *)tableView
{
    NSString *identifier = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:identifier bundle:[NSBundle mainBundle]];
    [tableView registerNib:nib forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

- (void)setItem2:(ZKItem2 *)item2
{
    _item2 = item2;
    [self.picImageView setImageWithURL:[NSURL URLWithString:item2.class_image]];
    self.subjectLabel.text = item2.subject;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
