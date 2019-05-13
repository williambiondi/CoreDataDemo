//
//  Address+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by William Biondi on 13/05/2019.
//  Copyright © 2019 William Biondi. All rights reserved.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var city: String?
    @NSManaged public var road: String?
    @NSManaged public var number: Int32
    @NSManaged public var toPerson: Person?

}

extension Address{
    
    var formatAddress : String{
        return "\(road!) \(Int(number)), \(city!)"
    }
}
