//
//  AddTaskViewController.swift
//  ToDoList
//
//  Created by لمياء فالح الدوسري on 12/05/1443 AH.
//

import UIKit

class AddTaskViewController: UIViewController {

    var taskItem:String?
   var taskDiscrption:String?
    var taskDueDate:Date?
    var indexPath:NSIndexPath?

 
    @IBOutlet var textFiled: UITextField!
    @IBOutlet var discrpFiled: UITextField!

    weak var  delegate : addItemDeleget?
    
    
    var datevalue=""
    override func viewDidLoad() {
        super.viewDidLoad()
        textFiled.text=taskItem
        discrpFiled.text=taskDiscrption

       // let datePicker=UIDatePicker()
       // datePicker.datePickerMode = .date
      //  datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
       // datePicker.frame.size = CGSize(width: 0, height: 300)
       // datePicker.preferredDatePickerStyle = .wheels
       // datevalue = "\(datePicker)"
        
        // Do any additional setup after loading the view.
    }
    
 //   @objc func dateChange(datePicker : UIDatePicker){
        
  //  }
    
    @IBOutlet weak var dueDate: UIDatePicker!
    
    
    @IBAction func saveBtn(_ sender: UIButton) {
        let Text=textFiled.text!
        let date=dueDate.date
        let dis=discrpFiled.text!
        
        delegate?.saveItem(by: self,with:Text, with: date ,with:dis ,at:indexPath)
        //delegate?.cancleButtonPreesed(by: self)

    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
