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
    
    var ref: DatabaseReference!
    var newUserId:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    // Sign Up as Owner
    @IBAction func ownerButtonPressed(_ sender: UIButton) {
        
        //  let userID = Auth.auth().currentUser?.uid
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            self.newUserId = Auth.auth().currentUser?.uid
            
            if error != nil {
                print(error!)
            } else {
                
                print ("Create owner successfuly! \(self.newUserId)")
                self.saveOwnerInformation()
                
                let ownerTabBarController  = self.storyboard?.instantiateViewController(withIdentifier: "ownerTabBarController") as! OwnerTabBarController
                self.present(ownerTabBarController, animated: true, completion: nil)
                
            }
        }
        //        self.navigationController?.popToRootController(animated: true)
        
    }
    
    
    func saveOwnerInformation() {
        
        let ownerUsers = ref.child("owners").childByAutoId()
        let messageDictionary = ["firstName": self.firstNameTextfield.text!, "lastName": self.lastNameTextfield.text!, "email": self.emailTextfield.text!, "phone": self.phoneTextfield.text!, "city": self.cityTextfield.text!,"type": "owner", "ownerID": newUserId]
        
        //        print("OOwner saved successfuly! \(String(describing: Auth.auth().currentUser?.uid))")
        
        ownerUsers.setValue(messageDictionary) {
            (error, reference) in
            
            if error != nil {
                print(error!)
            } else {
                print("Owner saved successfuly! \(String(describing: self.newUserId))")
            }
        }
    }
    
    
    // Sign Up as Driver
    @IBAction func driverButtonPressed(_ sender: UIButton) {
        
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
                print(error!)
            } else {
                print("Driver ID created successfully!")
                self.saveDriverInformation()
                
                let driverTabBarController  = self.storyboard?.instantiateViewController(withIdentifier: "driverTabBarController") as! DriverTabBarController
                self.present(driverTabBarController, animated: true, completion: nil)
            }
        }
        //        self.navigationController?.popToRootController(animated: true)
    }
    
    func saveDriverInformation(){
        let driverUsers = Database.database().reference().child("drivers")
        let messageDictionary = ["driverID": Auth.auth().currentUser?.uid, "firstName": self.firstNameTextfield.text!, "lastName": self.lastNameTextfield.text!, "email": self.emailTextfield.text!, "phone": self.phoneTextfield.text!, "city": self.cityTextfield.text!,"type": "driver"]
        
        driverUsers.childByAutoId().setValue(messageDictionary) {
            (error, reference) in
            
            if error != nil {
                print(error!)
            } else {
                print("Driver saved successfuly!\(Auth.auth().currentUser?.uid)")
            }
        }
    }
}
