//
//  ViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 18/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var user : String = ""

    @IBOutlet weak var userSelector: UISegmentedControl!
    
    @IBAction func signInBtn(_ sender: Any) {
        
        if self.userSelector.selectedSegmentIndex == 0 {
            user = "Wait Staff"
            performSegue(withIdentifier: "waitStaffSegue", sender: nil)
        } else {
            user = "Admin"
            performSegue(withIdentifier: "adminSegue", sender: nil)
        }
        
        print(user)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

