//
//  AddAccountTableViewController.swift
//  IOSFinal
//
//  Created by user_23 on 2017/1/7.
//  Copyright © 2017年 user_23. All rights reserved.
//

import UIKit

class AddAccountTableViewController: UITableViewController , UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var moneyTextField: UITextField!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    var datePicker : UIDatePicker!
    @IBAction func dateTextFieldEdit(_ sender: UITextField) {
        
        
        
            let datePickerView:UIDatePicker = UIDatePicker()
            
            datePickerView.datePickerMode = UIDatePickerMode.date
            
            sender.inputView = datePickerView
            
            datePickerView.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: .valueChanged)
    }
    
    
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        
        dateFormatter.timeStyle = .none
        
        dateTextField.text = dateFormatter.string(from: sender.date)
        
    }
    
    @IBAction func done(_ sender: Any) {
        print("\(nameTextField.text!) \(moneyTextField.text!) \(commentTextView.text!)")
        
        if nameTextField.text!.characters.count  == 0 {
            
            let controller = UIAlertController(title: "錯誤", message: "名稱尚未填寫", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(action)
            
            
            present(controller, animated: true, completion: nil)
            
            
            return
        }
        if moneyTextField.text!.characters.count == 0 {
            
            let controller = UIAlertController(title: "錯誤", message: "金額尚未填寫", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(action)
            
            
            present(controller, animated: true, completion: nil)
            
            
            return
        }
        if dateTextField.text!.characters.count == 0 {
            
            let controller = UIAlertController(title: "錯誤", message: "時間尚未填寫", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(action)
            
            
            present(controller, animated: true, completion: nil)
            
            
            return
        }
        
        //let image = selectPhotoBut.backgroundImage(for: .normal)
        
        
        //let data = UIImagePNGRepresentation(image!)
        
        //let fileManager = FileManager.default
        //let docUrls =
        //    fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        //let docUrl = docUrls.first
        //let url = docUrl?.appendingPathComponent("\(nameTextField.text!).png")
        
        
        //try? data?.write(to: url!)
        
        
        
        let dic = ["name":nameTextField.text!,
                   "money":moneyTextField.text!,
                   "date":dateTextField.text!,
                   "comment":commentTextView.text!]
        
        
        
        let notiName = Notification.Name("addAccount")
        NotificationCenter.default.post(name: notiName, object: nil, userInfo: dic)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
