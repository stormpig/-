//
//  ZKDCourse.h
//  我的手工客
//
//  Created by 曾凯 on 15-7-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKDynamic.h"

@interface ZKDCCourse : NSObject

@property (copy, nonatomic) NSString *hand_id;
@property (copy, nonatomic) NSString *head_pic;
@property (copy, nonatomic) NSString *host_pic;
@property (copy, nonatomic) NSString *user_name;
@property (assign, nonatomic) BOOL visible;
@property (copy, nonatomic) NSString *zhuti;

+ (id)DCCourseWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end

@interface ZKDCourse : ZKDynamic

// course 赞了教程 | 收藏了教程
@property (retain, nonatomic) ZKDCCourse *course;

@end
