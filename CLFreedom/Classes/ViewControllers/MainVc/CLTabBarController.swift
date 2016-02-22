//
//  CLTabBarController.swift
//  CLFreedom
//
//  Created by chenlei on 16/2/22.
//  Copyright © 2016年 laosiji. All rights reserved.
//

import UIKit

class CLTabBarController: UITabBarController,UITabBarControllerDelegate {
    
    
    var homeTableViewController:CLHomeTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logoutCleanData()
    }
    
    func logoutCleanData()
    {
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: USERID)
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: TOUCHID)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        if homeTableViewController != nil
        {
            if viewController == homeTableViewController
            {
                
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
