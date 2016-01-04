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
- (void)awakeFromNib{
    [super awakeFromNib];
     _originImage = [UIImage imageNamed:@"originImage"];
    _trimmedImage = _originImage;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self.trimSlider addTarget:self action:@selector(trimSliderChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    
}
- (void)trimSliderChanged:(UISlider *)slider{
    UIImage *editingImage = [LCImageFilter trimOriginImage:_originImage withDefaultTrim:_selectedTrim size:CGSizeZero ratio:self.trimSlider.value];
//    UIImage *editingImage2 = [LCImageFilter rotateInRadians:M_PI*self.trimSlider.value originImage:editingImage];
//    UIImage *editingImage2 = [LCImageFilter cropToRatioRect:CGRectMake(-1, 0.2, 0.5, 0.7) originImage:editingImage];
    self.originImageView.image = editingImage;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 23;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TrimCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TrimCollectionViewCell" forIndexPath:indexPath];
    LCOriginalTrim_Type type = indexPath.row;
    [cell configureCellWithIndexPath:type withImage:[self getImageFromCache:type]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    _originImageView.image = [LCImageFilter trimOriginImage:_originImage withDefaultTrim:indexPath.row size:CGSizeZero ratio:self.trimSlider.value];
    _selectedTrim = indexPath.row;
    
}

- (UIImage *)getImageFromCache:(LCOriginalTrim_Type )type{
    if (!_cache) {
        _cache = [NSCache new];
    }
    UIImage *result = nil;
    result = [_cache objectForKey:[NSNumber numberWithUnsignedInteger:type]];
    if (!result) {
        result = [LCImageFilter trimOriginImage:_originImage withDefaultTrim:type size:CGSizeMake(60, 60) ratio:0.3];
        [_cache setObject:result forKey:[NSNumber numberWithUnsignedInteger:type]];
    }

    return result;
}


@end
