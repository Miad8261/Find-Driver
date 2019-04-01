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
                
//                self.performSegue(withIdentifier: "XXXX", sender: self)
                
                
                //                if self.theSwitch == "owner" {
                //
                                        let ownerTabBarController  = self.storyboard?.instantiateViewController(withIdentifier: "ownerTabBarController") as! OwnerTabBarController
                                        self.present(ownerTabBarController, animated: true, completion: nil)
                //
                //                        } else {
                //
                //                        let driverTabBarController  = self.storyboard?.instantiateViewController(withIdentifier: "driverTabBarController") as! DriverTabBarController
                //                        self.present(driverTabBarController, animated: true, completion: nil)
                //                        }
            }
        }
    }
    
    
}
