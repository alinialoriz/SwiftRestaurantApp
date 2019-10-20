//
//  OrderScreenViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 20/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class OrderScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var orderTableView: UITableView!
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var staffID: UILabel!
    @IBOutlet weak var tableNumber: UITextField!
    @IBOutlet weak var totalOrder: UILabel!
    
    
    // Create variable to accept values passed from AdminDishesTableView
    var selectedID : Int = 0
    
     // Create an array that contains the ordered Dish objects
    var orderedDishes : [Dish] = []
    
    // Create 3 Dish objects: dish1, dish2, dish3
    let dish1 = Dish(image: UIImage(named: "potstickers")!, name: "Potstickers", category: "Entrée", qty: 2, price: 6.00, isSelected: true)
    let dish2 = Dish(image: UIImage(named: "xiao-long-bao")!, name: "Xiao long bao", category: "Main", qty: 1, price: 8.00, isSelected: true)
    let dish3 = Dish(image: UIImage(named: "spring-rolls")!, name: "Spring rolls", category: "Main", qty: 3, price: 6.00, isSelected: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set staffID input to the selectedID from WaitStaffIDViewController
        staffID.text = String(selectedID)
        
        // Add Dish objects into the temporaryDishes array
        orderedDishes.append(dish1)
        orderedDishes.append(dish2)
        orderedDishes.append(dish3)
        
        // Compute total cost of ordered dishes
        let totalAmount = computeTotal(dishes: orderedDishes)
        // Display total cost
        totalOrder.text = "$ " + String(format: "%.2f", totalAmount)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderedDishes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Populate a cell with the values of the current dish object
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderTableViewCell
        
        // Call the setOrder function of the OrderTableViewCell class
        // and pass current dish object to populate cell properties
        cell.setOrder(dish : orderedDishes[indexPath.row])
        
        return cell
    }
    
    // A function that computes total cost or ordered dishes
    
    func computeTotal(dishes: [Dish]) -> Double {
        
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
    }
