//
//  ZKDCircle.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKDCircle.h"

@implementation ZKDCCircle

@end

@implementation ZKDCircle

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"circle"]) {
        self.circle = [ZKDCCircle new];
        [self.circle setValuesForKeysWithDictionary:((NSArray *)value)[0]];
    } else {
        [super setValue:value forKey:key];
    }
}

@end
