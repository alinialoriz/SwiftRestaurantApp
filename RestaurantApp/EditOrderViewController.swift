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
    
    // Create variable to accept index of selectedRow for AdminDishesTableView
    var selectedRowInt : Int = 0
    
    
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
    

    @IBAction func editBtn(_ sender: Any) {
        
        // When editBtn is clicked, update the qty property of the selectedDish item
        if Int(editQtyStepper.value) >= 1 {
            
            // if selectedDish qty is not 0, proceed with updating qty value
        self.previousVC.orderedDishes[self.selectedRowInt].qty = Int(self.selectedDishQty.text!)!
            
            //Reload orderSummary table view
            self.previousVC.orderSummaryTableView.reloadData()
            
            // Collapse EditDishView and transfer to AdminDishesTableView on click
        self.navigationController?.popViewController(animated: true)
            
        } else {
            // if selectedDish qty set to 0, alert user item will be removed from orderSummary
            let alertController = UIAlertController(title:
                "Verify Order Quantity", message: "\nOrder quantity has been set to 0.\nThis will remove item from the order list.",
                                          preferredStyle: .alert)
            
                alertController.addAction(UIAlertAction(title: "Confirm", style:
                    .default, handler: { action in
                        
                        // Remove item from orderedDish array
                    self.previousVC.orderedDishes.remove(at: self.selectedRowInt)
                        
                        //Reload orderSummary table view
                        self.previousVC.orderSummaryTableView.reloadData()
                        
                        // Collapse EditDishView and transfer to AdminDishesTableView on click
                        self.navigationController?.popViewController(animated: true)
                        
                }))
            alertController.addAction(UIAlertAction(title: "Cancel", style:
                .destructive, handler: nil ))
            present(alertController, animated: true, completion:
                nil)
            
            
        }
        
    }
    

}
