//
//  ZKDaren.h
//  我的手工客
//
//  Created by ZengKai on 15/7/16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKBase.h"

@interface ZKLevel : ZKBase

@property (copy, nonatomic) NSString *experience;
@property (copy, nonatomic) NSString *level;
@property (copy, nonatomic) NSString *next_level_need;

@end

@interface ZKDaren : ZKBase

@property (copy, nonatomic) NSString *avatar;
@property (copy, nonatomic) NSString *bg_image;
@property (copy, nonatomic) NSString *circle_collect_count;
@property (copy, nonatomic) NSString *circle_count;
@property (copy, nonatomic) NSString *coursecollect;
@property (copy, nonatomic) NSString *coursecount;
@property (copy, nonatomic) NSString *coursedraft;
@property (copy, nonatomic) NSString *daren;
@property (copy, nonatomic) NSString *fen_num;
@property (copy, nonatomic) NSString *gender;
@property (copy, nonatomic) NSString *guan_num;
@property (copy, nonatomic) NSString *guan_status;
@property (copy, nonatomic) NSString *hand_teacher;
@property (copy, nonatomic) ZKLevel *level;
@property (copy, nonatomic) NSString *region;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *uid;
@property (copy, nonatomic) NSString *uname;

@end
