//
//  UIImage+ResizeImage.m
//  图片拉升测试
//
//  Created by 曾凯 on 15-7-2.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "UIImage+ResizeImage.h"

@implementation UIImage (ResizeImage)

+ (UIImage *)resizableImageNamed:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    //    NSLog(@"%@", NSStringFromCGSize(image.size));
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height / 2 - 1, image.size.width / 2 - 1, image.size.height / 2 - 1, image.size.width / 2 - 1) resizingMode:UIImageResizingModeStretch];
    return image;
}

@end
