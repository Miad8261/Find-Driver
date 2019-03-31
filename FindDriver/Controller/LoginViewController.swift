//
//  LoginViewController.swift
//  FindDriver
//
//  Created by Miad Azarmehr on 2019-03-30.
//  Copyright © 2019 Miad Azarmehr. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet weak var loginTapped: UIView!
    
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        let mainTabBarController  = storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
        present(mainTabBarController, animated: true, completion: nil)
    }
    
}
