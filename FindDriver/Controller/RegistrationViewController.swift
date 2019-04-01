//
//  RegistrationViewController.swift
//  FindDriver
//
//  Created by Miad Azarmehr on 2019-03-31.
//  Copyright © 2019 Miad Azarmehr. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class RegistrationViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var phoneTextfield: UITextField!
    @IBOutlet weak var cityTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var reTypePasswordTextfield: UITextField!
  

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Sign Up as Owner
    @IBAction func ownerButtonPressed(_ sender: UIButton) {
        
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
                print(error!)
            }
        }
        
        let ownerUsers = Database.database().reference().child("owners")
        let messageDictionary = ["firstName": self.firstNameTextfield.text!, "lastName": self.lastNameTextfield.text!, "email": self.emailTextfield.text!, "phone": self.phoneTextfield.text!, "city": self.cityTextfield.text!,"type": "owner"]
        ownerUsers.childByAutoId().setValue(messageDictionary) {
            (error, reference) in
            
            if error != nil {
                print(error!)
            } else {
                print("Owner saved successfuly!")
            }
        }
        
//        let ref = Database.database().reference(fromURL: "https://vehiclefinder-b79b6.firebaseio.com/")
//        let usersRefrence = ref.child("owners")
//        let values = ["firstName": self.firstNameTextfield.text!, "lastName": self.lastNameTextfield.text!, "email": self.emailTextfield.text!, "phone": self.phoneTextfield.text!, "city": self.cityTextfield.text!,"type": "owner"]
//        usersRefrence.updateChildValues(values) { (error, ref) in
//            if error != nil {
//                print(error!)
//            }
//        }
        
//        self.navigationController?.popToRootController(animated: true)
        let ownerTabBarController  = self.storyboard?.instantiateViewController(withIdentifier: "ownerTabBarController") as! OwnerTabBarController
        self.present(ownerTabBarController, animated: true, completion: nil)
        
    }
    
    // Sign Up as Driver
    @IBAction func driverButtonPressed(_ sender: UIButton) {
        
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
                print(error!)
            }
        }
        
        let driverUsers = Database.database().reference().child("drivers")
        let messageDictionary = ["firstName": self.firstNameTextfield.text!, "lastName": self.lastNameTextfield.text!, "email": self.emailTextfield.text!, "phone": self.phoneTextfield.text!, "city": self.cityTextfield.text!,"type": "driver"]
        driverUsers.childByAutoId().setValue(messageDictionary) {
            (error, reference) in
            
            if error != nil {
                print(error!)
            } else {
                print("Driver saved successfuly!")
            }
        }
        
        
//        let ref = Database.database().reference(fromURL: "https://vehiclefinder-b79b6.firebaseio.com/")
//        let usersRefrence = ref.child("drivers")
//        let values = ["firstName": self.firstNameTextfield.text!, "lastName": self.lastNameTextfield.text!, "email": self.emailTextfield.text!, "phone": self.phoneTextfield.text!, "city": self.cityTextfield.text!,"type": "driver"]
//        usersRefrence.updateChildValues(values) { (error, ref) in
//            if error != nil {
//                print(error!)
//            }
//        }
        
//        self.navigationController?.popToRootController(animated: true)
        let driverTabBarController  = self.storyboard?.instantiateViewController(withIdentifier: "driverTabBarController") as! DriverTabBarController
        self.present(driverTabBarController, animated: true, completion: nil)
        
    }
    
    
    
    //    if self.theSwitch == "owner" {
    //
    //    let ownerTabBarController  = self.storyboard?.instantiateViewController(withIdentifier: "ownerTabBarController") as! OwnerTabBarController
    //    self.present(ownerTabBarController, animated: true, completion: nil)
    //
    //    } else {
    //
    //    let driverTabBarController  = self.storyboard?.instantiateViewController(withIdentifier: "driverTabBarController") as! DriverTabBarController
    //    self.present(driverTabBarController, animated: true, completion: nil)
    //    }
    
    
    
    //
    //            //            if self.switchStatus == self.uiSwitch?.isOn {
    //            //
    //            //                self.theSwitch = "driver"
    //            //            } else {
    //            //                self.theSwitch = "owner"
    //            //            }
    
}
