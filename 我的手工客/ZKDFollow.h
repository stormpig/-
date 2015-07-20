//
//  ZKDFollow.h
//  我的手工客
//
//  Created by 曾凯 on 15-7-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKDynamic.h"

@class ZKDFFollow;

@interface ZKDFollow : ZKDynamic

// follow 关注了

#warning 测试一个问题 暂时做出的修改

//@property (strong, nonatomic) ZKDFFollow *follow;
@property (strong, nonatomic) ZKDFFollow *follow;
@property (copy, nonatomic) NSString *to_next;

@end

@interface ZKDFFollow : NSObject

@property (copy, nonatomic) NSString *follow_status;
@property (copy, nonatomic) NSString *hand_daren;
@property (copy, nonatomic) NSString *head_pic;
@property (copy, nonatomic) NSString *level;
@property (copy, nonatomic) NSString *scores;
@property (copy, nonatomic) NSString *user_id;
@property (copy, nonatomic) NSString *user_name;

@end

