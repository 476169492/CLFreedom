//
//  CLSettingTableViewController.swift
//  CLFreedom
//  设置(放置一些实质性的功能性方便项目)
//  Created by chenlei on 16/2/22.
//  Copyright © 2016年 laosiji. All rights reserved.
//

import UIKit
import LocalAuthentication

class CLSettingTableViewController: UITableViewController{
    
    
    @IBOutlet weak var fingerprintSwitch: UISwitch!
    
    
    @IBAction func clickFingerprintSwitch(sender: UISwitch) {
    
        if sender.on
        {
          //  APPTools.showHudWithTextAutoCalculateShowTime("打开指纹密码登录")
        }
        else
        {
         //   APPTools.showHudWithTextAutoCalculateShowTime("关闭指纹密码登录")
        }
        
         self.showFingerprintAlertView()
    }
    
    
    func showFingerprintAlertView()
    {
        let content:LAContext = LAContext()
        var error:NSError?
        if content.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error)
        {
            content.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "请验证已有指纹", reply: { (success, error) -> Void in
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if error != nil
                    {
                        if error!.code  == 2 // LAErrorUserFallback
                        {
                           // UIAlertView.
                         _ =  UIAlertView(title: "提醒", message: "因为您无法验证指纹解锁需要您重新登录", cancelButtonTitle: "取消", otherButtonTitles: ["确定"], onDismiss: { (buttonIndex) -> Void in
                            
                            
                            }, onCancel: { () -> Void in
                                
                          })
                        }
                        
                    }
                    else
                    {
                        APPTools.showHudWithTextAutoCalculateShowTime("登录成功")
                    }
                })
                
            })
        }
    }
    
//    LAContext *context = [[LAContext alloc] init];
//    NSError *error = nil;
//    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
//    
//    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
//    localizedReason:@"请验证已有指纹"
//    reply:^(BOOL success, NSError *error) {
//    dispatch_async(dispatch_get_main_queue(), ^{
//    if (error) {
//    if (error.code == LAErrorUserFallback)
//    {
//    [UIAlertView alertViewWithTitle:@"提醒" message:@"因为您无法验证指纹解锁需要您重新登录!" cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] onDismiss:^(int buttonIndex) {
//    [self dismissViewControllerAnimated:YES completion:^{
//    
//    [[TLTabBarViewController sharedTabBar] logoutCleanData];
//    }];
//    
//    } onCancel:nil];
//    }
//    return;
//    }
//    if (success)
//    {
//    //   [self dismiss:0.15];
//    
//    [self dismissViewControllerAnimated:YES completion:^{
//    [self.delegate fingerprintUnlockDidSucceedWithVc:self];
//    }];
//    
//    
//    
//    } else {
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误"
//    message:@"您不是设备的主人!"
//    delegate:nil
//    cancelButtonTitle:@"确认"
//    otherButtonTitles:nil];
//    [alert show];
//    }
//    });
//    }];
//    }
//    else
//    {
//    //这里可以有俩种选择
//    //1.第一种用户去系统设置一下指纹密码(selected)
//    //2.第二种用户在设置中验证过指纹密码之后取消后才会跳到这里,这里可以帮用户登出(支付宝做法)但是用户体验不怎么好
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒"
//    message:@"请先确认您的设备是否支持touchId,如果支持请您先在手机系统设置中设置您的指纹密码后再经行操作"
//    delegate:nil
//    cancelButtonTitle:@"确认"
//    otherButtonTitles:nil];
//    [alert show];
//    }

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }




}
