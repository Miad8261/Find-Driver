//
//  ReceiveRequestsFromDriversTVC.swift
//  FindDriver
//
//  Created by Miad Azarmehr on 2019-04-06.
//  Copyright © 2019 Miad Azarmehr. All rights reserved.
//

import UIKit
import Firebase

class ReceiveRequestsFromDriversTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ref = Database.database().reference()

        tableView.register(UINib(nibName: "MessageCell", bundle: nil) , forCellReuseIdentifier: "customMessageCell")
        
        configureTableView()
        
        retrieveVehicles()
    }
    

    
    func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120.0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        cell.vehicleDetailLabel.text = "\(requestedVehiclesArray[indexPath.row].type), \(requestedVehiclesArray[indexPath.row].brand), \(requestedVehiclesArray[indexPath.row].model), \(requestedVehiclesArray[indexPath.row].year), \(requestedVehiclesArray[indexPath.row].weeklyRent), \(requestedVehiclesArray[indexPath.row].vehicleAutoGenerateKey)"
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print ("vehiclecount============ \(vehicleArray.count)")
        return requestedVehiclesArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        vehicleIndex = indexPath.row
        performSegue(withIdentifier: "goToReceivedRequests", sender: self)
    }
    
    
    @IBAction func unwindToOwnerReceivedRequests(_ unwindSegue: UIStoryboardSegue) {
    }
    
    func retrieveVehicles() {
        
//        let currentLoggedInUserID = Auth.auth().currentUser?.uid
//        let ref = Database.database().reference().child("vehicles")
//        let query = ref.queryOrdered(byChild: "ownerID").queryEqual(toValue: currentLoggedInUserID)
//        query.observe(.value, with: { (snapshot) in
//
//            for snaps in snapshot.children.allObjects as! [DataSnapshot] {
//
//                let dictionary = snaps.value as? NSDictionary
//
//                let availability = dictionary?["availability"] as? Bool
//                let brand = dictionary?["brand"] as? String
//                let model = dictionary?["model"] as? String
//                let ownerID = dictionary?["ownerID"] as? String
//                let driverID = dictionary?["driverId"] as? String
//                let type = dictionary?["type"] as? String
//                let weeklyRent = dictionary?["weeklyRent"] as? String
//                let year = dictionary?["year"] as? String
//                let driverPhone = dictionary?["driverPhone"] as? String
//
//                let theVehicles = Vehicle()
//                let vehiclesKey = snaps.key
//
//                theVehicles.availability = availability!
//                theVehicles.brand = brand!
//                theVehicles.model = model!
//                theVehicles.ownerID = ownerID ?? ""
//                theVehicles.driverID = driverID ?? ""
//                theVehicles.type = type!
//                theVehicles.weeklyRent = weeklyRent!
//                theVehicles.year = year!
//                theVehicles.driverPhone = driverPhone ?? ""
//                theVehicles.vehicleAutoGenerateKey = vehiclesKey
//
//                showVehicleToOwnerArray.append(theVehicles)
//                self.configureTableView()
//
//            }
//        })
    }
}
