//
//  TrimCollectionViewCell.m
//  LCFilter-Lofter
//
//  Created by NetEase on 15/12/29.
//  Copyright © 2015年 NetEase. All rights reserved.
//

#import "TrimCollectionViewCell.h"

@implementation TrimCollectionViewCell
- (void)configureCellWithIndexPath:(LCOriginalTrim_Type)type withImage:(UIImage *)image{
    self.orginImageView.image = image;
    switch (type) {
        case LCOriginalTrim_BlurEffect:
            _trimName.text = @"褪色";
            break;
        case LCOriginalTrim_Noise:
            _trimName.text = @"噪声";
        break;
        case LCOriginalTrim_Clarity:
            _trimName.text = @"清晰度";
            break;
        case LCOriginalTrim_ColorTemp:
            _trimName.text = @"色温";
            break;
        case LCOriginalTrim_Contrast:
            _trimName.text = @"对比度";
            break;
        case LCOriginalTrim_Dark:
            _trimName.text = @"暗角";
            break;
        case LCOriginalTrim_Exposure:
            _trimName.text = @"亮度";
            break;
        case LCOriginalTrim_Hightlight0:
            _trimName.text = @"高光细节0";
            break;
        case LCOriginalTrim_Hightlight1:
            _trimName.text = @"高光细节1";
            break;
        case LCOriginalTrim_Hightlight2:
            _trimName.text = @"高光细节2";
            break;
        case LCOriginalTrim_Hightlight3:
            _trimName.text = @"高光细节3";
            break;
        case LCOriginalTrim_Hightlight4:
            _trimName.text = @"高光细节4";
            break;
        case LCOriginalTrim_Hightlight5:
            _trimName.text = @"高光细节5";
            break;
        case LCOriginalTrim_HightlightOrigin:
            _trimName.text = @"高光细节";
            break;
        case LCOriginalTrim_Saturation:
            _trimName.text = @"饱和度";
            break;
        case LCOriginalTrim_ShadeDetail0:
            _trimName.text = @"暗部细节0";
            break;
        case LCOriginalTrim_ShadeDetail1:
            _trimName.text = @"暗部细节1";
            break;
        case LCOriginalTrim_ShadeDetail2:
            _trimName.text = @"暗部细节2";
            break;
        case LCOriginalTrim_ShadeDetail3:
            _trimName.text = @"暗部细节3";
            break;
        case LCOriginalTrim_ShadeDetail4:
            _trimName.text = @"暗部细节4";
            break;
        case LCOriginalTrim_ShadeDetail5:
            _trimName.text = @"暗部细节5";
            break;
        case LCOriginalTrim_ShadeDetailOrigin:
            _trimName.text = @"暗部细节";
            break;
        case LCOriginalTrim_Sharpness:
            _trimName.text = @"锐度";
            break;
        default:
            break;
    }
}

@end
