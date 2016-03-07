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
    
    var imageArray:NSArray = NSArray()
    
    var index:NSInteger = 0
    
    var autoScrollLabel:CBAutoScrollLabel?
    
    var autoScrollLabelContentArray:[String] = ["赵经理响应了xxx的借款申请好给力啊","钱先生发出了一笔购房贷款,经理们迅速响应吧","贷款哪家强中国山东找蓝翔"]
    
    @IBAction func clickTestButton(sender: UIButton) {
        
        let toVc:UIViewController = UIViewController()
        toVc.title = "toVc"
        toVc.view.backgroundColor = UIColor.redColor()
        
        self.transitionFromViewController(self, toViewController: self, duration: 5, options: UIViewAnimationOptions.LayoutSubviews, animations: { () -> Void in
            
            }) { (finished) -> Void in
                
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
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageArray = ["banner","banner","banner"]
        
       
        
        self.initMySubView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        myCycleScrollView?.animationTimer.resumeTimerAfterTimeInterval(scrollInterval-1.0)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        myCycleScrollView?.animationTimer.pauseTimer()  //这里是防止 中途卡顿的现象
        
    }
    
    func initMySubView()
    {
        var autoScrollContent:String = ""
        for var content in self.autoScrollLabelContentArray
        {
            content.appendContentsOf("🈯️🈯️🈯️")
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
    
        
        //banner
        myCycleScrollView = CycleScrollView(frame: CGRectMake(0, myCycleScrollViewY, ScreenWidth, ScreenWidth * 2 / 5), animationDuration: scrollInterval)
        self.myCycleScrollView?.backgroundColor = UIColor.whiteColor()
        myCycleScrollView?.totalPagesCount = {
            () -> NSInteger in
            return self.imageArray.count
        }
        
        let bannerImageViewArray:NSMutableArray = NSMutableArray()
        for var i = 0 ; i < self.imageArray.count ; ++i
        {
            let defaultImageView:UIImageView = UIImageView(frame: CGRectMake(0, 0, ScreenWidth, ScreenWidth * 2 / 5))
            if i < self.imageArray.count
            {
                defaultImageView.image = UIImage(named: self.imageArray[i] as! String)
            }
            bannerImageViewArray.addObject(defaultImageView)
        }
        
        myCycleScrollView?.fetchContentViewAtIndex = {
            (pageIndex:NSInteger) -> UIView in
            
            return bannerImageViewArray[pageIndex] as! UIImageView
            
        }

        self.homeView.addSubview(myCycleScrollView!)
        
        
        //服务项View
        let serveCount:NSArray = ["健康菜谱","身份证识别","Apple Pay"]
        
        let dynLineCount:NSInteger = serveCount.count/4 + (((serveCount.count%4) == 0) ? 0 : 1)
        let subViewWidthAndHeight:CGFloat = ScreenWidth/4
        
        let serceView:UIView = UIView(frame: CGRectMake(0,myCycleScrollView!.frame.origin.y + myCycleScrollView!.frame.size.height,ScreenWidth,subViewWidthAndHeight * CGFloat(dynLineCount)))
        self.homeView.addSubview(serceView)
        
        //nameLabel actionButton
        for var i  = 0 ; i < serveCount.count ; i++
        {
            let subView:UIView = UIView(frame: CGRectMake(CGFloat(i%4) * subViewWidthAndHeight,CGFloat(i/4) * subViewWidthAndHeight,subViewWidthAndHeight,subViewWidthAndHeight))
            let namelable:UILabel = UILabel(frame:CGRectMake(0,0,subViewWidthAndHeight,20))
            namelable.center = CGPointMake(subViewWidthAndHeight/2, subViewWidthAndHeight/2)
            namelable.text = serveCount[i] as? String
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
