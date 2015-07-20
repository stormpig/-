//
//  ZKDCircle.h
//  我的手工客
//
//  Created by 曾凯 on 15-7-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKDynamic.h"

@interface ZKDCCircle : NSObject

@property (copy, nonatomic) NSString *circle_id;
@property (copy, nonatomic) NSString *head_pic;
@property (copy, nonatomic) NSString *host_pic;
@property (copy, nonatomic) NSString *i_type;
@property (copy, nonatomic) NSString *message;
@property (copy, nonatomic) NSString *username;

@end

@interface ZKDCircle : ZKDynamic

// circle 在手工圈赞了
@property (strong, nonatomic) ZKDCCircle *circle;

@end
