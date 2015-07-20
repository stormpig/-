//
//  ZKBase.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKBase.h"

@implementation ZKBase

+ (ZKBase *)baseWithDict:(NSDictionary *)dict
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
    NSLog(@"ZKBase -----  setValue");
}

@end
