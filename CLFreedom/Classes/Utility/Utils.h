//
//  Utils.h
//  HeQuan
//
//  Created by Chunjia Wei on 14-8-18.
//  Copyright (c) 2014年 chunjia wei. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

void bd_encryptToBD(CLLocationCoordinate2D ggCoordinate, CLLocationCoordinate2D *bdCoordinate);
void bd_decryptToGG(CLLocationCoordinate2D bdCoordinate, CLLocationCoordinate2D *ggCoordinate);

@interface Utils : NSObject
+ (UIColor *)colorForHex:(NSString *)hexColor alpha:(CGFloat)alpha;
+ (UIColor *)getColorRGB:(NSString *)color;
+ (UIColor *)getColorRGB:(NSString *)color withAlpha:(CGFloat)alpha;
+ (UIImage *)imageFromView:(UIView *)view;
+ (NSInteger)random:(NSInteger)range;
+ (UIImage *)getRepeatBackground:(UIImage *)image size:(CGSize)size;

+ (NSString *)getDistanceString:(int)distance;
+ (NSString *)getShortDistanceString:(NSString *)distance;

+(NSString *)notNullString:(id )object;

+(BOOL)isNullString:(NSString *)str;
+(BOOL)useYard;
+ (NSString *)getCurrentLanguage;
+ (UIImage *)getImageWithLanguage:(NSString *)fileName;
//+ (UIImage *)scaledImageForUpload:(UIImage *)image;
// (BOOL)checkImageSize:(UIImage *)image;
+ (BOOL)isiPhone5;

+ (BOOL)isIphone6SystemVersion;
+ (BOOL)isIphone7SystemVersion;
+(CGFloat)iphoneSystemVersion;

+(BOOL)isBelowIphone6SystemVersion;//是否低于ios6.0;

+ (CGSize)getRetinaSize;
+(CGSize)getScreenSize;
+(int)getScreenExtraHeight;
+(CGSize)getMainScreenSize;
+(CGSize)getScreenSizeExceptNavBar;

+ (NSString *)addPrefixForPhoneImageUrl:(NSString *)imgUrl;
@end
