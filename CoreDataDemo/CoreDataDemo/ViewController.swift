//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by William Biondi on 13/05/2019.
//  Copyright © 2019 William Biondi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var personLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let person = CoreDataManager.shared.addPerson(name:"John", surname:"Appleseed")
        
    }

    @IBAction func fetchButtonDidtap(_ sender: Any) {
        let personFetched = CoreDataManager.shared.fetchPerson(surname:"Appleseed")
        if let person = personFetched{
            personLabel.text = "\(person.name!) \(person.surname!) \(person.toAddress!.formatAddress)"
            
        }
        
    }
    @IBAction func updateButtonDidTap(_ sender: Any) {
        let personFetched = CoreDataManager.shared.fetchPerson(surname: "Appleseed")
        guard let person = personFetched else{
            return
        }
        person.name = "William"
        CoreDataManager.shared.save()
    }
    
}

