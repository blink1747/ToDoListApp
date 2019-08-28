//
//  TableViewController.swift
//  ToDoListApp
//
//  Created by IMCS on 8/24/19.
//  Copyright © 2019 IMCS. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseUI
import Firebase

class TableViewController: UITableViewController {
    
    var stringValue : [String] = []
    @IBAction func addItemsAction(_ sender: Any) {
        performSegue(withIdentifier: "toAddItems", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        stringValue.removeAll()
        var user = Auth.auth().currentUser
        var userID = user?.uid as! String
        
        
        
        var ref : DatabaseReference
        ref = Database.database().reference()
        
        ref.child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                
                for snap in snapshots
                {
                    let firUserId = snap.childSnapshot(forPath: "item").value! as! String
                    self.stringValue.append(firUserId)
                }
            }
            
            self.stringValue = self.stringValue.reversed()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
           
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stringValue.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItems", for: indexPath)
        // Configure the cell..
        cell.textLabel?.text = stringValue[indexPath.row]
        
        return cell
    }
    
}
