//
//  TrimCollectionViewCell.h
//  LCFilter-Lofter
//
//  Created by NetEase on 15/12/29.
//  Copyright © 2015年 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCImageFilter.h"
@interface TrimCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *orginImageView;
@property (weak, nonatomic) IBOutlet UILabel *trimName;

- (void)configureCellWithIndexPath:(LCOriginalTrim_Type)type
                         withImage:(UIImage *)image;
@end
