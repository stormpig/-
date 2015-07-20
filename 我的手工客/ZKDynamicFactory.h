//
//  ZKDynamicFactory.h
//  我的手工客
//
//  Created by 曾凯 on 15-7-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZKDynamic.h"
#import "ZKDCircle.h"
#import "ZKDCourse.h"
#import "ZKDFollow.h"

@interface ZKDynamicFactory : NSObject

+ (ZKDynamic *)dynamicWithDict:(NSDictionary *)dict;

@end
