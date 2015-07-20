//
//  ZKBaseCell.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKBaseCell.h"

@implementation ZKBaseCell

+ cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:identifier bundle:[NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
    return [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
}

@end
