//
//  AddEditTableViewController.swift
//  FindDriver
//
//  Created by Miad Azarmehr on 2019-04-01.
//  Copyright © 2019 Miad Azarmehr. All rights reserved.
//

import Foundation
import Firebase

class AddOwnerVehicleTVC: UITableViewController {
    
    
    @IBOutlet weak var typeTextfield: UITextField!
    @IBOutlet weak var brandTextfield: UITextField!
    @IBOutlet weak var modelTextfield: UITextField!
    @IBOutlet weak var yearTextfield: UITextField!
    @IBOutlet weak var weeklyTextfield: UITextField!
    @IBOutlet weak var availableToogleSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func AddVehicleInformation(_ sender: UIBarButtonItem) {
        
        let toggleSwitchStatus = availableToogleSwitch.isOn
        let vehicleDB = Database.database().reference().child("vehicles").childByAutoId()
        
        let vehicleDictionary = ["ownerID": Auth.auth().currentUser?.uid as Any, "type": self.typeTextfield.text!,
                                 "brand": self.brandTextfield.text!, "model": self.modelTextfield.text!, "year": self.yearTextfield.text!, "weeklyRent": self.weeklyTextfield.text!, "availability": toggleSwitchStatus, "vehicleRequested": false, "driverID": "", "driverPhone": "", "driverName": "", "requestAccepted": false]
        
        vehicleDB.setValue(vehicleDictionary) {
            (error, reference) in
            if error != nil {
                print(error!)
            } else {
                print("Vehicle added successfuly")
            }
        }
        dismiss(animated: true, completion: nil)
    }
}







