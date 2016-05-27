//
//  AppDelegate.swift
//  CLFreedom
//
//  Created by chenlei on 16/1/27.
//  Copyright © 2016年 laosiji. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,GeTuiSdkDelegate{
    
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //1.个推
        self.initGeTui(launchOptions)
        
        //2.UMeng
        //UMSocialData.setAppKey(UMeng_APP_KEY)
        //UMSocialWechatHandler.setWXAppId(weChatAppId, appSecret: weChatAppSecret, url: UMeng_SHARE_URL)

        return true
    }
    
    func initGeTui(launchOptions:[NSObject: AnyObject]?)
    {
        //启动Sdk
        GeTuiSdk.startSdkWithAppId(KGT_APP_ID, appKey: KGT_APP_KEY, appSecret: KGT_APP_SECRET, delegate: self)
        //注册APNS
        self.registerUserNotification()
        //处理远程通知启动APP
        self.receiveNotificationByLaunchingOptions(launchOptions)
    }

    func registerUserNotification()
    {
        let uns = UIUserNotificationSettings(forTypes: [.Badge, .Sound, .Alert], categories: nil)
        UIApplication.sharedApplication().registerForRemoteNotifications()
        UIApplication.sharedApplication().registerUserNotificationSettings(uns)
    }
    
    func receiveNotificationByLaunchingOptions(hehe:[NSObject:AnyObject]?)
    {
        
    }

    //远程通知注册成功委托
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        var myToken = deviceToken.description.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "<>"))
        myToken = myToken.stringByReplacingOccurrencesOfString(" ", withString: "")
        
        GeTuiSdk.registerDeviceToken(myToken)
        
        SZDLog.swiftLog("myToken = :" + myToken)
    }
    
    //远程通知注册失败委托
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        GeTuiSdk.registerDeviceToken("")
        SZDLog.swiftLog("远程通知注册失败")
    }
    
    
    /** APP已经接收到“远程”通知(推送) - 透传推送消息  */
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
      //  处理APNs代码，通过userInfo可以取到推送的信息（包括内容，角标，自定义参数等）。如果需要弹窗等其他操作，则需要自行编码。
        SZDLog.swiftLog("Receive RemoteNotification - Backgorund")
        SZDLog.swiftLog(userInfo)
        
        completionHandler(UIBackgroundFetchResult.NewData)
    }
    
    func application(application: UIApplication, performFetchWithCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        
        GeTuiSdk.resume()
        completionHandler(UIBackgroundFetchResult.NewData)
    }
    
    //使用个推SDK透传消息, 由个推通道下发 (非APNS)
    func GeTuiSdkDidReceivePayload(payloadId: String!, andTaskId taskId: String!, andMessageId aMsgId: String!, andOffLine offLine: Bool, fromApplication appId: String!) {
    }
    
    //SDK启动成功返回cid
    func GeTuiSdkDidRegisterClient(clientId: String!) {
        SZDLog.swiftLog("个推SDK启动注册成功clientId = :" + clientId)
    }
    
    //SDK遇到错误回调
    func GeTuiSdkDidOccurError(error: NSError!) {
        
        //个推错误报告,集成步骤发生的任何错误都在这里通知，如果集成后，无法正常收到消息，查看这里的通知
        SZDLog.swiftLog("个推SDK遇到错误如下")
        SZDLog.swiftLog(error.description)
    }
//    
//    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
//        return UMSocialSnsService.handleOpenURL(url)
//    }
//    
//    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
//        return UMSocialSnsService.handleOpenURL(url)
//    }

    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

