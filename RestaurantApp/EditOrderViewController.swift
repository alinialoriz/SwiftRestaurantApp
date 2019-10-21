//
//  EditOrderViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 21/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class EditOrderViewController: UIViewController {
    
    // Create a variable that holds a reference to StartNewOrderView
    var previousVC = StartNewOrderViewController()
    
    // Create a variable to hold the Dish object from the selected OrderSummaryTableView cell
    var selectedDish = Dish(image: UIImage(named: "default-dish")!, name: "", category: "", qty: 0, price: 0.00, isSelected: false)
    
    // UIOutlets
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var selectedDishImage: UIImageView!
    @IBOutlet weak var selectedDishCategory: UILabel!
    @IBOutlet weak var selectedDishPrice: UILabel!
    @IBOutlet weak var selectedDishQty: UITextField!
    @IBOutlet weak var editQtyStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set navigation bar title to the selectedDish name propert
        navBar.topItem?.title = selectedDish.name
        // Set the value of UIOutlets
        selectedDishImage.image = selectedDish.image
        selectedDishCategory.text = selectedDish.category + " Dish"
        selectedDishPrice.text = "$ " + String(format: "%.2f", selectedDish.price)
        selectedDishQty.text = String(selectedDish.qty)
        // Set the value of the stepper to equal selectedDish qty
        editQtyStepper.value = Double(selectedDish.qty)
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        selectedDishQty.text = String(format: "%.0f", sender.value)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
