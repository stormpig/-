//
//  ZKTopic.m
//  我的手工客
//
//  Created by ZengKai on 15/7/17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKTopic.h"

@implementation ZKTopic

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.idN = value;
    }
}

@end
