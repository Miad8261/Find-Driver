//
//  PaymentDetails.swift
//  FindDriver
//
//  Created by Miad Azarmehr on 2019-04-07.
//  Copyright © 2019 Miad Azarmehr. All rights reserved.
//

import UIKit

class PaymentDetailsTVC: UITableViewController {

    
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!
    @IBOutlet var amountPaidLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startDateLabel.text = paymentArray[paymentIndex].startDate
        endDateLabel.text = paymentArray[paymentIndex].endDate
        amountPaidLabel.text = paymentArray[paymentIndex].amount
    }
}
