//
//  AccountTableViewController.swift
//  IOSFinal
//
//  Created by user_23 on 2017/1/7.
//  Copyright © 2017年 user_23. All rights reserved.
//

import UIKit

class AccountTableViewController: UITableViewController {
    
    var isAddAccount = false
    
    var account = [[String:String]]()
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isAddAccount{
            isAddAccount = false
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
    }
    func updateFile(){
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("account.txt")
        let result = (account as NSArray).write(to: url!, atomically: true)
        //print("result \(result)")
    }
    
    func addAccountNoti(noti:Notification) {
        let dic = noti.userInfo as! [String:String]
        account.insert(dic, at: 0)
        
        updateFile()
        
        isAddAccount = true
        
        //self.tableView.reloadData()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let filemanager = FileManager.default
        let docUrls = filemanager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("account.txt")
        let array = NSArray(contentsOf: url!)
        if array != nil{
            account = array as! [[String:String]]
        }
        
        
        let notiName = Notification.Name("addAccount")
        NotificationCenter.default.addObserver(self, selector: #selector(AccountTableViewController.addAccountNoti(noti:)), name: notiName, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return account.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountTableViewCell
        let dic = account[indexPath.row]
        // Configure the cell...
        
        cell.dateLabel.text = dic["date"]
        cell.nameLabel.text = dic["name"]
        cell.moneyLabel.text = "$" + dic["money"]!
        //cell.nameLabel.text = dic["name"]
        //cell.starImageView.image = UIImage(named: dic["star"]!)
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        account.remove(at: indexPath.row)
        updateFile()
        
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        
        /*
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }   
        */
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetail" {
            let indexPath = self.tableView.indexPathForSelectedRow
            let dic:[String:String]
            dic = account[indexPath!.row]
            
            
            let controller = segue.destination as!
                AccountDetailViewController
            controller.accountInfoDic = dic
        }

    }
    

}
