//
//  ToDoListEntities+CoreDataProperties.swift
//  ToDoList
//
//  Created by لمياء فالح الدوسري on 13/05/1443 AH.
//
//

import Foundation
import CoreData


extension ToDoListEntities {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListEntities> {
        return NSFetchRequest<ToDoListEntities>(entityName: "ToDoListEntities")
    }

    @NSManaged public var text: String?
   @NSManaged public var dueDate: Date?
  @NSManaged public var taskDescription: String?

    

}

extension ToDoListEntities : Identifiable {

}
