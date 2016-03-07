//
//  Utils.m
//  HeQuan
//
//  Created by Chunjia Wei on 14-8-18.
//  Copyright (c) 2014年 chunjia wei. All rights reserved.
//

#import "Utils.h"
#import <QuartzCore/QuartzCore.h>
#define DefaultLanguage @"en"

const double x_pi = 3.14159265358979324 * 3000.0 / 180.0;

//将百度坐标转换为GCJ-02坐标
void bd_encryptToBD(CLLocationCoordinate2D ggCoordinate, CLLocationCoordinate2D *bdCoordinate)
{
    double x = ggCoordinate.longitude, y = ggCoordinate.latitude;
    double z = sqrt(x * x + y * y) + 0.00002 * sin(y * x_pi);
    double theta = atan2(y, x) + 0.000003 * cos(x * x_pi);
    (*bdCoordinate).longitude = z * cos(theta) + 0.0065;
    (*bdCoordinate).latitude = z * sin(theta) + 0.006;
}

//将GCJ-02坐标转换为百度坐标
void bd_decryptToGG(CLLocationCoordinate2D bdCoordinate, CLLocationCoordinate2D *ggCoordinate)
{
    double x = bdCoordinate.longitude - 0.0065, y = bdCoordinate.latitude - 0.006;
    double z = sqrt(x * x + y * y) - 0.00002 * sin(y * x_pi);
    double theta = atan2(y, x) - 0.000003 * cos(x * x_pi);
    (*ggCoordinate).longitude = z * cos(theta);
    (*ggCoordinate).longitude = z * sin(theta);
}

@implementation Utils
+ (UIColor *)colorForHex:(NSString *)hexColor alpha:(CGFloat)alpha
{
    NSRange range;
	range.location = 0;
	range.length = 2;
	NSString *rString = [hexColor substringWithRange:range];
	range.location = 2;
	NSString *gString = [hexColor substringWithRange:range];
	range.location = 4;
	NSString *bString = [hexColor substringWithRange:range];
	
	unsigned int r, g, b;
	[[NSScanner scannerWithString:rString] scanHexInt:&r];
	[[NSScanner scannerWithString:gString] scanHexInt:&g];
	[[NSScanner scannerWithString:bString] scanHexInt:&b];
	
	return [UIColor colorWithRed:((float) r / 255.0f)
						   green:((float) g / 255.0f)
							blue:((float) b / 255.0f)
						   alpha:alpha];
}

+(UIColor *)getColorRGB:(NSString *)color{
    return [self getColorRGB:color withAlpha:1.0];
}

+(UIColor *)getColorRGB:(NSString *)color withAlpha:(CGFloat)alpha{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];

    
}




+ (UIImage *)imageFromView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.frame.size, view.opaque, 0.0);
    //    CGContextTranslateCTM(currentContext, 0, view.frame.size.height);
    //    // passing negative values to flip the image
    //    CGContextScaleCTM(currentContext, 1.0, -1.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshot;
}

+ (NSInteger)random:(NSInteger)range
{
    return arc4random() % range;
}

+ (UIImage *)getRepeatBackground:(UIImage *)image size:(CGSize)size
{
	CGSize imageViewSize = size;
	
	UIGraphicsBeginImageContext(imageViewSize);
    
	CGRect imageRect;
	imageRect.origin = CGPointMake(0.0, 0.0);
	imageRect.size = CGSizeMake(image.size.width, image.size.height);
	
	CGContextRef imageContext = UIGraphicsGetCurrentContext();
	CGContextDrawTiledImage(imageContext, imageRect, image.CGImage);
    
	UIImage *finishedImage = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
    
    return finishedImage;
}

+(BOOL)isNullString:(NSString *)str
{
    BOOL ret = NO;
    
    if(!str || [str isEqualToString:@""] || [str isEqual:[NSNull null]])
        ret = YES;
    
    return ret;
}

+(NSString *)notNullString:(id )object
{
    NSString *str = object;
    
    if(!object || [str isEqual:[NSNull null]])
        str = @"";
    
    return str;
}

+ (NSString *)getDistanceString:(int)distance
{
    
    BOOL useYard = [Utils useYard];
    
    NSString *str = @"";
    
    if (useYard)
    {
        if (distance < 10)
        {
            str = NSLocalizedString(@"taIsAround",nil);
        }
        else if (distance < 1760)
        {
            str = [NSString stringWithFormat:NSLocalizedString(@"taMAway",nil), distance];
        }
        else if (distance < 1760000)
        {
            str = [NSString stringWithFormat:NSLocalizedString(@"taKmAway",nil), distance/1760];
        }
        else
        {
            str = NSLocalizedString(@"taUnreachable",nil);
        }
    }
    else
    {
        if (distance < 10)
        {
            str = NSLocalizedString(@"taIsAround",nil);
        }
        else if (distance < 1000)
        {
            str = [NSString stringWithFormat:NSLocalizedString(@"taMAway",nil), distance];
        }
        else if (distance < 1000000)
        {
            str = [NSString stringWithFormat:NSLocalizedString(@"taKmAway",nil), distance/1000];
        }
        else
        {
            str = NSLocalizedString(@"taUnreachable",nil);
        }
    }
    
    
    return str;
}

#pragma mark -- CLLocationDistance

+ (float) getDistanceCoord1:(CLLocationCoordinate2D)coord1 coord2:(CLLocationCoordinate2D)coord2
{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:coord1.latitude longitude:coord1.longitude] ;
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:coord2.latitude longitude:coord2.longitude];
    
    CLLocationDistance distance = [location1 distanceFromLocation:location2];
    //DEBUG_LOG(@"the current distance : %f",distance);
    return distance;
}

+ (NSString *)getShortDistanceString:(NSString *)distance
{
    NSString *str = @"";
    float fDistance = [distance floatValue];
    if (fDistance == 0) {
        return str;
    }
    
    if (fDistance < 1000)
        str = [NSString stringWithFormat:@"%d%@",(int)fDistance, @"m"];
    else
        str = [NSString stringWithFormat:@"%.2f%@",fDistance/1000, @"km"];
    
    return str;
}

+(BOOL)useYard
{
    NSString *language = [[NSLocale preferredLanguages] objectAtIndex:0];
    BOOL useYard = YES;
    if ([language isEqualToString:@"zh-Hans"]
        || [language isEqualToString:@"zh-Hant"])
    {
        useYard = NO;
    }
    
    return useYard;
}

+ (NSString *)getCurrentLanguage
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    return [languages objectAtIndex:0];
}

+ (UIImage *)getImageWithLanguage:(NSString *)fileName
{
    UIImage *image = [UIImage imageNamed:[[self getCurrentLanguage] stringByAppendingString:fileName]];
    if (image == nil)
    {
        return [UIImage imageNamed:[DefaultLanguage stringByAppendingString:fileName]];
    }
    return image;
}

+ (BOOL)isiPhone5
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    if (rect.size.height >= 568)
    {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isIphone6SystemVersion
{
    CGFloat floatVersion =[[UIDevice currentDevice].systemVersion floatValue];
    
    return  (floatVersion>= 6.0 && floatVersion<7.0);
    
}

+ (BOOL)isIphone7SystemVersion{
    return [[UIDevice currentDevice].systemVersion floatValue]>=7.0;
}

+(BOOL)isBelowIphone6SystemVersion{
    return  [[UIDevice currentDevice].systemVersion floatValue] < 6.0;
}

+(CGFloat)iphoneSystemVersion{
    return [[UIDevice currentDevice].systemVersion floatValue];
    
}

+(int)getScreenExtraHeight
{
    int height = 0;
    if ([self isiPhone5])
    {
        CGSize size = [Utils getScreenSize];
        height = size.height - 460;
    }
    
    return height;
}

+(CGSize)getScreenSize
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    size.height -= 20;
    return size;
}


+(CGSize)getMainScreenSize{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    return size;
}

+(CGSize)getScreenSizeExceptNavBar{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    size.height -= 64;
    return size;
    
    
}


+ (CGSize)getRetinaSize
{
    CGSize size = CGSizeZero;
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    size = CGSizeMake(rect.size.width * 2, rect.size.height * 2);
    
    return size;
}

+ (NSString *)addPrefixForPhoneImageUrl:(NSString *)imgUrl
{
    NSString * phoneUrl = imgUrl;
    if(phoneUrl.length)
    {
        NSArray * array = [phoneUrl componentsSeparatedByString:@"/"];
        NSString * fileName = [array lastObject];
        NSString * replaceName = [NSString stringWithFormat:@"phone/%@",fileName];
        phoneUrl = [phoneUrl stringByReplacingOccurrencesOfString:fileName withString:replaceName];
    }
    
    return phoneUrl;
}

@end
