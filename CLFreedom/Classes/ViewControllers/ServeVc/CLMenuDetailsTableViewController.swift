//
//  CLMenuDetailsTableViewController.swift
//  CLFreedom
//  菜单详情
//  Created by chenlei on 16/2/16.
//  Copyright © 2016年 laosiji. All rights reserved.
//

import UIKit

class CLMenuDetailsTableViewController: UITableViewController {
    
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "自定义TODO"

    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
   override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 300
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("menuDetailsCellId", forIndexPath: indexPath)
        
        
        return cell
    }
    
     

}
