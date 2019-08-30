//
//  ViewController.swift
//  ToDoListApp
//
//  Created by IMCS on 8/23/19.
//  Copyright © 2019 IMCS. All rights reserved.
//

import UIKit
import FirebaseUI

class ViewController: UIViewController, FUIAuthDelegate {
    
    var flag : Bool = true
    override func viewDidAppear(_ animated: Bool) {
        
        
        if flag == true {
            //Get the default auth UI Object
            let authUI = FUIAuth.defaultAuthUI()
            
            guard authUI != nil else {
                return
            }
            //set oursleves as the delegate
            authUI?.delegate = self
            authUI?.providers = [FUIEmailAuth()]
            
            //Get a reference to the auth UI view controller
            let authViewController = authUI!.authViewController()
            
            //Show it
            present(authViewController, animated: true, completion: nil)
            flag = false
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        // Check if there was an error
        guard error == nil else {
            return
        }
        performSegue(withIdentifier: "toDoListView", sender: self)
    }
    
}



