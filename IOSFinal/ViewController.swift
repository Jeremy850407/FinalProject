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
    var big = 0
    var index = 0
    var spend = 0
    
    @IBOutlet weak var topdateLabel: UILabel!
    @IBOutlet weak var topNameLabel: UILabel!
    @IBOutlet weak var topMoneyLabel: UILabel!
    var bigSpend:[String:String]!
    
    
    override func viewWillAppear(_ animated: Bool) {
       
        viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalSpend = 0
        count = 0
        big = 0
        index = 0
        spend = 0
        let filemanager = FileManager.default
        let docUrls = filemanager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("account.txt")
        let array = NSArray(contentsOf: url!)
        if array != nil{
            account = array as! [[String:String]]
        }
        else{
            topdateLabel.text = "n/a"
            topNameLabel.text = "n/a"
            topMoneyLabel.text = "n/a"
            index = -1
        }
        for name in account{
            //print("\(name["name"])")
            //print("\(name["money"])")
            if Int(name["money"]!) != nil{
                spend = Int(name["money"]!)!
                totalSpend += spend
            }
            
            //count += (name["money"] as NSString).integerValue
            count = count + 1
            if spend > big{
                big = spend
                index = count - 1
            }
        }
        infoLabel.text! = String(totalSpend) + "元"
        averageSpend.text! = String(round(Double(totalSpend)/Double(count) * 100) / 100) + "元"
        if index != -1{
            bigSpend = account[index]
            topdateLabel.text = bigSpend["date"]!
            topNameLabel.text = bigSpend["name"]!
            topMoneyLabel.text = bigSpend["money"]! + "元"
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

