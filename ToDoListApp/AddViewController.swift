//
//  AddViewController.swift
//  ToDoListApp
//
//  Created by IMCS on 8/25/19.
//  Copyright © 2019 IMCS. All rights reserved.
//

import UIKit
import Firebase

class AddViewController: UIViewController {
    
    @IBOutlet weak var textValue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func addItemAction(_ sender: Any) {
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
        
        let userID = (Auth.auth().currentUser?.uid)!
        ref.child(userID).childByAutoId().setValue(["item": textValue.text])
    }
    
    
}
