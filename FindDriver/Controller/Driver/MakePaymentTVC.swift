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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //var paymentDate = ""
    //var startDate = ""
    //var endDate = ""
    //var period = ""
    //var amount = 0
    //var confirmed = false
    //var driverMessage = ""
    //var ownerMessage = ""
    //var ownerID = ""
    //var driverID = ""
    //var vehicleID = ""
    
    @IBAction func sendPaymentButton(_ sender: UIBarButtonItem) {
        
        startDatePicker.datePickerMode = .date
        endDatePicker.datePickerMode = .date
        let amountToPay = amountTestfield.text ?? "0"

        let vehicleDB = Database.database().reference().child("Payments").childByAutoId()

        let vehicleDictionary = ["ownerID": Auth.auth().currentUser?.uid as Any,
                                 "startDate": startDatePicker, "endDate": endDatePicker, "amount": amountToPay, "driverID": driverInstance.driverID, "driverPhone": driverInstance.phone, "driverName": "\(driverInstance.firstName), \(driverInstance.lastName)", "confirmed": false]

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
    
    
    func retrieveVehicles() {

        let currentLoggedInUserID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference().child("payments")
        let query = ref.queryOrdered(byChild: "ownerID").queryEqual(toValue: currentLoggedInUserID)
        query.observe(.value, with: { (snapshot) in

            for snaps in snapshot.children.allObjects as! [DataSnapshot] {

                let vehiclesRetrived = snaps.value!
                print("Here in ShowAddOwnerVehicle2 \(vehiclesRetrived)")
                let dictionary = snaps.value as? NSDictionary
                //var xxx = vehiclesRetrived as! Dictionary<String,String>

                let vehiclesKey = snaps.key
                let allVehicles = Vehicle()

                let availability = dictionary?["availability"] as? Bool
                let brand = dictionary?["brand"] as? String
                let model = dictionary?["model"] as? String
                let ownerID = dictionary?["ownerID"] as? String
                let type = dictionary?["type"] as? String
                let weeklyRent = dictionary?["weeklyRent"] as? String
                let year = dictionary?["year"] as? String
                let driverPhone = dictionary?["driverPhone"] as? String
                let driverID = dictionary?["driverID"] as? String
                let driverName = dictionary?["driverName"] as? String
                let vehicleRequested = dictionary?["vehicleRequested"] as? Bool
                let requestAccepted = dictionary?["requestAccepted"] as? Bool
                //                let vehicleAutoGenerateKey = dictionary?["vehicleAutoGenerateKey"] as? String


                allVehicles.availability = availability ?? true
                allVehicles.brand = brand ?? ""
                allVehicles.model = model ?? ""
                allVehicles.ownerID = ownerID ?? ""
                allVehicles.type = type ?? ""
                allVehicles.weeklyRent = weeklyRent ?? ""
                allVehicles.year = year ?? ""
                allVehicles.driverPhone = driverPhone ?? ""
                allVehicles.driverID = driverID ?? ""
                allVehicles.driverName = driverName ?? ""
                allVehicles.vehicleRequested = vehicleRequested ?? false
                allVehicles.requestAccepted = requestAccepted ?? false
                //                theVehicles.vehicleAutoGenerateKey = vehicleAutoGenerateKey ?? ""
                allVehicles.vehicleAutoGenerateKey = vehiclesKey

                vehicleArray.append(allVehicles)

                if vehicleRequested == true {
                    requestedVehiclesArray.append(allVehicles)
                }

               // self.configureTableView()

            }
        })
    }
    
  }

