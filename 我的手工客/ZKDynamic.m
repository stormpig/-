//
//  ZKDynamic.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKDynamic.h"

@implementation ZKDynamic

+ (id)dynamicWithDict:(NSDictionary *)dict
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
    NSLog(@"出现键值不匹配的情况！");
}

@end
