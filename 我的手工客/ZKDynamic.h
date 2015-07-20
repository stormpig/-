//
//  ZKDynamic.h
//  我的手工客
//
//  Created by 曾凯 on 15-7-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKDynamic : NSObject

@property (copy, nonatomic) NSString *event_action;
@property (copy, nonatomic) NSString *event_message;
@property (copy, nonatomic) NSString *hand_daren;
@property (copy, nonatomic) NSString *head_pic;
@property (copy, nonatomic) NSString *level;
@property (copy, nonatomic) NSString *msgtoid;
@property (copy, nonatomic) NSString *pmid;
@property (copy, nonatomic) NSString *scores;
@property (copy, nonatomic) NSString *timeline;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *user_id;
@property (copy, nonatomic) NSString *user_name;

+ (id)dynamicWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end
