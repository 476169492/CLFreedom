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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
