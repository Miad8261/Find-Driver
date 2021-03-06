//
//  Payment.swift
//  FindDriver
//
//  Created by Miad Azarmehr on 2019-04-01.
//  Copyright © 2019 Miad Azarmehr. All rights reserved.
//

import Foundation
import Firebase

var paymentArray: [Payment] = [Payment]()
var paymentIndex = 0

class Payment {
    
    var paymentDate = ""
    var startDate = ""
    var endDate = ""
    var amount = ""
    var paymentConfirmed = false
    var driverMessage = ""
    var ownerMessage = ""
    var ownerID = ""
    var driverID = ""
    var vehicleID = ""
    var driverPhone = ""
    var driverName = ""
    var vehicleAutoGeneratedKey = ""
    var driverAutoGenerateKey = ""
    var paymentAutoGeneratedKey = ""
    
}
