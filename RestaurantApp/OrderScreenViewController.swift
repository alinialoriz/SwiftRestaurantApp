//
//  OrderScreenViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 20/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class OrderScreenViewController: UIViewController {
    
    @IBOutlet weak var staffID: UILabel!
    
    // Create a variable that holds a reference to AdminDishesTableView
    var waitStaffIDViewVC = WaitStaffIDViewController()
    
    // Create variable to accept values passed from AdminDishesTableView
    var selectedID : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set staffID input to the selectedID from WaitStaffIDViewController
        staffID.text = String(selectedID)
    }

}
