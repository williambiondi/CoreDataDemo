//
//  Person+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by William Biondi on 13/05/2019.
//  Copyright © 2019 William Biondi. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var surname: String?
    @NSManaged public var toAddress: Address?

}
