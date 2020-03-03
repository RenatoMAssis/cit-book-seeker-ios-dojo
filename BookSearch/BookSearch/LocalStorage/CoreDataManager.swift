//
//  CoreDataManager.swift
//  BookSearch
//
//  Created by Pericles Junor on 02/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    static func save(term: String) {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let managedContext = appDelegate.persistentContainer.viewContext

        let entity = NSEntityDescription.entity(forEntityName: "SearchTerm", in: managedContext)!

        let searchTerm = NSManagedObject(entity: entity, insertInto: managedContext)

        searchTerm.setValue(term, forKeyPath: "text")

        do {
            try managedContext.save()
        } catch _ as NSError {}
    }

    static func fetchData() -> [NSManagedObject]? {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }

        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "SearchTerm")

        do {
            return try managedContext.fetch(fetchRequest)
        } catch _ as NSError {}
        return nil
    }
}
