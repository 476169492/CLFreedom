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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    
        // Do any additional setup after loading the view.
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
        if self.checkSearchBarWithContentText(self.menuSearchBar.text!)
        {
            
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
