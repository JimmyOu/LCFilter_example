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
        case LCOriginalFilter_BlueOrGreen:
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
        case LCOriginalFilter_InkIII:
            _filterName.text = @"墨III";
            break;
        case LCOriginalFilter_SnowPear:
            _filterName.text = @"雪梨町";
            break;
        case LCOriginalFilter_MasterI:
            _filterName.text = @"少爷D1";
            break;
        case LCOriginalFilter_MasterII:
            _filterName.text = @"少爷D2";
            break;
        case LCOriginalFilter_TwilightSnow:
            _filterName.text = @"暮雪R2";
            break;
        case LCOriginalFilter_ConchShell:
            _filterName.text = @"海螺壳I";
            break;
        case LCOriginalFilter_Dear:
            _filterName.text = @"亲切K";
            break;
        case LCOriginalFilter_Seven:
            _filterName.text = @"七七V1";
            break;
            
        default:
            break;
    }
    

}
@end
