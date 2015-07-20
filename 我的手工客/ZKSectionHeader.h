//
//  ZKSectionHeader.h
//  我的手工客
//
//  Created by 曾凯 on 15-7-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZKSectionHeader : UICollectionReusableView

@property (strong, nonatomic) NSString *title;

+ cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end
