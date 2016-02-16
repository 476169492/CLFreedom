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
    
    @IBOutlet weak var homeView: UIView!
    var myCycleScrollView:CycleScrollView?
    
    var imageArray:NSArray = NSArray()
    
    
    
    @IBAction func clickTestButton(sender: UIButton) {
        
        let toVc:UIViewController = UIViewController()
        toVc.title = "toVc"
        toVc.view.backgroundColor = UIColor.redColor()
        
        self.transitionFromViewController(self, toViewController: self, duration: 5, options: UIViewAnimationOptions.LayoutSubviews, animations: { () -> Void in
            
            }) { (finished) -> Void in
                
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.imageArray = ["AppIcon","AppIcon","AppIcon"]
        
        self.initMySubView()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        myCycleScrollView?.animationTimer.resumeTimerAfterTimeInterval(scrollInterval-1.0)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        myCycleScrollView?.animationTimer.pauseTimer()
    }
    
    func initMySubView()
    {
        //滚动View
        myCycleScrollView = CycleScrollView(frame: CGRectMake(0, 0, ScreenWidth, ScreenWidth * 2 / 5), animationDuration: scrollInterval)
        self.myCycleScrollView?.backgroundColor = UIColor.purpleColor().colorWithAlphaComponent(0.1)
        myCycleScrollView?.totalPagesCount = {
            () -> NSInteger in
            return self.imageArray.count
        }
        
        
        for var i = 0 ; i < self.imageArray.count ; ++i
        {
            myCycleScrollView?.fetchContentViewAtIndex = {
                (pageIndex:NSInteger) -> UIView in
                
                let defaultImageView:UIImageView = UIImageView(frame: CGRectMake(0, 0, ScreenWidth, ScreenWidth * 2 / 5))
                
                if i < self.imageArray.count
                {
                    defaultImageView.image = UIImage(named: self.imageArray[i] as! String)
                }
                
                return defaultImageView
                
            }
        }
        self.homeView.addSubview(myCycleScrollView!)
        
        
        //服务项View
        let serveCount:NSArray = ["健康菜谱","身份证识别"]
        
        let dynLineCount:NSInteger = serveCount.count/4 + (((serveCount.count%4) == 0) ? 0 : 1)
        let subViewWidthAndHeight:CGFloat = ScreenWidth/4
        
        let serceView:UIView = UIView(frame: CGRectMake(0,myCycleScrollView!.frame.origin.y + myCycleScrollView!.frame.size.height,ScreenWidth,subViewWidthAndHeight * CGFloat(dynLineCount)))
        self.homeView.addSubview(serceView)
        
        
        
        for var i  = 0 ; i < serveCount.count ; i++
        {
            let subView:UIView = UIView(frame: CGRectMake(CGFloat(i%4) * subViewWidthAndHeight,CGFloat(i/4) * subViewWidthAndHeight,subViewWidthAndHeight,subViewWidthAndHeight))
            let namelable:UILabel = UILabel(frame:CGRectMake(0,0,subViewWidthAndHeight,20))
            namelable.center = CGPointMake(subViewWidthAndHeight/2, subViewWidthAndHeight/2)
            namelable.text = serveCount[i] as? String
            namelable.textColor = COMMON_TEXT_COLOR
            namelable.textAlignment = NSTextAlignment.Center
            subView.addSubview(namelable)
            
            serceView.addSubview(subView)
            
            for var i = 0 ; i < dynLineCount ; i++
            {
                let hengLineView:UIView = UIView(frame: CGRectMake(0,CGFloat(i + 1) * subViewWidthAndHeight,ScreenWidth,0.5))
                hengLineView.backgroundColor = ASSIST_TEXT_COLOR
                subView.addSubview(hengLineView)
            }
            
            for var i = 0 ; i < 4 ; i++
            {
                let shuLineView:UIView = UIView(frame: CGRectMake(CGFloat(i + 1) * subViewWidthAndHeight,0,0.5,subViewWidthAndHeight * CGFloat(dynLineCount)))
                shuLineView.backgroundColor = ASSIST_TEXT_COLOR
                subView.addSubview(shuLineView)
            }
            
        }
    }
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
