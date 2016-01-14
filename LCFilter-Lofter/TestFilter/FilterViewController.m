//
//  FilterViewController.m
//  LCFilter-Lofter
//
//  Created by NetEase on 15/12/28.
//  Copyright © 2015年 NetEase. All rights reserved.
//

#import "FilterViewController.h"
#import "FilterCollectionViewCell.h"
#import "LCImageFilter.h"
@interface FilterViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *filterImageView;
@property (weak, nonatomic) IBOutlet UICollectionView *filterCollectionView;
@property (weak, nonatomic) IBOutlet UISlider *filterSlide;
@end

@implementation FilterViewController{
    UIImage *_inputImage;
    UIImage *_filterImage;
    NSCache *_cache;
    NSInteger _selectedFilter;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _inputImage = [UIImage imageNamed:@"originImage"];
    [self.filterSlide addTarget:self action:@selector(filterRatioChanged:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)filterRatioChanged:(UISlider *)slider{
    [LCImageFilter filtOriginImage:_inputImage withDefaultFilter:_selectedFilter size:CGSizeZero ratio:slider.value completionBlock:^(UIImage *result) {
        self.filterImageView.image = result;
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 26;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FilterCollectionViewCell *filterCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FilterCollectionViewCell" forIndexPath:indexPath];
    LCOriginalFilter_Type type = indexPath.row;
//    [filterCell configureCellWithIndexPath:type withImage:[self getCacheImageWithType:type]];
    [self getCacheImageWithType:type completionBlock:^(UIImage *result) {
//        NSLog(@"%d",type);
        [filterCell configureCellWithIndexPath:type withImage:result];
    }];
    return filterCell;
    
}

//- (void)getCacheImageWithType:(LCOriginalFilter_Type)type completionBlock:(void(^)(UIImage *result))completionBlock{
//    if (!_cache) {
//        _cache = [NSCache new];
//    }
//   __block UIImage *resultImage = [_cache objectForKey:[NSString stringWithFormat:@"%d",type]];
//    if (resultImage) {
//        completionBlock(resultImage);
//    }
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            resultImage = [LCImageFilter filtOriginImage:_inputImage withDefaultFilter:type size:CGSizeMake(50.0, 50.0) ratio:0.5];
//            [_cache setObject:resultImage forKey:[NSString stringWithFormat:@"%d",type]];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (completionBlock) {
//                completionBlock(resultImage);
//            }
//        });
//    });
//
//}
- (void)getCacheImageWithType:(LCOriginalFilter_Type)type completionBlock:(void(^)(UIImage *result))completionBlock{
    if (!_cache) {
        _cache = [NSCache new];
    }
     UIImage *resultImage = [_cache objectForKey:[NSString stringWithFormat:@"%d",type]];
    if (!resultImage) {
        resultImage = [LCImageFilter filtOriginImage:_inputImage withDefaultFilter:type size:CGSizeMake(50.0, 50.0) ratio:0.5];
        [_cache setObject:resultImage forKey:[NSString stringWithFormat:@"%d",type]];
    }
    
    if (completionBlock) {
        completionBlock(resultImage);
        }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LCOriginalFilter_Type type = indexPath.row;
    _selectedFilter = indexPath.row;
    /**
     *  处理效果图
     */
    _filterImage = [LCImageFilter filtOriginImage:_inputImage withDefaultFilter:type size:CGSizeZero ratio:1];
    _filterImageView.image = _filterImage;
}


@end
