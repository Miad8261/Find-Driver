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
        
        tableView.register(UINib(nibName: "MessageCell", bundle: nil) , forCellReuseIdentifier: "customMessageCell")
        
        configureTableView()
    }
    
    func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120.0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        cell.vehicleDetailLabel.text = "\(requestedVehiclesArray[indexPath.row].type) \(requestedVehiclesArray[indexPath.row].brand) \(requestedVehiclesArray[indexPath.row].model) \(requestedVehiclesArray[indexPath.row].year) \(requestedVehiclesArray[indexPath.row].weeklyRent)"
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print ("vehiclecount requestedVehiclesArray ============ \(requestedVehiclesArray.count)")
        return requestedVehiclesArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        requestedIndex = indexPath.row
        performSegue(withIdentifier: "goToReceivedRequests", sender: self)
    }
    
    
    @IBAction func unwindToOwnerReceivedRequests(_ unwindSegue: UIStoryboardSegue) {
    }
}
