//
//  ZKDFollow.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKDFollow.h"

@implementation ZKDFollow

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"follow"]) {
        self.follow = [ZKDFFollow new];
        [self.follow setValuesForKeysWithDictionary:((NSArray *)value)[0]];
    } else {
        [super setValue:value forKey:key];
    }
}

@end

@implementation ZKDFFollow


@end