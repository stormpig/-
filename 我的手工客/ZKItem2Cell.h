//
//  ZKItem2Cell.h
//  我的手工客
//
//  Created by 曾凯 on 15-7-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKItem2.h"

@interface ZKItem2Cell : UITableViewCell

@property (strong, nonatomic) ZKItem2 *item2;

+(id)cellWithTableView:(UITableView *)tableView;

@end
