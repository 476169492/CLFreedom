//
//  CLWatchDetailsTableViewController.swift
//  CLFreedom
//  手表详情
//  Created by chenlei on 16/3/9.
//  Copyright © 2016年 laosiji. All rights reserved.
//

import UIKit

class CLWatchDetailsTableViewController: UITableViewController,UMSocialUIDelegate {
    
    @IBOutlet weak var watchImageView: UIImageView!
    @IBOutlet weak var watchNameLabel: UILabel!
    @IBOutlet weak var watchIntroLabel: UILabel!
    @IBOutlet weak var watchShareButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.watchShareButton.layer.cornerRadius = 5.0

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    @IBAction func clickShareButton(sender: AnyObject)
    {
        //注意：分享到微信好友、微信朋友圈、微信收藏、QQ空间、QQ好友、来往好友、来往朋友圈、易信好友、易信朋友圈、Facebook、Twitter、Instagram等平台需要参考各自的集成方法
//        [UMSocialSnsService presentSnsIconSheetView:self
//            appKey:@"507fcab25270157b37000010"
//        shareText:@"你要分享的文字"
//        shareImage:[UIImage imageNamed:@"icon.png"]
//        shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToWechatSession,UMShareToQQ,nil]
//        delegate:self];
        
        
        UMSocialSnsService.presentSnsIconSheetView(self, appKey: UMeng_APP_KEY, shareText: "老司机带带我一个神奇的app", shareImage: UIImage(named: "my"), shareToSnsNames: [UMShareToQQ,UMShareToWechatTimeline,UMShareToWechatSession,UMShareToWechatFavorite], delegate: self)
        
        
    }
    
    //MARK: UMENG 委托
    func isDirectShareInIconActionSheet() -> Bool {
        return true
    }
    
    func didFinishGetUMSocialDataInViewController(response: UMSocialResponseEntity!) {
        if response.responseCode == UMSResponseCodeSuccess
        {
            SZDLog.swiftLog(response.data)
        }
    }
    
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}
