//
//  OrderScreenViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 20/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

struct order {
    var name : String!
    var qty : Int!
    var price : Double!
}

class OrderScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var orderTableView: UITableView!
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var staffID: UILabel!
    @IBOutlet weak var tableNumber: UITextField!
    @IBOutlet weak var totalOrder: UILabel!
    
    var orderedEntreeDishes : [order] = []

    
    // Create a variable that holds a reference to AdminDishesTableView
    var waitStaffIDViewVC = WaitStaffIDViewController()
    
    // Create a variable that holds a reference to EntreeDishesTableView
    var entreeTableViewVC = EntreeDishesViewController()
    
    // Create variable to accept values passed from AdminDishesTableView
    var waitStaffID : Int = 0
    
    // Create variable to accept values passed from EntreeDishesTableView
    var newOrderString : [String] = []
    
//     // Create an array that contains the ordered Dish objects
//    var orderedDishes : [Dish] = []
//
//    // Create 3 Dish objects: dish1, dish2, dish3
//    let dish1 = Dish(image: UIImage(named: "potstickers")!, name: "Potstickers", category: "Entrée", qty: 2, price: 6.00, isSelected: true)
//    let dish2 = Dish(image: UIImage(named: "xiao-long-bao")!, name: "Xiao long bao", category: "Main", qty: 1, price: 8.00, isSelected: true)
//    let dish3 = Dish(image: UIImage(named: "spring-rolls")!, name: "Spring rolls", category: "Main", qty: 3, price: 6.00, isSelected: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Set staffID input to the selectedID from WaitStaffIDViewController
        staffID.text = String(waitStaffID)
        
        //Create a newOrder object from the myData object passed from the EntreeTableViewCell
        if newOrderString.isEmpty == false {
            let newOrder = order(name:newOrderString[0], qty: Int(newOrderString[1])!, price: Double(newOrderString[2])!)
            // Add Dish objects into the orderedEntreeDishes array
            orderedEntreeDishes.append(newOrder)
        }
        
        
//        // Add Dish objects into the orderedDishes array
//        orderedDishes.append(dish1)
//        orderedDishes.append(dish2)
//        orderedDishes.append(dish3)
        
        // Compute total cost of ordered dishes
        let totalAmount = computeTotal(dishes: orderedEntreeDishes)
        // Display total cost
        totalOrder.text = "$ " + String(format: "%.2f", totalAmount)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderedEntreeDishes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Populate a cell with the values of the current dish object
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderTableViewCell
        
        //get current item
        let item = orderedEntreeDishes[indexPath.row]
        
        cell.dishName.text = item.name
        cell.dishQty.text = String(item.qty)
        
        //Calculate total price of ordered dish
        let orderCost = Double(item.qty) * item.price
        cell.orderPrice.text = "$ " + String(format: "%.2f", orderCost)
        
        return cell
    }
    
    // A function that computes total cost or ordered dishes
    
    func computeTotal(dishes: [order]) -> Double {
        
        var total : Double = 0.00
        
        for dish in dishes {
            total += (Double(dish.qty) * dish.price)
        }
        return total
    }
    
    @IBAction func submitOrderBtn(_ sender: Any) {
        
        // On submit, check if Table Number input field is not empty
        if tableNumber.text!.isEmpty == true {
            let alertController = UIAlertController(title:
                "Error Order Submission", message: "\nCannot sumbit an order with missing Table Number input field.",
                                      preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Dismiss", style:
                .cancel, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion:
                nil)
            tableNumber.attributedPlaceholder = NSAttributedString(string: "missing field",
                                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        } else {
                let alertController = UIAlertController(title:
                    "Successful Order Submission", message: "\nYour Order Number \(orderNumber.text!)\nhas been sent to the kitchen.",
                                              preferredStyle: .alert)
                
                let alertAction = UIAlertAction(title: "Dismiss", style:
                    .cancel, handler: nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion:
                    nil)
            }
        }
    
    // Allows table cells to be editable
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Implement delete function when user swipes left on a table cell
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            orderedEntreeDishes.remove(at: indexPath.row)
            
            orderTableView.reloadData()
            
            // Recompute total cost of ordered dishes
            let totalAmount = computeTotal(dishes: orderedEntreeDishes)
           
            // Display new total cost
            totalOrder.text = "$ " + String(format: "%.2f", totalAmount)
            
        }
    }
    @IBAction func addDishes(_ sender: Any){
        //Perform segue to menu
        performSegue(withIdentifier: "menuSegue", sender: nil)
    }
}
