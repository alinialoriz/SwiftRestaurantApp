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
    
    // Create a variable that holds a reference to MenuTableView
    var menuTableVC = MenuTableViewController()
    
    // Create a variable to hold the Dish object from the selected OrderSummaryTableView cell
    var selectedDish = Dish(image: UIImage(named: "default-dish")!, name: "", category: "", qty: 0, price: 0.00, isSelected: false)
    
    // Create variable to accept index of selectedRow from OrderSummary
    var selectedRowInt : Int = 0
    
    // Create a variable to hold the segue identifier
    var segueIdentifier : String = ""
    
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
            
            // Check segue identifier
            if segueIdentifier == "editOrderSegue" {
                
            // if selectedDish qty is not 0, proceed with updating qty value in orderSummary
        self.previousVC.orderedDishes[self.selectedRowInt].qty = Int(self.selectedDishQty.text!)!
                
                //Reload orderSummary table view
                self.previousVC.orderSummaryTableView.reloadData()
            
            } else {
                // Else if segue identifier == "addOrderSegue"
               // if selectedMenuDish qty is not 0, proceed with updating qty value in menuTable
             if self.selectedDish.category == "Entrée" {
               //update entree dish qty
                self.menuTableVC.entreeDishes[self.selectedRowInt].qty = Int(self.selectedDishQty.text!)!
                
               //update entree dish isSelected
                self.menuTableVC.entreeDishes[self.selectedRowInt].isSelected = true
                
             } else if self.selectedDish.category == "Main" {
                //update main dish qty
                self.menuTableVC.mainDishes[self.selectedRowInt].qty = Int(self.selectedDishQty.text!)!
                
                //update entree dish isSelected
                self.menuTableVC.mainDishes[self.selectedRowInt].isSelected = true
             } else {
                //update dessert dish qty
                self.menuTableVC.dessertDishes[self.selectedRowInt].qty = Int(self.selectedDishQty.text!)!
                
                //update entree dish isSelected
                self.menuTableVC.dessertDishes[self.selectedRowInt].isSelected = true
                
            }
            
            //Reload Menu table view
            self.menuTableVC.menuTableView.reloadData()
            }
            
            // Collapse EditOrderView and transfer to previously accessed view controller on click
        self.navigationController?.popViewController(animated: true)
            
        } else {
            // Check segue identifier
            if segueIdentifier == "editOrderSegue" {
                
            // if selectedDish qty set to 0, alert user item will be removed from orderSummary
            let alertController = UIAlertController(title:
                "Verify Order Quantity", message: "\nOrder quantity has been set to 0.\nThis will remove item from the order list.",
                                          preferredStyle: .alert)
            
                alertController.addAction(UIAlertAction(title: "Confirm", style:
                    .default, handler: { action in
                        
                        
                        // If user confirms, remove item from orderedDish array
                    self.previousVC.orderedDishes.remove(at: self.selectedRowInt)
                        
                        // Flip switch of dish item, that mathes the removed item from orderedDish array
                        self.findInMenuTable()
                        
                        //Reload orderSummary table view
                        self.previousVC.orderSummaryTableView.reloadData()
                
                        //Reload orderSummary table view
                        self.menuTableVC.menuTableView.reloadData()
                        
                        // Collapse EditDishView and transfer to AdminDishesTableView on click
                        self.navigationController?.popViewController(animated: true)
                        
                }))
            alertController.addAction(UIAlertAction(title: "Cancel", style:
                .destructive, handler: nil ))
            present(alertController, animated: true, completion:
                nil)
            } else {
                // Else if segue identifier == "addOrderSegue"
                
                // if selectedMenuDish qty is 0, set isSelected to false
                if self.selectedDish.category == "Entrée" {
                    //update entree dish isSelected
                    self.menuTableVC.entreeDishes[self.selectedRowInt].isSelected = false
                    
                } else if self.selectedDish.category == "Main" {
                    //update entree dish isSelected
                    self.menuTableVC.mainDishes[self.selectedRowInt].isSelected = false
                } else {
                    
                    //update entree dish isSelected
                    self.menuTableVC.dessertDishes[self.selectedRowInt].isSelected = false
                    
                }
                
                //Reload Menu table view
                self.menuTableVC.menuTableView.reloadData()
            }
            
            // Collapse EditDishView and transfer to AdminDishesTableView on click
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // A function that finds the dish item in the menu table view that matches the removed dish item in orderSummary, and flips that dish item's switch off
    
    func findInMenuTable() {
        // Check the category of the selectedDish item
        if selectedDish.category == "Entrée" {
            // If entree dish, loop through entreeDishes array
            for entree in menuTableVC.entreeDishes {
                // Find matching dish name and flip switch off
                if entree.name == selectedDish.name {
                    entree.isSelected = false
                }
            }
        } else if selectedDish.category == "Main" {
            // If main dish, loop through mainDishes array
            for main in menuTableVC.mainDishes {
                // Find matching dish name and flip switch off
                if main.name == selectedDish.name {
                    main.isSelected = false
                }
            }
        } else {
            // If dessert dish, loop through dessertDishes array
            for dessert in menuTableVC.dessertDishes {
                // Find matching dish name and flip switch off
                if dessert.name == selectedDish.name {
                    dessert.isSelected = false
                }
            }
        }
    }
}
