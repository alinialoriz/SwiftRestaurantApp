//
//  EditDishViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 20/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class EditDishViewController: UIViewController {
    
    @IBOutlet weak var selectedDishName: UITextField!
    
    // Create a variable that holds a reference to AdminDishesTableView
    var adminTableViewVC = AdminDishesTableViewController()
    
    // Create variable to accept values passed from AdminDishesTableView
    var selectedDish = Dish(image: UIImage(named: "default-dish")!, name: "", category: "", qty: 0, price: 0.00, isSelected: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedDishName.text = selectedDish.name
    }

}
