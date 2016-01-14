//
//  TrimViewController.m
//  LCFilter-Lofter
//
//  Created by NetEase on 15/12/29.
//  Copyright © 2015年 NetEase. All rights reserved.
//

#import "TrimViewController.h"
#import "LCImageFilter.h"
#import "TrimCollectionViewCell.h"
@interface TrimViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *originImageView;
@property (weak, nonatomic) IBOutlet UISlider *trimSlider;
@property (weak, nonatomic) IBOutlet UICollectionView *trimCollectionView;

@end

@implementation TrimViewController{
    UIImage *_originImage;
    UIImage *_trimmedImage;
    NSCache *_cache;
    NSInteger _selectedTrim;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _originImage = [UIImage imageNamed:@"originImage.png"];

    _trimmedImage = _originImage;
    self.trimSlider.continuous = NO;
    [self.trimSlider addTarget:self action:@selector(trimSliderChanged:) forControlEvents:UIControlEventTouchUpInside];

   

}

- (void)trimSliderChanged:(UISlider *)slider{


    [LCImageFilter trimOriginImage:_originImage
                   withDefaultTrim:_selectedTrim
                              size:CGSizeZero
                             ratio:slider.value
                   completionBlock:^(UIImage *result) {
                       _originImageView.image = result;


                   }];
//    self.originImageView.image = [LCImageFilter rotateInRadian:slider.value*M_PI image:_originImage fitSize:NO];
//    self.originImageView.image = [LCImageFilter cropToRatioRect:CGRectMake(0, 0, 1000, 1000) originImage:_originImage];

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 23;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TrimCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TrimCollectionViewCell" forIndexPath:indexPath];
    LCOriginalTrim_Type type = indexPath.row;
    [self getCacheImageWithType:type completionBlock:^(UIImage *result) {
        [cell configureCellWithIndexPath:type withImage:result];
    }];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [LCImageFilter trimOriginImage:_originImage
                   withDefaultTrim:indexPath.row
                              size:CGSizeZero
                             ratio:0.3
                   completionBlock:^(UIImage *result) {
        _originImageView.image = result;
    }];
    _selectedTrim = indexPath.row;
    
}


//- (void)getCacheImageWithType:(LCOriginalTrim_Type)type completionBlock:(void(^)(UIImage *result))completionBlock{
//    if (!_cache) {
//        _cache = [NSCache new];
//    }
//   __block UIImage *resultImage = [_cache objectForKey:[NSString stringWithFormat:@"%d",type]];
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        if (!resultImage) {
//            resultImage = [LCImageFilter trimOriginImage:_originImage withDefaultTrim:type size:CGSizeMake(60, 60) ratio:1];
//            [_cache setObject:resultImage forKey:[NSString stringWithFormat:@"%d",type]];
//        }
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (completionBlock) {
//                completionBlock(resultImage);
//            }
//        });
//    });
//    
//}

- (void)getCacheImageWithType:(LCOriginalTrim_Type)type completionBlock:(void(^)(UIImage *result))completionBlock{
    if (!_cache) {
        _cache = [NSCache new];
    }
    UIImage *resultImage = [_cache objectForKey:[NSString stringWithFormat:@"%d",type]];
    if (!resultImage) {
            resultImage = [LCImageFilter trimOriginImage:_originImage withDefaultTrim:type size:CGSizeMake(60, 60) ratio:1];
            [_cache setObject:resultImage forKey:[NSString stringWithFormat:@"%d",type]];
        }
        if (completionBlock) {
                completionBlock(resultImage);
            }
    
}

@end
