//
//  ZKDCourse.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKDCourse.h"˜



@implementation ZKDCCourse


+ (id)DCCourseWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //
}

@end

@implementation ZKDCourse

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"course"]) {
        self.course = [ZKDCCourse DCCourseWithDict:((NSArray *)value)[0]];
    } else {
        [super setValue:value forKey:key];
    }
}

@end