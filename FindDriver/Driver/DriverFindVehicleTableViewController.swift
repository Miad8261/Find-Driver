//
//  DriverFindVehicleTableViewController.swift
//  FindDriver
//
//  Created by Miad Azarmehr on 2019-04-02.
//  Copyright © 2019 Miad Azarmehr. All rights reserved.
//

import UIKit
import Firebase

class DriverFindVehicleTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var tableView: UITableView!
    
    
//    var vehicleArray: [Vehicle] = [Vehicle]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ref = Database.database().reference()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "MessageCell", bundle: nil) , forCellReuseIdentifier: "customMessageCell")
        
        configureTableView()
        
        retrieveVehicles()
    }
    
    func configureTableView() {
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120.0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        cell.vehicleDetailLabel.text = "\(vehicleArray[indexPath.row].type) \(vehicleArray[indexPath.row].brand) \(vehicleArray[indexPath.row].model) \(vehicleArray[indexPath.row].year) $\(vehicleArray[indexPath.row].weeklyRent)"
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let va = vehicleArray.count
        print ("vehiclecount -------> \(va)")
        return va
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sendVehicleRequestCell", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendVehicleRequestCell" {
            
            let indexPath = tableView.indexPathForSelectedRow!
            let theVehicles = vehicleArray[indexPath.row]
            
            let navVC = segue.destination as! UINavigationController
            let sendVehicleRequestCell = navVC.viewControllers.first as! VehicleRentSendRequestTVC
            
            sendVehicleRequestCell.vehicles = theVehicles
            
            //            let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
            //            sendVehicleRequestCell.myImage = cell.imageViewImage.image
        }
    }
    
    @IBAction func unwindToFindVehicleForRent(_ unwindSegue: UIStoryboardSegue) {
       
    }
    
    
    func retrieveVehicles() {
        
        // let currentLoggedInUserID = Auth.auth().currentUser?.uid
        
        let ref = Database.database().reference(fromURL: "finddriver-8d2d6.firebaseio.com").child("vehicles")
        let query = ref.queryOrdered(byChild: "availability").queryEqual(toValue: true)
        query.observe(.value, with: { (snapshot) in
            
            let vehiclesRetrived = snapshot.value!
            print(vehiclesRetrived)
            
            
            for snaps in snapshot.children.allObjects as! [DataSnapshot] {
                
                let vehiclesRetrived = snaps.value!
                print(vehiclesRetrived)
                let dictionary = snaps.value as? NSDictionary
                
                let availability = dictionary?["availability"] as? Bool
                let brand = dictionary?["brand"] as? String
                let model = dictionary?["model"] as? String
                let ownerID = dictionary?["ownerID"] as? String
                let type = dictionary?["type"] as? String
                let weeklyRent = dictionary?["weeklyRent"] as? String
                let year = dictionary?["year"] as? String
                let request = dictionary?["request"] as? Bool
                
                let theVehicles = Vehicle()
                
                theVehicles.availability = availability!
                theVehicles.brand = brand!
                theVehicles.model = model!
                theVehicles.ownerID = ownerID!
                theVehicles.type = type!
                theVehicles.weeklyRent = weeklyRent!
                theVehicles.year = year!
                theVehicles.request = request!
                
                vehicleArray.append(theVehicles)
                
                self.configureTableView()
                self.tableView.reloadData()
                
            }
        })
    }
    
}
