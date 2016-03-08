//
//  CLSystem.swift
//  CLFreedom
//
//  Created by chenlei on 16/3/7.
//  Copyright © 2016年 laosiji. All rights reserved.
//

import UIKit

class CLSystem: NSObject {
    
    /********系统********/
    class func isIOS8Later() -> Bool  //include
    {
        return UIDevice.currentDevice().systemVersion.compare("8.0") != NSComparisonResult.OrderedAscending
    }
    
    class func isIOS9Later() -> Bool
    {
       return UIDevice.currentDevice().systemVersion.compare("9.0") != NSComparisonResult.OrderedAscending
    }
    
    class func isIOS8Early() -> Bool  //don't include
    {
        return !self.isIOS8Later()
    }
    
    class func isIOS9Early() -> Bool
    {
        return !self.isIOS9Later()
    }
    
    /*******型号********/
    class func isIphone35Inch() -> Bool
    {
        return (UIScreen.mainScreen().bounds.size == CGSizeMake(640, 960)) ? true : false
    }
    
    class func isIphone4Inch() -> Bool
    {
        return (UIScreen.mainScreen().bounds.size == CGSizeMake(640, 1136)) ? true : false
    }
    
    class func isIphone47Inch() -> Bool
    {
         return (UIScreen.mainScreen().bounds.size == CGSizeMake(750, 1334)) ? true : false
    }
    
    class func isIphone55Inch() -> Bool
    {
         return (UIScreen.mainScreen().bounds.size == CGSizeMake(1242, 2208)) ? true : false
    }
    
    /********Device Info********/
    class func systemVersion()  -> String
    {
        return UIDevice.currentDevice().systemVersion
    }
    
    class func UUID() -> String
    {
         return (UIDevice.currentDevice().identifierForVendor?.UUIDString)!
    }
    
    class func isPhone() -> Bool
    {
        let model:String = UIDevice.currentDevice().model
        var result:Bool = false
        if model.containsString("iPhone")
        {
            result = true
        }
        return result
    }
    
    class func isPad() -> Bool
    {
        let model:String =  UIDevice.currentDevice().model
        var result:Bool = false
        if model.containsString("iPad")
        {
            result = true
        }
        return result
    }
    
    /********APP Info********/
    class func appShortVersion() -> String
    {
        let shortVersion:String = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersion"] as! String
        return shortVersion
    }
 
    class func appVersion() -> String
    {
        let version:String = NSBundle.mainBundle().infoDictionary!["CFBundleVersion"] as! String
        return version
    }
    
    class func appIdentifier() -> String
    {
        let idendtfier:String = NSBundle.mainBundle().infoDictionary!["CFBundleIdentifier"] as! String
        return idendtfier
    }

    
    
    
}
