//
//  Owner.swift
//  FindDriver
//
//  Created by Miad Azarmehr on 2019-04-01.
//  Copyright © 2019 Miad Azarmehr. All rights reserved.
//

import Foundation
import Firebase

var ownersArray: [Owner] = [Owner]()
var ownerIndex = 0
var currentLoggedInOwner = ""

class Owner {

    var firstName = ""
    var lastName = ""
    var email = ""
    var password = ""
    var phone = ""
    var city = ""
    var postalCode = ""
    var ownerID = ""
    var personID = ""
    var ownerAutoGenerateKey = ""

}



