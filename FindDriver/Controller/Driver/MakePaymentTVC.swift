//
//  MakePaymentTVC.swift
//  FindDriver
//
//  Created by Miad Azarmehr on 2019-04-07.
//  Copyright © 2019 Miad Azarmehr. All rights reserved.
//

import UIKit
import Firebase

class MakePaymentTVC: UITableViewController {
    
    
    @IBOutlet var startDatePicker: UIDatePicker!
    @IBOutlet var endDatePicker: UIDatePicker!
    @IBOutlet var amountTestfield: UITextField!
    
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    @IBAction func sendPaymentButton(_ sender: UIBarButtonItem) {
        
        startDatePicker.datePickerMode = .date
        endDatePicker.datePickerMode = .date
        let amountToPay = amountTestfield.text ?? "0"

        let vehicleDB = Database.database().reference().child("payments").childByAutoId()

        let vehicleDictionary = [ "startDate": "startDatePicker", "endDate": "endDatePicker", "amount": amountToPay, "driverID": driverInstance.driverID, "paymentConfirmed": false, "driverAutoGenKen": driverInstance.driverAutoGenerateKey, "ownerID": vehicleArray[vehicleIndex].ownerID] as [String : Any]

        vehicleDB.setValue(vehicleDictionary) {
            (error, reference) in
            if error != nil {
                print(error!)
            } else {
                print("Payment send successfuly")
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func grabSomeOwnerInfo() {
        
        let vehicleIndexPathInFirebase = ref?.child("vehicles").child(vehicleGeneratedKey)
        
        let dictionaryValue = ["vehicleRequested": true, "driverID": driverInstance.driverID, "driverPhone": driverInstance.phone, "driverName": "\(driverInstance.firstName), \(driverInstance.lastName)"] as [String : Any]
        
        vehicleIndexPathInFirebase?.updateChildValues(dictionaryValue, withCompletionBlock: { (error, ref) in
            if error != nil {
                print(error!)
            }
            
            print("Rent Rquest Sent To Owner's Vehicle \(vehicleGeneratedKey)")
            
        })
        
    }
  }

