//
//  PaymentsViewController.swift
//  FindDriver
//
//  Created by Miad Azarmehr on 2019-03-30.
//  Copyright © 2019 Miad Azarmehr. All rights reserved.
//

import Foundation
import Firebase

class OwnerCanSeePayments: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "MessageCell", bundle: nil) , forCellReuseIdentifier: "customMessageCell")
        
        configureTableView()
//        retrieveVehicles()
        //retrievePayments()
//        RetrieveDriverInfo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120.0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        cell.vehicleDetailLabel.text = "Start: \(paymentArray[indexPath.row].startDate) TO: \(paymentArray[indexPath.row].endDate) $ \(paymentArray[indexPath.row].amount) paid. "
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print ("vehiclecount paymentArray -------> \(paymentArray.count)")
        return paymentArray.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        paymentIndex = indexPath.row
        performSegue(withIdentifier: "goToPaymentDetails", sender: self)
    }
    
    
    @IBAction func unwindShowPaymentsToOwner(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
//    func retrieveVehicles() {
//
//        let ref = Database.database().reference().child("vehicles")
//        ref.observe(.value, with: { (snapshot) in
//
//            for snaps in snapshot.children.allObjects as! [DataSnapshot] {
//
//                let vehiclesRetrived = snaps.value!
//                print("DriverFindAvailableVehicleTableViewController \(vehiclesRetrived)")
//
//                let dictionary = snaps.value as? NSDictionary
//                let driverVehicles = Vehicle()
//                let vehiclesKey = snaps.key
//
//                let availability = dictionary?["availability"] as? Bool
//                let brand = dictionary?["brand"] as? String
//                let model = dictionary?["model"] as? String
//                let ownerID = dictionary?["ownerID"] as? String
//                let type = dictionary?["type"] as? String
//                let weeklyRent = dictionary?["weeklyRent"] as? String
//                let year = dictionary?["year"] as? String
//                let requestAccepted = dictionary?["requestAccepted"] as? Bool
//                let driverID = dictionary?["driverID"] as? String
//
//
//                driverVehicles.availability = availability ?? true
//                driverVehicles.brand = brand ?? ""
//                driverVehicles.model = model ?? ""
//                driverVehicles.ownerID = ownerID ?? ""
//                driverVehicles.type = type ?? ""
//                driverVehicles.weeklyRent = weeklyRent ?? ""
//                driverVehicles.year = year ?? ""
//                driverVehicles.requestAccepted = requestAccepted ?? false
//                driverVehicles.driverID = driverID ?? ""
//                driverVehicles.vehicleAutoGenerateKey = vehiclesKey
//
//                vehicleArray.append(driverVehicles)
//
//                self.configureTableView()
//                self.tableView.reloadData()
//            }
//        })
//    }
    
//    func retrievePayments() {
//
//        let currentLoggedInUserID = Auth.auth().currentUser?.uid
//        let ref = Database.database().reference().child("payments")
//        let query = ref.queryOrdered(byChild: "driverID").queryEqual(toValue: currentLoggedInUserID)
//        query.observe(.value, with: { (snapshot) in
//
//            for snaps in snapshot.children.allObjects as! [DataSnapshot] {
//
//                let paymentsRetrived = snaps.value!
//                print("Here in PAYMENTS \(paymentsRetrived)")
//
//                let dictionary = snaps.value as? NSDictionary
//                let allPayments = Payment()
//
//                let amount = dictionary?["amount"] as? String
//                let driverAutoGenerateKey = dictionary?["driverAutoGenerateKey"] as? String
//                let driverID = dictionary?["driverID"] as? String
//                let endDate = dictionary?["endDate"] as? String
//                let ownerID = dictionary?["ownerID"] as? String
//                let paymentConfirmed = dictionary?["paymentConfirmed"] as? Bool
//                let startDate = dictionary?["startDate"] as? String
//                let vehicleAutoGeneratedKey = dictionary?["vehicleAutoGeneratedKey"] as? String
//
//                allPayments.amount = amount ?? ""
//                allPayments.driverAutoGenerateKey = driverAutoGenerateKey ?? ""
//                allPayments.driverID = driverID ?? ""
//                allPayments.endDate = endDate ?? ""
//                allPayments.ownerID = ownerID ?? ""
//                allPayments.paymentConfirmed = paymentConfirmed ?? false
//                allPayments.startDate = startDate ?? ""
//                allPayments.vehicleAutoGeneratedKey = vehicleAutoGeneratedKey ?? ""
//
//                paymentArray.append(allPayments)
//                self.configureTableView()
//            }
//        })
//    }
    
//    func RetrieveDriverInfo() {
//
//        let currentLoggedInUserID = Auth.auth().currentUser?.uid
//        let ref = Database.database().reference().child("profiles")
//        let query = ref.queryOrdered(byChild: "driverID").queryEqual(toValue: currentLoggedInUserID)
//        query.observe(.value, with: { (snapshot) in
//            for snaps in snapshot.children.allObjects as! [DataSnapshot] {
//
//                let dictionary = snaps.value as? NSDictionary
//
//                let phone = dictionary?["phone"] as? String
//                let driverID = dictionary?["driverID"] as? String
//                let firstName = dictionary?["firstName"] as? String
//                let lastName = dictionary?["lastName"] as? String
//                let vehicleAutoGeneratedKey = dictionary?["vehicleAutoGeneratedKey"] as? String
//                let driversAutoGeneratedKey = snaps.key
//
//                driverInstance.phone = phone ?? ""
//                driverInstance.driverID = driverID ?? ""
//                driverInstance.firstName = firstName ?? ""
//                driverInstance.lastName = lastName ?? ""
//                driverInstance.vehicleAutoGeneratedKey = vehicleAutoGeneratedKey ?? ""
//                driverInstance.driverAutoGenerateKey = driversAutoGeneratedKey
//
//
//                print("DRIVERPHONE \(phone ?? "")")
//                print("DRIVERID \(driverID ?? "")")
//            }
//        })
//    }
}
