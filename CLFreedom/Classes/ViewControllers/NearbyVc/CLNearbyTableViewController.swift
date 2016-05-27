//
//  CLNearbyTableViewController.swift
//  CLFreedom
//
//  Created by chenlei on 16/5/27.
//  Copyright © 2016年 laosiji. All rights reserved.
//

class CLNearbyTableViewController: UITableViewController,BMKPoiSearchDelegate {
    
    
    @IBOutlet weak var searchTableHeaderView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var searcher:BMKPoiSearch!
    
    var dateSource:NSMutableArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initSubView()
        self.initSearcher()
    }
    
    func initSubView()
    {
        self.tableView.addHeaderWithTarget(self, action: #selector(CLNearbyTableViewController.pullDownRefresh))
        self.tableView.addFooterWithTarget(self, action: #selector(CLNearbyTableViewController.pullUpRefresh))
    }
    
    func pullDownRefresh()
    {
        
    }
    
    func pullUpRefresh()
    {
        
    }
    
    func initSearcher()
    {
        //初始化检索对象
        self.searcher = BMKPoiSearch()
        self.searcher.delegate = self
        
        //发起检索
        let option:BMKNearbySearchOption = BMKNearbySearchOption()
        option.pageIndex = 1
        //31.2342116642525 lon:121.56586621642
        option.location = CLLocationCoordinate2DMake(31.234, 121.565)
        option.keyword = "小吃"
        let flag = searcher.poiSearchNearBy(option)
        if flag {
            SZDLog.swiftLog("周边检索发送成功")
        }else{
            SZDLog.swiftLog("周边检索发送失败")
        }
    }
    
    //实现PoiSearchDelegate处理回调结果
    func onGetPoiResult(searcher: BMKPoiSearch!, result poiResult: BMKPoiResult!, errorCode: BMKSearchErrorCode) {
        if errorCode == BMK_SEARCH_NO_ERROR {
            
            SZDLog.swiftLog(poiResult.poiInfoList)
            
            
            //在此处理正常结果
        }else if(errorCode == BMK_SEARCH_AMBIGUOUS_KEYWORD)
        {
            //当在设置城市未找到结果,但是其他城市找到结果时,回调建议检索城市列表
            //result.cityList
            SZDLog.swiftLog("起始点有歧义")
        }else{
            SZDLog.swiftLog("抱歉,未找到结果")
        }
        
        self.tableView.reloadData()
    }

    //不使用时将delegate设置为nil
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.searcher.delegate = nil
    }
    //使用的时候打开
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.searcher.delegate = self
    }
    
    
    func initMySubview()
    {
       self.searchTableHeaderView.backgroundColor = UIColor.redColor()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 115
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dateSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cellId", forIndexPath: indexPath)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
