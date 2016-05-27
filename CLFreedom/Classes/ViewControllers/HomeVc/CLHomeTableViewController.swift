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
    
    @IBOutlet weak var homeTableHeaderView: UIView!
    var myCycleScrollView:CycleScrollView?
    @IBOutlet weak var newsView: TYNewsView!
    
    //配置文件Array
    var imageNameArray:NSArray = NSArray()
    var newsArray:[String]! = []
    var serviceNameArray:[String] = []
    
    //MARK:viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.completeConfig()
        self.initMySubView()
    }
    
    //MARK:completeConfig
    func completeConfig()
    {
        self.newsArray = ["赵先生，北京市，提交了借款申请","钱先生，上海市，提交了借款申请","孙先生，广州市，提交了借款申请","李先生，深圳市，提交了借款申请"]
        self.imageNameArray = ["banner","banner","banner"]
        self.serviceNameArray = ["健康菜谱","身份证识别","Apple Pay","汽车报价","手表之家","IAP"]
    }
    
    //MARK:initMySubView
    func initMySubView()
    {
        //self.tableView.registerNib(UINib(nibName: "TODO", bundle: nil), forCellReuseIdentifier: "todo")
        self.initAutoScrollLabel()
        self.initCycleScrollView()
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
        for i in 0  ..< self.imageNameArray.count
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
        
        self.homeTableHeaderView.addSubview(myCycleScrollView!)
    }
    
    
    //MARK: TableView delegate dataSource
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("CLArticleBriefCell", forIndexPath: indexPath)
        return cell
    }
    
    
    //MARK: view show
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
        //这里是防止 中途卡顿的现象
        myCycleScrollView?.animationTimer.pauseTimer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
