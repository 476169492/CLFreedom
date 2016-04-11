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
    let myCycleScrollViewY:CGFloat = 30.0
    
    @IBOutlet weak var homeView: UIView!
    var myCycleScrollView:CycleScrollView?
    @IBOutlet weak var newsView: TYNewsView!
    
    //配置文件Array
    var imageNameArray:NSArray = NSArray()
    var newsArray:[String]! = []
    var serviceNameArray:[String] = []
    
    var remoteNotState:Bool = true
    
    
    
    @IBAction func clickOpenOrCloseRemoteNot(sender: AnyObject)
    {
        self.remoteNotState = !self.remoteNotState
        if self.remoteNotState
        {
            APPTools.showHudWithTextAutoCalculateShowTime("开启推送了")
            let uns = UIUserNotificationSettings(forTypes: [.Badge, .Sound, .Alert], categories: nil)
            UIApplication.sharedApplication().registerForRemoteNotifications()
            UIApplication.sharedApplication().registerUserNotificationSettings(uns)
        }
        else
        {
            APPTools.showHudWithTextAutoCalculateShowTime("关闭推送了")
             UIApplication.sharedApplication().unregisterForRemoteNotifications()
        }
    }
    
    
    
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
        else if button.tag == 3
        {
            
        }
        else if button.tag == 4
        {
            let watchDetails:CLWatchDetailsTableViewController = Serve_SB.instantiateViewControllerWithIdentifier("CLWatchDetailsTableViewController") as! CLWatchDetailsTableViewController
            watchDetails.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(watchDetails, animated: true)
        }
    }
    
    //MARK:viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.completeConfig()
        self.initMySubView()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.newsView.startAnimation()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        myCycleScrollView?.animationTimer.resumeTimerAfterTimeInterval(scrollInterval-1.0)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        
        self.newsView.stopAnimation()
        myCycleScrollView?.animationTimer.pauseTimer()  //这里是防止 中途卡顿的现象
        
    }

    //MARK:completeConfig
    func completeConfig()
    {
         self.newsArray = ["赵先生，北京市，提交了借款申请","钱先生，上海市，提交了借款申请","孙先生，广州市，提交了借款申请","李先生，深圳市，提交了借款申请"]
        self.imageNameArray = ["banner","banner","banner"]
        self.serviceNameArray = ["健康菜谱","身份证识别","Apple Pay","汽车报价","手表之家"]
        
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
        self.newsView.setNewsImageName("TODO")
        self.newsView.setNewArray(self.newsArray) { (index) -> Void in
            
        }
        self.newsView.setNewsFont(KFontOfGeneralTwo)
        self.newsView.setNewsTextColor(COMMON_TEXT_COLOR)
        self.newsView.setAnimationTimerInterval(2)
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
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
