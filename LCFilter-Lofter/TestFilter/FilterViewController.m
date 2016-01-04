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
@end

@implementation FilterViewController{
    UIImage *_inputImage;
    UIImage *_filterImage;
    NSCache *_cache;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _inputImage = [UIImage imageNamed:@"originImage"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 19;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FilterCollectionViewCell *filterCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FilterCollectionViewCell" forIndexPath:indexPath];
    LCOriginalFilter_Type type = indexPath.row;
    [filterCell configureCellWithIndexPath:type withImage:[self getCacheImageWithType:type]];
    return filterCell;
    
}

- (UIImage *)getCacheImageWithType:(LCOriginalFilter_Type)type{
    if (!_cache) {
        _cache = [NSCache new];
    }
    UIImage *resultImage = [_cache objectForKey:[NSString stringWithFormat:@"%lu",type]];
    if (!resultImage) {
        resultImage = [LCImageFilter filtOriginImage:_inputImage withDefaultFilter:type size:CGSizeMake(50.0, 50.0) ratio:1];
        [_cache setObject:resultImage forKey:[NSString stringWithFormat:@"%lu",type]];
    }
    return resultImage;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LCOriginalFilter_Type type = indexPath.row;
    
    /**
     *  处理效果图
     */
    _filterImage = [LCImageFilter filtOriginImage:_inputImage withDefaultFilter:type size:CGSizeZero ratio:1];
    _filterImageView.image = _filterImage;
}


@end
