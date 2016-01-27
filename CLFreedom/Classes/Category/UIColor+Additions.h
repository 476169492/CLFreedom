//
//  UIColor+Additions.h
//  ThumbLoan
//
//  Created by ios on 15/2/15.
//  Copyright (c) 2015年 zendai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Additions)
//颜色转换  such as  #1fcdae
+(UIColor *) hexStringToColor: (NSString *) stringToConvert;
@end
