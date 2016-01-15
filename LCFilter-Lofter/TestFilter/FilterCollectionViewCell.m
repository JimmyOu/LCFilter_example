//
//  FilterCollectionViewCell.m
//  LCFilter-Lofter
//
//  Created by NetEase on 15/12/28.
//  Copyright © 2015年 NetEase. All rights reserved.
//

#import "FilterCollectionViewCell.h"

@implementation FilterCollectionViewCell
- (void)configureCellWithIndexPath:(LCOriginalFilter_Type)type
                         withImage:(UIImage *)image{
    self.originImageView.image = image;
    switch (type) {
        case LCOriginalFilter_Jane:
            _filterName.text = @"简";
            break;
        case LCOriginalFilter_SaltI:
            _filterName.text = @"盐I";
            break;
        case LCOriginalFilter_SaltII:
            _filterName.text = @"盐II";
            break;
        case LCOriginalFilter_SaltIII:
            _filterName.text = @"盐III";
            break;
        case LCOriginalFilter_Cyan:
            _filterName.text = @"青";
            break;
        case LCOriginalFilter_Summer:
            _filterName.text = @"夏";
            break;
        case LCOriginalFilter_MoodGray:
            _filterName.text = @"情绪灰";
            break;
        case LCOriginalFilter_Dusk:
            _filterName.text = @"暮";
            break;
        case LCOriginalFilter_Firefly:
            _filterName.text = @"萤";
            break;
        case LCOriginalFilter_InkI:
            _filterName.text = @"墨I";
            break;
        case LCOriginalFilter_InkII:
            _filterName.text = @"墨II";
            break;
//        case LCOriginalFilter_InkIII:
//            _filterName.text = @"墨III";
//            break;
        case LCOriginalFilter_A1:
            _filterName.text = @"A1";
            break;
        case LCOriginalFilter_A5:
            _filterName.text = @"A5";
            break;
        case LCOriginalFilter_A6:
            _filterName.text = @"A6";
            break;
        case LCOriginalFilter_A7:
            _filterName.text = @"A7";
            break;
        case LCOriginalFilter_A8:
            _filterName.text = @"A8";
            break;
        case LCOriginalFilter_M5:
            _filterName.text = @"M5";
            break;
        case LCOriginalFilter_J6:
            _filterName.text = @"J6";
            break;
        case LCOriginalFilter_N1:
            _filterName.text =@"N1";
            break;
        case LCOriginalFilter_HB1:
            _filterName.text =@"HB1";
            break;
        case LCOriginalFilter_KK1:
            _filterName.text =@"KK1";
            break;
        case LCOriginalFilter_T1:
            _filterName.text =@"T1";
            break;
        case LCOriginalFilter_H5:
            _filterName.text =@"H5";
            break;
        case LCOriginalFilter_SE1:
            _filterName.text =@"SE1";
            break;
        case LCOriginalFilter_F2:
            _filterName.text =@"F2";
            break;
        default:
            break;
    }
    

}


@end
