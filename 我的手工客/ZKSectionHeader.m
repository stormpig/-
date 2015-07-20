//
//  ZKSectionHeader.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKSectionHeader.h"

@interface ZKSectionHeader ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ZKSectionHeader

+ cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:identifier bundle:[NSBundle mainBundle]];
    [collectionView registerNib:nib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier];
    return [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier forIndexPath:indexPath];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
