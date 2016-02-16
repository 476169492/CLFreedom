//
//  CLCommonConst.swift
//  CLFreedom
//
//  Created by chenlei on 16/1/27.
//  Copyright © 2016年 laosiji. All rights reserved.
//

import Foundation

//设置-D DEBUG for the OTHER_SWIFT_FLAGS Debug build settings 亲测无效
#if !DEBUG
    func print(object: Any){}
#endif

class SZDLog {
    
    class func swiftLog(message: Any,function: String = __FUNCTION__, line: Int = __LINE__)
    {
        #if DEBUG
            print("😊__\(function)[Line \(line)]🈯️",message)
        #endif
    }
}


let UMengAppkey = "56c17dd4e0f55ac4e7000adb"



//获取设备的物理宽度
let ScreenWidth = UIScreen.mainScreen().bounds.size.width
//获取设备的物理高度
let ScreenHeight = UIScreen.mainScreen().bounds.size.height

//主色(蓝色)
let MAIN_COLOR = UIColor.hexStringToColor("329de9")
//辅助色(红色)
let ASSIST_COLOR = UIColor.hexStringToColor("fd3e25")
//页面背景色(浅灰色)
let BACKGROUND_COLOR = UIColor.hexStringToColor("f4f4f4")
//顶部nav.底部tab背景色(浅灰色)
let TABBAR_BARTINT_COLOR = UIColor.hexStringToColor("f7f9fb")
//主文字颜色
let MAIN_TEXT_COLOR = UIColor.hexStringToColor("333333")
//普通文字颜色
let COMMON_TEXT_COLOR = UIColor.hexStringToColor("666666")
//辅助文字颜色
let ASSIST_TEXT_COLOR = UIColor.hexStringToColor("999999")
//禁止色.分割线like line_heng的色值
let UNABLE_TEXT_COLOR = UIColor.hexStringToColor("d5d5d5")

//用在较为特殊的需要特别突出的文字(如借款记录页面)
let KFontOfSpecial = UIFont.systemFontOfSize(30.0)
//用在较重要的文字和按钮文字(如注册、登录、确认、取消等重要性按钮、导航栏
let KFontOfImportantOne = UIFont.systemFontOfSize(18.0)
//用在列表菜单文字(如更多页面)
let KFontOfImportantTwo = UIFont.systemFontOfSize(16.0)

//用于板块文字(特别适用于板块标题,如借款记录等页面)
let KFontOfGeneralOne = UIFont.systemFontOfSize(15.0)
//用于大多数文字(特别适用于大段的文字)
let KFontOfGeneralTwo = UIFont.systemFontOfSize(14.0)
//用于辅助性文字(如列表菜单的副标题、时间等)
let KFontOfGeneralThree = UIFont.systemFontOfSize(12.0)

//用于辅助性文字(如小按钮文字)
let KFontOfWeakerOne = UIFont.systemFontOfSize(11.0)
//用于辅助性文字(如底部tab icon文字等)
let KFontOfWeakerTwo = UIFont.systemFontOfSize(10.0)


//MainStoryBoard
let MAIN_SB = UIStoryboard(name: "Main", bundle: nil)

//登录注册StoryBoard
let LOGIN_SB = UIStoryboard(name: "LoginAndRegist", bundle: nil)

//其他StoryBoard
let COMMON_SB = UIStoryboard(name: "Common", bundle: nil)

//产品StoryBoard
let PRODUCT_SB = UIStoryboard(name: "Product", bundle: nil)

//个人中心StoryBoard
let MYCENTER_SB = UIStoryboard(name: "MyCenter", bundle: nil)
