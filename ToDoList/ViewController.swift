//
//  ViewController.swift
//  ToDoList
//
//  Created by لمياء فالح الدوسري on 12/05/1443 AH.
//

import UIKit
import CoreData

class ViewController : UITableViewController ,addItemDeleget{
    
    var Tasks=[ToDoListEntities]()
        
        let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            fetcAllItem()
            

        }

        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Tasks.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
           // cell.textLabel?.text=Tasks[indexPath.row].text!
            
           // Tasks[indexPath.row].dueDate?.formatted(FormatStyle)
            let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy"

            var Dates = formatter.string(from: Tasks[indexPath.row].dueDate!)
      
            cell.Tasktext.text = Tasks[indexPath.row].text!
            cell.date.text = Dates
            cell.disc.text = Tasks[indexPath.row].taskDescription
            
            return cell
        }
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "editSegue", sender:  indexPath)
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark

        }
        override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
          //  performSegue(withIdentifier: "editSegue", sender:  indexPath)
        }
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            let Task = Tasks[indexPath.row]
            context.delete(Task)
            
            do{
           try context.save()
            }catch{
                print(error)
            }
            
            Tasks.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if sender is UIBarButtonItem{
                let nc=segue.destination as! UINavigationController
                let addtableVew = nc.topViewController as! AddTaskViewController
                addtableVew.delegate=self
            }else {
        
                let nc=segue.destination as! UINavigationController
                let addtableVew = nc.topViewController as! AddTaskViewController
                addtableVew.delegate=self
                let indexPath = sender as! NSIndexPath
                let item = Tasks[indexPath.row]
                addtableVew.taskItem = item.text
                addtableVew.taskDueDate=item.dueDate
                addtableVew.taskDiscrption=item.taskDescription

                addtableVew.indexPath = indexPath
                
            }
            
          /*  if segue.identifier == "addSegue"{
                let nc=segue.destination as! UINavigationController
                let addtableVew = nc.topViewController as! addTableViewController
                addtableVew.delegate=self
            }else if segue.identifier == "editSegue"{
                let nc=segue.destination as! UINavigationController
                let addtableVew = nc.topViewController as! addTableViewController
                addtableVew.delegate=self
                let indexPath = sender as! NSIndexPath
                let item = Task[indexPath.row]
                addtableVew.taskItem = item
                addtableVew.indexPath = indexPath
                
            }*/
            
        }
        func cancleButtonPreesed(by controller: AddTaskViewController ) {
            dismiss(animated: true, completion: nil)
        }
    func saveItem (by controller: AddTaskViewController,with Text: String ,with date:Date ,with dis:String, at indexPath:NSIndexPath?) {
            if let ip = indexPath{
              //  Task[ip.row] = text with out CourData
                let Task = Tasks[ip.row]
                Task.text = Text
                Task.dueDate = date
               Task.taskDescription = dis
                
                
            }else{
                let Task = NSEntityDescription.insertNewObject(forEntityName:"ToDoListEntities", into: context) as! ToDoListEntities
                Task.text = Text
                Task.dueDate = date
               Task.taskDescription = dis
                Tasks.append(Task)
            }
           
            do{
           try context.save()
            }catch{
                print(error)
            }
            
            
            tableView.reloadData()
           /// print("\(text)")
            dismiss(animated: true, completion: nil)

        }
        
        func fetcAllItem(){
            let request=NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoListEntities")
            do{
            let result = try context.fetch(request)
            Tasks = result as! [ToDoListEntities]
            }catch{
                print(error)
            }
        }
        
        
    }

