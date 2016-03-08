//
//  CLRegularExpression.swift
//  CLFreedom
//  正则表达式
//  Created by chenlei on 16/3/7.
//  Copyright © 2016年 laosiji. All rights reserved.
//

import UIKit

enum InputType
{
    case account        //账户
    case password       //密码
    case username       //用户名
    case email          //电子邮件
    case mobile         //手机号
    case realname       //真实姓名
    case identifyCard   //身份证
    case contacts       //联系方式
    case checkcode      //验证码
    case bankcard       //银行卡,预约卡之类
    case nickName       //用户昵称
}

class CLRegularExpression: NSObject {
    
    //邮箱
    class func validateEmail(email:String) -> Bool
    {
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@",emailRegex)
        return emailTest.evaluateWithObject(email)
    }
    
    //手机号码校验
    class func vaildateMobile(mobile:String) -> Bool
    {
        //手机号码13,14,15,17,18开头, 八个 \d 数字字符
        let mobileRegex = "^((13[0-9])|(15[^4,\\D])|(14[0-9])|(17[0-9])|(18[0,0-9]))\\d{8}$"
        let mobileTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@",mobileRegex)
        return mobileTest.evaluateWithObject(mobile)
    }
    
    //身份证号
    class func calidateIdentityCard(cardNo:String) -> Bool
    {
        if cardNo.characters.count != 18
        {
          return false
        }
        else
        {
            
            let codeArray:NSArray = ["7","9","10","5","8","4","2","1","6","3","7","9","10","5","8","4","2"]
            let checkCodeDic:NSDictionary = [["0","1","2","3","4","5","6","7","8","9","10"]:["1","0","X","9","8","7","6","5","4","3","2"]]
            (cardNo as NSString).substringToIndex(17)
            
            let scan:NSScanner = NSScanner(string: (cardNo as NSString).substringToIndex(17))
           
            let isNum:Bool = CLCanNotUserSwift.isNumValidateIdentityCardWithScan(scan)
            
            if !isNum
            {
                return false
            }
            var sumValue = 0
            for var i = 0 ; i < 17 ; i++
            {
                sumValue += ((cardNo as NSString).substringWithRange(NSMakeRange(i, 1)) as NSString).integerValue * codeArray[i].integerValue
                
            }
            let strlast:String = checkCodeDic[String(sumValue%11)] as! String
            if strlast == (cardNo as NSString).substringWithRange(NSMakeRange(17, 1)).uppercaseString
            {
                return true
            }
            return false
            
            
            
            
           
            
            
            
            
            
            
            
            
            return true
        }
    }
    
    
//    //邮箱
//    + (BOOL) validateEmail:(NSString *)email;
//    //手机号码校验
//    + (BOOL) validateMobile:(NSString *)mobile;
//    //用户名
//    + (BOOL) validateUserName:(NSString *)name;
//    //密码
//    + (BOOL) validatePassword:(NSString *)passWord;
//    //昵称
//    + (BOOL) validateNickname:(NSString *)nickname;
//    //身份证号
//    + (BOOL) validateIdentityCard: (NSString *)identityCard;
//    //判断为纯数字
//    + (BOOL)isPureInt:(NSString*)string;
//    //判断设备型号
//    + (NSString*) doDevicePlatform;
//    //计算日期
//    +(NSString*)stringWithDateString:(NSString*)dateString;
//    +(NSString*)stringWithDateTimeString:(NSString*)dateString;
//    //过滤特殊字符
//    +(NSString*)trimCharacters:(NSString*)string;
//    
//    //随指贷专用真实姓名校验
//    + (BOOL) validateRealName:(NSString *)realName;
    
    
   
}
