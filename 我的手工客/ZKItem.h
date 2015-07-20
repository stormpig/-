//
//  ZKItem.h
//  我的手工客
//
//  Created by 曾凯 on 15-7-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKBase.h"

@interface ZKShopping : ZKBase

@end

@interface ZKItem : ZKBase

@property (copy, nonatomic) NSString *bg_color;
@property (copy, nonatomic) NSString *collect;
@property (copy, nonatomic) NSString *hand_id;
@property (copy, nonatomic) NSString *host_pic;
@property (copy, nonatomic) NSString *host_pic_color;
@property (copy, nonatomic) NSString *last_id;
@property (copy, nonatomic) ZKShopping *shopping;
@property (copy, nonatomic) NSString *subject;
@property (copy, nonatomic) NSString *user_id;
@property (copy, nonatomic) NSString *user_name;
@property (copy, nonatomic) NSString *view;

@end
