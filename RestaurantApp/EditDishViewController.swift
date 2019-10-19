//
//  EditDishViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 20/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class EditDishViewController: UIViewController {
    
    @IBOutlet weak var selectedDishImage: UIImageView!
    @IBOutlet weak var selectedDishName: UITextField!
    @IBOutlet weak var selectedDishCategory: UISegmentedControl!
    @IBOutlet weak var selectedDishPrice: UITextField!
    // Create a variable that holds a reference to AdminDishesTableView
    var adminTableViewVC = AdminDishesTableViewController()
    
    // Create variable to accept values passed from AdminDishesTableView
    var selectedDish = Dish(image: UIImage(named: "default-dish")!, name: "", category: "", qty: 0, price: 0.00, isSelected: false)
    var selectedRowInt : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedDishImage.image = selectedDish.image
        selectedDishName.text = selectedDish.name
        
        if selectedDish.category == "Entrée" {
            selectedDishCategory.selectedSegmentIndex = 0
        } else if selectedDish.category == "Main" {
            selectedDishCategory.selectedSegmentIndex = 1
        } else {
            selectedDishCategory.selectedSegmentIndex = 2
        }
        
        selectedDishPrice.text = String(format: "%.2f", selectedDish.price)
        
        print(selectedRowInt)
    }

}
