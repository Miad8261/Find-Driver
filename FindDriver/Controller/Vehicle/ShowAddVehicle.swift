//
//  AddNewVehicle.swift
//  FindDriver
//
//  Created by Miad Azarmehr on 2019-04-01.
//  Copyright © 2019 Miad Azarmehr. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ShowAddVehicle: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var vehicleArray : [Vehicle] = [Vehicle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        retrieveVehicles()
    }
    
    func configureTableView() {
        //        tableView.rowHeight = UITableView.automaticDimension
        //        tableView.estimatedRowHeight = 120.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        
        //        cell.vehicleInformation = vehicleArray[indexPath.row].brand
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicleArray.count
    }
    
    
        func retrieveVehicles() {
    
            let vehicleDB = Database.database().reference().child("Vehicles")
            vehicleDB.observe(.childAdded) { (snapshot) in
    
                let snapshotValue = snapshot.value as! Dictionary<String, String>
    
                let type = snapshotValue["type"]!
                let brand = snapshotValue["brand"]!
                let model = snapshotValue["model"]!
                let year = snapshotValue["year"]!
                let weeklyRent = snapshotValue["weeklyRent"]!
               // let availibility = snapshotValue["availibility"]!
    
                let vehicle = Vehicle()
                vehicle.type = type
                vehicle.brand = brand
                vehicle.model = model
                vehicle.year = year
                vehicle.weeklyRent = weeklyRent
                //vehicle.availibility = availibility
    
                self.vehicleArray.append(vehicle)
    
    
                  print (type, brand, model, year, weeklyRent)
            }
        }
}
