//
//  addItemDeleget.swift
//  ToDoList
//
//  Created by لمياء فالح الدوسري on 12/05/1443 AH.
//

import Foundation


protocol addItemDeleget :class{
    
    func saveItem(by controller:AddTaskViewController, with text: String ,with dueDate:Date, with dis: String,at indexPath:NSIndexPath?)
    
    func cancleButtonPreesed(by controller:AddTaskViewController)

}


