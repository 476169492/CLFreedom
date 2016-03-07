//
//  CLHomeTableViewController.swift
//  CLFreedom
//  首页
//  Created by chenlei on 16/1/27.
//  Copyright © 2016年 laosiji. All rights reserved.
//

import UIKit

class CLHomeTableViewController: UITableViewController {
    
    let scrollInterval = 4.0
    //首页banner的Y值
    let myCycleScrollViewY:CGFloat = 20.0
    
    
    
    @IBOutlet weak var homeView: UIView!
    var myCycleScrollView:CycleScrollView?
    var autoScrollLabel:CBAutoScrollLabel?
    
    //配置文件Array
    var imageNameArray:NSArray = NSArray()
    var autoScrollLabelContentArray:[String] = []
    var serviceNameArray:[String] = []
    
    func clickActionButton(button:UIButton)
    {
        SZDLog.swiftLog(button.tag)
        if button.tag == 0
        {
            let menuSearchVc:CLMenuSearchViewController = Serve_SB.instantiateViewControllerWithIdentifier("CLMenuSearchViewController") as! CLMenuSearchViewController
            self.navigationController?.pushViewController(menuSearchVc, animated: true)
        }
        else if button.tag == 1
        {
            let idCardSerarchVc:UIViewController = UIViewController()
            self.navigationController?.pushViewController(idCardSerarchVc, animated: true)
        }
        else if button.tag == 2
        {
            let applePayVc:CLApplePayViewController = CLApplePayViewController()
            applePayVc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(applePayVc, animated: true)
        }
    }
    
    //MARK:viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.completeConfig()
        self.initMySubView()
    }
    
    //MARK:completeConfig
    func completeConfig()
    {
        self.imageNameArray = ["banner","banner","banner"]
        self.autoScrollLabelContentArray = ["赵经理响应了xxx的借款申请好给力啊","钱先生发出了一笔购房贷款,经理们迅速响应吧","贷款哪家强中国山东找蓝翔"]
        self.serviceNameArray = ["健康菜谱","身份证识别","去广告(Apple Pay)"]
    }
    
    //MARK:initMySubView
    func initMySubView()
    {
        self.initAutoScrollLabel()
        
        self.initCycleScrollView()
        
        self.initServiceView()
    }
    
    func initAutoScrollLabel()
    {
        var autoScrollContent:String = ""
        for var content in self.autoScrollLabelContentArray
        {
            content.appendContentsOf("   ")
            autoScrollContent.appendContentsOf(content)
        }
        self.autoScrollLabel = CBAutoScrollLabel(frame: CGRectMake(0,0,375,20))
        self.autoScrollLabel?.animationOptions = UIViewAnimationOptions.CurveLinear
        self.autoScrollLabel?.scrollDirection = CBAutoScrollDirectionRight
        self.autoScrollLabel?.scrollSpeed = 50.0
        self.autoScrollLabel?.pauseInterval = 0
        self.autoScrollLabel!.text = autoScrollContent
        self.autoScrollLabel?.textColor = MAIN_COLOR
        self.view.addSubview(self.autoScrollLabel!)
    }
    
    func initCycleScrollView()
    {
        //banner
        myCycleScrollView = CycleScrollView(frame: CGRectMake(0, myCycleScrollViewY, ScreenWidth, ScreenWidth * 2 / 5), animationDuration: scrollInterval)
        self.myCycleScrollView?.backgroundColor = UIColor.whiteColor()
        myCycleScrollView?.totalPagesCount = {
            () -> NSInteger in
            return self.imageNameArray.count
        }
        
        let bannerImageViewArray:NSMutableArray = NSMutableArray()
        for var i = 0 ; i < self.imageNameArray.count ; ++i
        {
            let defaultImageView:UIImageView = UIImageView(frame: CGRectMake(0, 0, ScreenWidth, ScreenWidth * 2 / 5))
            if i < self.imageNameArray.count
            {
                defaultImageView.image = UIImage(named: self.imageNameArray[i] as! String)
            }
            bannerImageViewArray.addObject(defaultImageView)
        }
        
        myCycleScrollView?.fetchContentViewAtIndex = {
            (pageIndex:NSInteger) -> UIView in
            
            return bannerImageViewArray[pageIndex] as! UIImageView
        }
        
        self.homeView.addSubview(myCycleScrollView!)
    }
    
    func initServiceView()
    {
        let dynLineCount:NSInteger = self.serviceNameArray.count/4 + (((self.serviceNameArray.count%4) == 0) ? 0 : 1)
        let subViewWidthAndHeight:CGFloat = ScreenWidth/4
        
        let serceView:UIView = UIView(frame: CGRectMake(0,myCycleScrollView!.frame.origin.y + myCycleScrollView!.frame.size.height,ScreenWidth,subViewWidthAndHeight * CGFloat(dynLineCount)))
        self.homeView.addSubview(serceView)
        
        //nameLabel actionButton
        for var i  = 0 ; i < self.serviceNameArray.count ; i++
        {
            let subView:UIView = UIView(frame: CGRectMake(CGFloat(i%4) * subViewWidthAndHeight,CGFloat(i/4) * subViewWidthAndHeight,subViewWidthAndHeight,subViewWidthAndHeight))
            let namelable:UILabel = UILabel(frame:CGRectMake(0,0,subViewWidthAndHeight,20))
            namelable.center = CGPointMake(subViewWidthAndHeight/2, subViewWidthAndHeight/2)
            namelable.text = self.serviceNameArray[i]
            namelable.font = KFontOfGeneralTwo
            namelable.textColor = COMMON_TEXT_COLOR
            namelable.textAlignment = NSTextAlignment.Center
            subView.addSubview(namelable)
            
            let actionButton:UIButton = UIButton(type: UIButtonType.Custom)
            actionButton.frame = CGRectMake(0, 0, subViewWidthAndHeight, subViewWidthAndHeight)
            actionButton.tag = i
            actionButton.addTarget(self, action: "clickActionButton:", forControlEvents: UIControlEvents.TouchUpInside)
            subView.addSubview(actionButton)
        
            serceView.addSubview(subView)
        }
        //横竖线
        for var i = 0 ; i < dynLineCount ; i++
        {
            let hengLineView:UIView = UIView(frame: CGRectMake(0,CGFloat(i + 1) * subViewWidthAndHeight,ScreenWidth,0.5))
            hengLineView.backgroundColor = ASSIST_TEXT_COLOR
            serceView.addSubview(hengLineView)
        }
        
        for var i = 0 ; i < 4 ; i++
        {
            let shuLineView:UIView = UIView(frame: CGRectMake(CGFloat(i + 1) * subViewWidthAndHeight,0,0.5,subViewWidthAndHeight * CGFloat(dynLineCount)))
            shuLineView.backgroundColor = ASSIST_TEXT_COLOR
            serceView.addSubview(shuLineView)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        myCycleScrollView?.animationTimer.resumeTimerAfterTimeInterval(scrollInterval-1.0)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        myCycleScrollView?.animationTimer.pauseTimer()  //这里是防止 中途卡顿的现象
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
