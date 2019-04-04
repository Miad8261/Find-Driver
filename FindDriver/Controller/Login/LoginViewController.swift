//
//  LoginViewController.swift
//  FindDriver
//
//  Created by Miad Azarmehr on 2019-03-30.
//  Copyright © 2019 Miad Azarmehr. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var typeOfUser = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func loginTapped(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
                print("Error signing in")
            }
            else {
                print("Login successed!")
                
                
                self.retrieveProfileType()
                
            }
        }
    }
    
    func retrieveProfileType() {
        let currentLoggedInUserID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference(fromURL: "finddriver-8d2d6.firebaseio.com").child("profiles")
        let query = ref.queryOrdered(byChild: "personID").queryEqual(toValue: currentLoggedInUserID)
        query.observe(.value, with: { (snapshot) -> Void in
            
            for snaps in snapshot.children.allObjects as! [DataSnapshot] {
                
                let dictionary = snaps.value as? NSDictionary
                self.typeOfUser = dictionary?["type"] as? String ?? ""
                
                print("UUUUUUUUUUUSSEERR TYPE IS: \(self.typeOfUser)")
                self.goToUserVC(self.typeOfUser)
            }
        })
    }
    
    func goToUserVC(_ loginCondition: String) {
        print("LOGINCONDITION \(loginCondition)")
        switch loginCondition {
        case "owner":
            let ownerTabBarController  = self.storyboard?.instantiateViewController(withIdentifier: "ownerTabBarController") as! OwnerTabBarController
            self.present(ownerTabBarController, animated: true, completion: nil)
            
        case "driver":
            let driverTabBarController  = self.storyboard?.instantiateViewController(withIdentifier: "driverTabBarController") as! DriverTabBarController
            self.present(driverTabBarController, animated: true, completion: nil)
            
        default:
            print("Fallback option")
        }
    }
}

