//
//  Vehicle.swift
//  FindDriver
//
//  Created by Miad Azarmehr on 2019-04-01.
//  Copyright © 2019 Miad Azarmehr. All rights reserved.
//

var vehicleArray: [Vehicle] = [Vehicle]()

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
    var request = false
}


//class Vehicle {
//
//    var id: String?
//    var model: String?
//    var brand: String?
//    var type: String?
//    var year: String?
//    var weeklyRent: String?
//    var availibility: String?
//    var ownerID: String?
//    var driverID: String?
//    let ref: DatabaseReference?
//
//    init( model: String, brand: String, type: String, year: String, weeklyRent: String, availibility: String, ownerID: String) {
//        self.model = model
//        self.brand = brand
//        self.type = type
//        self.year = year
//        self.weeklyRent = weeklyRent
//        self.availibility = availibility
//        self.ownerID = ownerID
//        self.ref = nil
//    }
//
//    init(snapshot: DataSnapshot) {
//        model = snapshot.value!["pName"] as! String
//        brand = snapshot.value!["pNumber"] as! String
//        type = snapshot.value!["pEmail"] as! String
//        ref = snapshot.ref
//    }
//
//    convenience override init() {
//        self.init(model:"",brand: "", type: "")
//    }
//}
