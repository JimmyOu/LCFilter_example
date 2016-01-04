//
//  LCImageFilter.h
//  LCFilter-Lofter
//
//  Created by NetEase on 15/12/28.
//  Copyright © 2015年 NetEase. All rights reserved.
//
/*
 依赖框架：QuartzCore、AVFoundation、OpenGLES、CoreVideo、CoreMedia
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  所要使用的滤镜风格（不可以私自调整枚举顺序）
 */
typedef NS_ENUM(NSUInteger,LCOriginalFilter_Type) {
    LCOriginalFilter_Jane,//简
    LCOriginalFilter_SaltI,//盐I
    LCOriginalFilter_SaltII,//盐II
    LCOriginalFilter_SaltIII,//盐III
    LCOriginalFilter_BlueOrGreen,//青
    LCOriginalFilter_Summer,//夏
    LCOriginalFilter_MoodGray,//情绪灰
    LCOriginalFilter_Dusk,//暮
    LCOriginalFilter_Firefly,//萤
    LCOriginalFilter_InkI,//墨I
    LCOriginalFilter_InkII,//墨II
    LCOriginalFilter_InkIII,//墨III
    LCOriginalFilter_SnowPear,//雪梨町
    LCOriginalFilter_MasterI,//少爷D1
    LCOriginalFilter_MasterII,//少爷D2
    LCOriginalFilter_TwilightSnow,//暮雪R2
    LCOriginalFilter_ConchShell,//海螺壳I
    LCOriginalFilter_Dear,//亲切K
    LCOriginalFilter_Seven,//七七V1
    
};
/**
 *  所要使用的微调风格（不可以私自调整枚举顺序）
 */
typedef NS_ENUM(NSUInteger,LCOriginalTrim_Type) {
    LCOriginalTrim_ColorTemp,//色温
    LCOriginalTrim_Saturation,//饱和度
    LCOriginalTrim_Exposure,//亮度
    LCOriginalTrim_Contrast,//对比度
    LCOriginalTrim_Sharpness,//锐度
    LCOriginalTrim_Clarity,//清晰度
    LCOriginalTrim_Noise,//噪点
    LCOriginalTrim_Dark,//暗角
    LCOriginalTrim_Hightlight0,//高光细节0
    LCOriginalTrim_Hightlight1,//高光细节1
    LCOriginalTrim_Hightlight2,//高光细节2
    LCOriginalTrim_Hightlight3,//高光细节3
    LCOriginalTrim_Hightlight4,//高光细节4
    LCOriginalTrim_Hightlight5,//高光细节5
    LCOriginalTrim_HightlightOrigin,//高光细节6
    LCOriginalTrim_ShadeDetail0,//暗部细节0
    LCOriginalTrim_ShadeDetail1,//暗部细节1
    LCOriginalTrim_ShadeDetail2,//暗部细节2
    LCOriginalTrim_ShadeDetail3,//暗部细节3
    LCOriginalTrim_ShadeDetail4,//暗部细节4
    LCOriginalTrim_ShadeDetail5,//暗部细节5
    LCOriginalTrim_ShadeDetailOrigin,//暗部细节6
    LCOriginalTrim_BlurEffect,//褪色
};
@interface LCImageFilter : NSObject

/**
 *  输入原图和要使用的滤镜，返回效果图
 *
 *  @param originImage      原图
 *  @param originFilterType 效果
 *  @param size             用作缩略图处理，返回原尺寸传入CGSizeZero
 *  @param ratio            滤镜的强度(0-1)
 *  @return 效果图
 */
+(UIImage *)filtOriginImage:(UIImage *)originImage
          withDefaultFilter:(LCOriginalFilter_Type)originFilterType
                       size:(CGSize )size
                      ratio:(CGFloat)ratio;

/**
 *  输入原图和要使用的微调选项，返回效果图
 *
 *  @param originImage      原图
 *  @param originFilterType 效果
 *  @param size             用作缩略图处理，返回原尺寸传入CGSizeZero
 *  @param ratio            微调的的强度(-1到1)
 *  @return 效果图
 */
+(UIImage *)trimOriginImage:(UIImage *)originImage
          withDefaultTrim:(LCOriginalTrim_Type)originFilterType
                       size:(CGSize )size
                      ratio:(CGFloat)ratio;
//旋转，逆时针为正，顺时针为负
//弧度制旋转
+ (UIImage*)rotateInRadians:(float)radians originImage:(UIImage *)image;
//角度制旋转
+ (UIImage*)rotateInDegrees:(float)degrees originImage:(UIImage *)image;
//剪切按照尺寸
+ (UIImage *)cropToRect:(CGRect)newRect originImage:(UIImage *)image;
//剪切按照比例ratioRect(0-1),如（0.1，0.2，0.5，0.6）
+ (UIImage *)cropToRatioRect:(CGRect)ratioRect originImage:(UIImage *)image;
@end
