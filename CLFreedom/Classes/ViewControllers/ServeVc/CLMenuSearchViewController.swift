//
//  CLMenuSearchViewController.swift
//  CLFreedom
//  查询菜谱vc
//  Created by chenlei on 16/2/16.
//  Copyright © 2016年 laosiji. All rights reserved.
//

import UIKit

class CLMenuSearchViewController: UIViewController,UISearchBarDelegate{
    
    
    @IBOutlet weak var menuSearchBar: UISearchBar!
    
    @IBAction func tapGes(sender: AnyObject)
    {
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    
        // Do any additional setup after loading the view.
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        if self.checkSearchBarWithContentText(self.menuSearchBar.text!)
        {
            self.menuSearchBar.resignFirstResponder()
            
           // let sessionManager:AFHTTPSessionManager = AFHTTPSessionManager(baseURL:NSURL(string: "11"))
            
            CLNetWorkCenter.sharedNetWorkCenter().getMenuDetailsWithName("宫保鸡丁", completion: { (error, resultDic) -> Void in
                
                
                
                
            })
        
            
            
            
            
            
            
            
            let menuDetailsTableVc:CLMenuDetailsTableViewController = Serve_SB.instantiateViewControllerWithIdentifier("CLMenuDetailsTableViewController") as! CLMenuDetailsTableViewController
            self.navigationController?.pushViewController(menuDetailsTableVc, animated: true)
            
            
            
        }
    }
    
    func checkSearchBarWithContentText(text:String) -> Bool
    {
        if text.isEmpty
        {
           APPTools.showHudWithTextAutoCalculateShowTime("亲!搜索内容不能为空哦")
            
            
            return false
        }
        return true
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
