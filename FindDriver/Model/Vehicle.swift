//
//  Vehicle.swift
//  FindDriver
//
//  Created by Miad Azarmehr on 2019-04-01.
//  Copyright © 2019 Miad Azarmehr. All rights reserved.
//

//DriverFindVehicleTableViewController

var vehicleArray: [Vehicle] = [Vehicle]()
var requestedVehiclesArray: [Vehicle] = [Vehicle]()

var vehicleIndex = 0

class Vehicle {

    var id = ""
    var model = ""
    var brand = ""
    var type = ""
    var year = ""
    var weeklyRent = ""
    var availability = true
    var ownerID = ""
    var driverID = ""
    var currentOwnerID = ""
    var driverPhone = ""
    var ownerPhone = ""
    var vehicleRequestStatus = false
    var vehicleAutoGenerateKey = ""
}
