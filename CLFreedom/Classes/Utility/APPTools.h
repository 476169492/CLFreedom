//
//  APPTools.h
//  ThumbLoan
//
//  Created by chenlei on 15/9/29.
//  Copyright © 2015年 zendai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@class APPTools;

@protocol APPToolsDelegate <NSObject>

- (void)locationWithCity:(NSString *)city;

@end

/**
 *  此类为"随指贷"项目中使用较多的方法的集合类
 */
@interface APPTools : NSObject

@property (assign,nonatomic) id<APPToolsDelegate>delegate;

//按照长度自动算显示时间
+ (void)showHudWithTextAutoCalculateShowTime:(NSString *)text;

/**
 *  随指贷主hud
 *
 *  @param view     hud添加到哪个view上
 *  @param animated 显示的时候是否伴有动画
 *  @param mengBan  显示的时候是否伴有蒙版  注意:(animated和mengban值相反解决闪烁问题)
 *
 *  @return hud 可用来调用hide方法
 */
+ (MBProgressHUD *)showCustomMainHudAddedTo:(UIView *)view animated:(BOOL)animated hasMengBan:(BOOL)mengBan;

/**
 *  300.00->300元  300.01->300.01元
 *
 *  @param originalMoney 保留俩位小数的字符串
 *
 *  @return xxx元
 */
+ (NSString *)becomeThumbLoanMoney:(NSString *)originalMoney;

//json转化字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

+ (UIWindow *)systemWindow;



@end
