# LCFilter_example
===
滤镜处理的示例程序
----
#使用
添加框架 **QuartzCore、AVFoundation、OpenGLES、CoreVideo、CoreMedia** ，将 **LCFilter_Demo / LCFilter-Lofter / SDK/** 中的文件添加到工程中


#支持的滤镜效果

typedef NS_ENUM(NSUInteger,LCOriginalFilter_Type) {<br>
LCOriginalFilter_Jane,//简<br>
LCOriginalFilter_SaltI,//盐I<br>
LCOriginalFilter_SaltII,//盐II<br>
LCOriginalFilter_SaltIII,//盐III<br>
LCOriginalFilter_Cyan,//青<br>
LCOriginalFilter_Summer,//夏<br>
LCOriginalFilter_MoodGray,//情绪灰<br>
LCOriginalFilter_Dusk,//暮<br>
LCOriginalFilter_Firefly,//萤<br>
LCOriginalFilter_InkI,//墨I<br>
LCOriginalFilter_InkII,//墨II<br>
LCOriginalFilter_InkIII,//墨III<br>
LCOriginalFilter_A1,//A1<br>
LCOriginalFilter_A5,//A5<br>
LCOriginalFilter_A6,//A6<br>
LCOriginalFilter_A7,//A7<br>
LCOriginalFilter_A8,//A8<br>
LCOriginalFilter_M5,//M5<br>
LCOriginalFilter_J6,//J6<br>
LCOriginalFilter_N1,//N1<br>
LCOriginalFilter_HB1,//HB1<br>
LCOriginalFilter_KK1,//KK1<br>
LCOriginalFilter_T1,//T1<br>
LCOriginalFilter_H5,//H5<br>
LCOriginalFilter_SE1,//SE1<br>
LCOriginalFilter_F2,//F2<br>
};

#支持的微调效果

typedef NS_ENUM(NSUInteger,LCOriginalTrim_Type) {<br>
LCOriginalTrim_ColorTemp,//色温<br>
LCOriginalTrim_Saturation,//饱和度<br>
LCOriginalTrim_Exposure,//亮度<br>
LCOriginalTrim_Contrast,//对比度<br>
LCOriginalTrim_Sharpness,//锐度<br>
LCOriginalTrim_Clarity,//清晰度<br>
LCOriginalTrim_Noise,//噪点<br>
LCOriginalTrim_Dark,//暗角<br>
LCOriginalTrim_Hightlight0,//高光细节0<br>
LCOriginalTrim_Hightlight1,//高光细节1<br>
LCOriginalTrim_Hightlight2,//高光细节2<br>
LCOriginalTrim_Hightlight3,//高光细节3<br>
LCOriginalTrim_Hightlight4,//高光细节4<br>
LCOriginalTrim_Hightlight5,//高光细节5<br>
LCOriginalTrim_HightlightOrigin,//高光细节6<br>
LCOriginalTrim_ShadeDetail0,//暗部细节0<br>
LCOriginalTrim_ShadeDetail1,//暗部细节1<br>
LCOriginalTrim_ShadeDetail2,//暗部细节2<br>
LCOriginalTrim_ShadeDetail3,//暗部细节3<br>
LCOriginalTrim_ShadeDetail4,//暗部细节4<br>
LCOriginalTrim_ShadeDetail5,//暗部细节5<br>
LCOriginalTrim_ShadeDetailOrigin,//暗部细节6<br>
LCOriginalTrim_BlurEffect,//褪色<br>
};

#滤镜
__
**输入原图和要使用的滤镜，返回效果图,主线程**<br>
**@param originImage**      原图<br>
**@param originFilterType** 效果<br>
**@param size**             用作缩略图处理，返回原尺寸传入CGSizeZero<br>
**@param ratio**            滤镜的强度(0-1)<br>
**@return** 效果图<br>
+(UIImage *)filtOriginImage:(UIImage *)originImage<br>
withDefaultFilter:(LCOriginalFilter_Type)originFilterType<br>
size:(CGSize )size<br>
ratio:(CGFloat)ratio;<br>


**输入原图和要使用的滤镜，返回效果图,在子线程中处理，回调在主线程**<br>
**@param originImage**     原图<br>
**@param originFilterType** 效果<br>
**@param size**            用作缩略图处理，返回原尺寸传入CGSizeZero<br>
**@param ratio**            滤镜的强度(0-1)<br>
**@return** 效果图<br>
+(void)filtOriginImage:(UIImage *)originImage<br>
withDefaultFilter:(LCOriginalFilter_Type)originFilterType<br>
size:(CGSize )size<br>
ratio:(CGFloat)ratio<br>
completionBlock:(void(^)(UIImage *result))competionBlock;<br>


#微调：
__
**输入原图和要使用的微调选项，返回效果图，主线程**<br>
**@param originImage**    原图<br>
**@param originFilterType** 效果<br>
**@param size**         用作缩略图处理，返回原尺寸传入CGSizeZero<br>
**@param ratio**            微调的的强度(-1到1)<br>
**@return** 效果图<br>

+(UIImage *)trimOriginImage:(UIImage *)originImage<br>
withDefaultTrim:(LCOriginalTrim_Type)originFilterType<br>
size:(CGSize )size<br>
ratio:(CGFloat)ratio;<br>

**输入原图和要使用的微调选项，返回效果图，子线程处理，回调在主线程**<br>
**@param originImage**      原图<br>
**@param originFilterType** 效果<br>
**@param size**            用作缩略图处理，返回原尺寸传入CGSizeZero<br>
**@param ratio**          微调的的强度(-1到1)<br>
**@return** 效果图<br>
+(void)trimOriginImage:(UIImage *)originImage<br>
withDefaultTrim:(LCOriginalTrim_Type)originFilterType<br>
size:(CGSize )size<br>
ratio:(CGFloat)ratio<br>
completionBlock:(void(^)(UIImage *result))competionBlock;<br>


#旋转&裁剪<br>
**@param radians**   旋转弧度，逆时针.⟲<br>
**@param image**   原图<br>
**@param fitSize**   YES:图片fit原来的extent.NO: 可能伸缩.<br>
**Returns** 旋转后的图片<br>
+ (UIImage *)rotateInRadian:(CGFloat)radians image:(UIImage *)image fitSize:(BOOL)fitSize;<br>


**@param degree**   旋转角度，逆时针.⟲<br>
**@param image**   原图<br>
**@param fitSize**  YES:图片fit原来的extent. NO: 可能伸缩.<br>
**Return** 旋转后的图片<br>
+ (UIImage *)rotateInDegree:(CGFloat)degree image:(UIImage *)image fitSize:(BOOL)fitSize;<br>

**@param newRect**   目标Rect<br>
**@param image**   原图<br>
**Return** 旋转后的图片<br>
+ (UIImage *)cropToRect:(CGRect)newRect originImage:(UIImage *)image;<br>

**剪切按照比例ratioRect(0-1),如（0.1，0.2，0.5，0.6)**<br>
**@param ratioRect**   （0.1，0.2，0.5，0.6),从width * 0.1, height * 0.2开始裁剪到width * 0.5, height * 0.6的位置）<br>
**@param image**   原图<br>
**Return** 旋转后的图片<br>
+ (UIImage *)cropToRatioRect:(CGRect)ratioRect originImage:(UIImage *)image;<br>
