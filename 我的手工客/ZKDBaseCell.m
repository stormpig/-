//
//  ZKDBaseCell.m
//  我的手工客
//
//  Created by ZengKai on 15/7/19.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKDBaseCell.h"

@implementation ZKDBaseCell

+ (id)DBaseCellWithTableView:(UITableView *)tableView
{
    NSString *identifier = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:identifier bundle:[NSBundle mainBundle]];
    [tableView registerNib:nib forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
