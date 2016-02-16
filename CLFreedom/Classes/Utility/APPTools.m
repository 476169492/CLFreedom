//
//  APPTools.m
//  ThumbLoan
//
//  Created by chenlei on 15/9/29.
//  Copyright © 2015年 zendai. All rights reserved.
//

#import "APPTools.h"

@implementation APPTools

+ (void)showHudWithTextAutoCalculateShowTime:(NSString *)text
{
    NSUInteger length = text.length;
    CGFloat showTime = (length/4) + ((length%4)?1:0);
    
    [self showHudWithTitle:nil message:text afterDlay:showTime];
    
}

+ (void)showHudWithTextOnly:(NSString *)text
{
    [self showHudWithTitle:nil message:text afterDlay:1.0];
}

+ (void)showHudWithTextOnly_1Point8:(NSString *)text
{
    [self showHudWithTitle:nil message:text afterDlay:1.8];
}

+ (void)showHudWithTextOnly:(NSString *)text afterDlay:(NSInteger)interval
{
    [self showHudWithTitle:nil message:text afterDlay:interval];
}

+ (void)showHudWithTitle:(NSString *)title message:(NSString *)message afterDlay:(NSInteger)interval
{
    [MBProgressHUD hideAllHUDsForView:[self systemWindow] animated:NO]
    ;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[self systemWindow] animated:YES];
    
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.userInteractionEnabled = NO;
    hud.labelText = title;
    hud.detailsLabelText = message;
    
    hud.margin = 10.f;
    // 长方形提示文本y位置.下面的afterDelay是提示文本显示的时间.
    hud.yOffset = -45.f;
    hud.removeFromSuperViewOnHide = YES;
    [[self systemWindow] bringSubviewToFront:hud];
    [hud hide:YES afterDelay:interval];
}

+ (UIWindow *)systemWindow
{
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    if (!window) {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    return window;
}

+ (MBProgressHUD *)showCustomMainHudAddedTo:(UIView *)view animated:(BOOL)animated hasMengBan:(BOOL)mengBan
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    [hud show:animated];
    
    hud.mode = MBProgressHUDModeCustomView;
    hud.color = [UIColor clearColor];
    hud.margin = 0;
    UIImageView * myhudImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 52)];
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    backView.backgroundColor = BACKGROUND_COLOR;
    
    NSArray *array = [NSArray arrayWithObjects:
                      [UIImage imageNamed:@"customHUD1"],
                      [UIImage imageNamed:@"customHUD2"],
                      [UIImage imageNamed:@"customHUD3"],
                      [UIImage imageNamed:@"customHUD4"],
                      [UIImage imageNamed:@"customHUD5"],
                      [UIImage imageNamed:@"customHUD6"],
                      [UIImage imageNamed:@"customHUD7"],
                      [UIImage imageNamed:@"customHUD8"],
                      [UIImage imageNamed:@"customHUD9"],
                      [UIImage imageNamed:@"customHUD10"],
                      nil];
    [myhudImageView setAnimationImages:array];
    [myhudImageView setAnimationDuration:0.5];
    [myhudImageView setAnimationRepeatCount:0];
    [myhudImageView  startAnimating];
    if (mengBan)
    {
        myhudImageView.center = backView.center;
        [backView addSubview:myhudImageView];
        hud.customView = backView;
    }
    else
    {
        hud.customView = myhudImageView;
        
    }
    
    return hud;
}

+ (NSString *)becomeThumbLoanMoney:(NSString *)originalMoney
{
    if ([[originalMoney componentsSeparatedByString:@"."][1] isEqualToString:@"00"]) {
        return  [NSString stringWithFormat:@"%@元",[originalMoney componentsSeparatedByString:@"."][0]];
    }
    else
    {
        return [NSString stringWithFormat:@"%@元",originalMoney];
    }
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        TLLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}



@end
