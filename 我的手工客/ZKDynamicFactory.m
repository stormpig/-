//
//  ZKDynamicFactory.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKDynamicFactory.h"
#import "ZKDynamic.h"
#import "ZKDCourse.h"
#import "ZKDCircle.h"
#import "ZKDFollow.h"

@implementation ZKDynamicFactory

+ (ZKDynamic *)dynamicWithDict:(NSDictionary *)dict
{
    NSString *type = dict[@"type"];
    ZKDynamic *dynamic;
    if ([type isEqualToString:@"circle"]) {
        dynamic = [ZKDCircle dynamicWithDict:dict];
    } else if ([type isEqualToString:@"course"]) {
        dynamic = [ZKDCourse dynamicWithDict:dict];
    } else if ([type isEqualToString:@"follow"]) {
        dynamic = [ZKDFollow dynamicWithDict:dict];
    } else {
        NSLog(@"无法识别的类型");
    }
    return dynamic;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"--------------------------%@", key);
}

@end
