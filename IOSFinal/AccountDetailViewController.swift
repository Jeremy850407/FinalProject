//
//  AccountDetailViewController.swift
//  IOSFinal
//
//  Created by user_23 on 2017/1/7.
//  Copyright © 2017年 user_23. All rights reserved.
//

import UIKit

class AccountDetailViewController: UIViewController {

    var accountInfoDic:[String:String]!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = accountInfoDic["name"]!
        moneyLabel.text = accountInfoDic["money"]!
        dateLabel.text = accountInfoDic["date"]!
        commentLabel.text = accountInfoDic["comment"]!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "edit" {
            
            
            let controller = segue.destination as!
            AddAccountTableViewController
            //controller.edit = accountInfoDic
            
        }

    }
    */

}
