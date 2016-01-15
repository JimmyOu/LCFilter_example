# LCFilter_example
滤镜处理的示例程序
#使用
添加框架 **QuartzCore、AVFoundation、OpenGLES、CoreVideo、CoreMedia** ，将 **LCFilter_Demo / LCFilter-Lofter / SDK/** 中的文件添加到工程中


#支持的滤镜效果

typedef NS_ENUM(NSUInteger,LCOriginalFilter_Type) {
LCOriginalFilter_Jane,//简
LCOriginalFilter_SaltI,//盐I
LCOriginalFilter_SaltII,//盐II
LCOriginalFilter_SaltIII,//盐III
LCOriginalFilter_Cyan,//青
LCOriginalFilter_Summer,//夏
LCOriginalFilter_MoodGray,//情绪灰
LCOriginalFilter_Dusk,//暮
LCOriginalFilter_Firefly,//萤
LCOriginalFilter_InkI,//墨I
LCOriginalFilter_InkII,//墨II
LCOriginalFilter_InkIII,//墨III
LCOriginalFilter_A1,//A1
LCOriginalFilter_A5,//A5
LCOriginalFilter_A6,//A6
LCOriginalFilter_A7,//A7
LCOriginalFilter_A8,//A8
LCOriginalFilter_M5,//M5
LCOriginalFilter_J6,//J6
LCOriginalFilter_N1,//N1
LCOriginalFilter_HB1,//HB1
LCOriginalFilter_KK1,//KK1
LCOriginalFilter_T1,//T1
LCOriginalFilter_H5,//H5
LCOriginalFilter_SE1,//SE1
LCOriginalFilter_F2,//F2
};

#支持的微调效果

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

#滤镜
**输入原图和要使用的滤镜，返回效果图,主线程**
**@param originImage**      原图
**@param originFilterType** 效果
**@param size**             用作缩略图处理，返回原尺寸传入CGSizeZero
**@param ratio**            滤镜的强度(0-1)
**@return** 效果图
+(UIImage *)filtOriginImage:(UIImage *)originImage
withDefaultFilter:(LCOriginalFilter_Type)originFilterType
size:(CGSize )size
ratio:(CGFloat)ratio;


**输入原图和要使用的滤镜，返回效果图,在子线程中处理，回调在主线程**
**@param originImage**     原图
**@param originFilterType** 效果
**@param size**            用作缩略图处理，返回原尺寸传入CGSizeZero
**@param ratio**            滤镜的强度(0-1)
**@return** 效果图
+(void)filtOriginImage:(UIImage *)originImage
withDefaultFilter:(LCOriginalFilter_Type)originFilterType
size:(CGSize )size
ratio:(CGFloat)ratio
completionBlock:(void(^)(UIImage *result))competionBlock;


#微调：
**输入原图和要使用的微调选项，返回效果图，主线程**
**@param originImage**    原图
**@param originFilterType** 效果
**@param size**         用作缩略图处理，返回原尺寸传入CGSizeZero
**@param ratio**            微调的的强度(-1到1)
**@return** 效果图

+(UIImage *)trimOriginImage:(UIImage *)originImage
withDefaultTrim:(LCOriginalTrim_Type)originFilterType
size:(CGSize )size
ratio:(CGFloat)ratio;

**输入原图和要使用的微调选项，返回效果图，子线程处理，回调在主线程**
**@param originImage**      原图
**@param originFilterType** 效果
**@param size**            用作缩略图处理，返回原尺寸传入CGSizeZero
**@param ratio**          微调的的强度(-1到1)
**@return** 效果图
+(void)trimOriginImage:(UIImage *)originImage
withDefaultTrim:(LCOriginalTrim_Type)originFilterType
size:(CGSize )size
ratio:(CGFloat)ratio
completionBlock:(void(^)(UIImage *result))competionBlock;


#旋转&裁剪
**@param radians**   旋转弧度，逆时针.⟲
**@param image**   原图
**@param fitSize**   YES:图片fit原来的extent.NO: 可能伸缩.
**Returns** 旋转后的图片
+ (UIImage *)rotateInRadian:(CGFloat)radians image:(UIImage *)image fitSize:(BOOL)fitSize;


**@param degree**   旋转角度，逆时针.⟲
**@param image**   原图
**@param fitSize**  YES:图片fit原来的extent. NO: 可能伸缩.
**Return** 旋转后的图片
+ (UIImage *)rotateInDegree:(CGFloat)degree image:(UIImage *)image fitSize:(BOOL)fitSize;

**@param newRect**   目标Rect
**@param image**   原图
**Return** 旋转后的图片
+ (UIImage *)cropToRect:(CGRect)newRect originImage:(UIImage *)image;

**剪切按照比例ratioRect(0-1),如（0.1，0.2，0.5，0.6)**
**@param ratioRect**   （0.1，0.2，0.5，0.6),从width * 0.1, height * 0.2开始裁剪到width * 0.5, height * 0.6的位置）
**@param image**   原图
**Return** 旋转后的图片
+ (UIImage *)cropToRatioRect:(CGRect)ratioRect originImage:(UIImage *)image;
