//
//  AddEditTableViewController.swift
//  FindDriver
//
//  Created by Miad Azarmehr on 2019-04-01.
//  Copyright © 2019 Miad Azarmehr. All rights reserved.
//

import Foundation
import Firebase

class AddEditTableViewController: UITableViewController {
    
    
    @IBOutlet weak var typeTextfield: UITextField!
    @IBOutlet weak var brandTextfield: UITextField!
    @IBOutlet weak var modelTextfield: UITextField!
    @IBOutlet weak var yearTextfield: UITextField!
    @IBOutlet weak var weeklyTextfield: UITextField!
    @IBOutlet weak var availableToogleSwitch: UISwitch!
    
//    var veicleArray : [Vehicle] = [Vehicle]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func SaveVehicleInformation(_ sender: UIBarButtonItem) {
        
        let toggleSwitch = availableToogleSwitch.isOn
        
        let vehicleDB = Database.database().reference().child("vehicles").childByAutoId()
        

        
        let vehicleDictionary = ["ownerID": Auth.auth().currentUser?.uid as Any, "type": self.typeTextfield.text!,
                                 "brand": self.brandTextfield.text!, "model": self.modelTextfield.text!, "year": self.yearTextfield.text!, "weeklyRent": self.weeklyTextfield.text!, "availability": toggleSwitch]
        
        vehicleDB.setValue(vehicleDictionary) {
            (error, reference) in
            if error != nil {
                print(error!)
            } else {
                
            print("Vehicle added successfuly")
//                self.tableView.reloadData()
            }
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    
    //        let ownerUsers = Database.database().reference().child("owners")
    //        let messageDictionary = ["firstName": self.firstNameTextfield.text!, "lastName": self.lastNameTextfield.text!, "email": self.emailTextfield.text!, "phone": self.phoneTextfield.text!, "city": self.cityTextfield.text!,"type": "owner"]
    //        ownerUsers.childByAutoId().setValue(messageDictionary) {
    //            (error, reference) in
    //
    //            if error != nil {
    //                print(error!)
    //            } else {
    //                print("Owner saved successfuly!")
    //            }
    //        }
    
}
