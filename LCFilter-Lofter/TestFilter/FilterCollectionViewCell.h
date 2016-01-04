//
//  FilterCollectionViewCell.h
//  LCFilter-Lofter
//
//  Created by NetEase on 15/12/28.
//  Copyright © 2015年 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCImageFilter.h"
@interface FilterCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *originImageView;
@property (weak, nonatomic) IBOutlet UILabel *filterName;

- (void)configureCellWithIndexPath:(LCOriginalFilter_Type)type
                         withImage:(UIImage *)image;
@end
