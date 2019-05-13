//
//  File.swift
//  CoreDataDemo
//
//  Created by William Biondi on 13/05/2019.
//  Copyright © 2019 William Biondi. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager{
    
    static let shared = CoreDataManager()
    var appDelegate:AppDelegate
    var managedObjContext : NSManagedObjectContext
    private init(){
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjContext = appDelegate.persistentContainer.viewContext
    }
    
    func addPerson(name:String, surname:String){
        let entityPerson = NSEntityDescription.entity(forEntityName: "Person", in: managedObjContext)
        let entityAddress = NSEntityDescription.entity(forEntityName: "Address", in: managedObjContext)
        
        let p = Person(entity: entityPerson!, insertInto: managedObjContext)
        p.name = name
        p.surname = surname
        
        let a = Address(entity: entityAddress!, insertInto: managedObjContext)
        a.city = "Milan"
        a.road = "Via Celoria"
        a.number = 18
        
        p.toAddress = a
        
        save()
    }
    
    func fetchPerson(surname:String) -> Person?{
        let fetchRequest : NSFetchRequest<Person> = Person.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "surname=%@", surname)
        do{
            let result = try managedObjContext.fetch(fetchRequest)
            if !result.isEmpty{
                return result[0]
            }
            else{
                return nil
            }
        }
        catch let error{
            print(error)
            return nil
        }
    }
    
    func save(){
        appDelegate.saveContext()
    }
    
}
