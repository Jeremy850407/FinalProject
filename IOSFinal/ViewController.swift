//
//  ViewController.swift
//  IOSFinal
//
//  Created by user_23 on 2017/1/7.
//  Copyright © 2017年 user_23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var averageSpend: UILabel!
    var account = [[String:String]]()
    var totalSpend = 0
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let filemanager = FileManager.default
        let docUrls = filemanager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("account.txt")
        let array = NSArray(contentsOf: url!)
        if array != nil{
            account = array as! [[String:String]]
        }
        for name in account{
            //print("\(name["name"])")
            //print("\(name["money"])")
            if Int(name["money"]!) != nil{
                totalSpend += Int(name["money"]!)!
            }
            
            //count += (name["money"] as NSString).integerValue
            count = count + 1
        }
        infoLabel.text! = String(totalSpend) + "元"
        averageSpend.text! = String(round(Double(totalSpend)/Double(count) * 100) / 100) + "元"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

