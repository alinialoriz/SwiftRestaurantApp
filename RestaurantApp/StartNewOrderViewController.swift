//
//  StartNewOrderViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 21/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class StartNewOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Create a variable that holds a reference to WaitStaffIDTableView
    var previousVC = WaitStaffIDViewController()
    
    // Create a variable to hold the selectedID from WaitStaffIDTableView
    var selectedID : Int = 0
    
    // UIoutlets
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var waitStaffID: UILabel!
    @IBOutlet weak var tableNumber: UITextField!
    @IBOutlet weak var orderSummaryTableView: UITableView!
    @IBOutlet weak var totalCost: UILabel!
    
    // Create an array that contains the ordered Dish objects
    var orderedDishes : [Dish] = []
    
    // Create 3 Dish objects: dish1, dish2, dish3
    let dish1 = Dish(image: UIImage(named: "potstickers")!, name: "Potstickers", category: "Entrée", qty: 2, price: 6.00, isSelected: true)
    let dish2 = Dish(image: UIImage(named: "xiao-long-bao")!, name: "Xiao long bao", category: "Main", qty: 1, price: 8.00, isSelected: true)
    let dish3 = Dish(image: UIImage(named: "spring-rolls")!, name: "Spring rolls", category: "Main", qty: 3, price: 6.00, isSelected: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set waitStaffID to selectedID from previousVC
        waitStaffID.text = String(selectedID)
        
        // Add Dish objects into the orderedDishes array
        orderedDishes.append(dish1)
        orderedDishes.append(dish2)
        orderedDishes.append(dish3)
        
        // Compute total cost of ordered dishes
        let totalAmount = computeTotal(dishes: orderedDishes)
        // Display total cost
        totalCost.text = "$ " + String(format: "%.2f", totalAmount)

    }
    
    // A function that computes total cost or ordered dishes
    
    func computeTotal(dishes: [Dish]) -> Double {
        
        var total : Double = 0.00
        
        for dish in dishes {
            total += (Double(dish.qty) * dish.price)
        }
        return total
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderedDishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Populate a cell with the values of the current dish object
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderTableViewCell
        
        //get current item
        let item = orderedDishes[indexPath.row]
        
        cell.dishName.text = item.name
        cell.dishQty.text = String(item.qty)
        
        //Calculate total price of ordered dish
        let orderCost = Double(item.qty) * item.price
        cell.orderPrice.text = "$ " + String(format: "%.2f", orderCost)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath) {
        
        //Get the index value  of selected cell on the orderSummaryTableView
        let indexPath = tableView.indexPathForSelectedRow!
        
        let dishInfo = orderedDishes[indexPath.row]
        // Open order edit mode when cell item in the Order Summary is clicked
        performSegue(withIdentifier: "editOrderSegue", sender: dishInfo)
        
    }
    
    //Prepare segue to EditOrderViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Override to prepare segue and pass reference of this ViewController to EditOrderViewController
        if let editOrderScreenVC = segue.destination as? EditOrderViewController {
            if let dish = sender as? Dish {
                editOrderScreenVC.selectedDish = dish
                editOrderScreenVC.previousVC = self
            }
        }
    }
    
    
    
    // Allows table cells to be editable
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Implement delete function when user swipes left on a table cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            orderedDishes.remove(at: indexPath.row)
            
            orderSummaryTableView.reloadData()
            
            // Recompute total cost of ordered dishes
            let totalAmount = computeTotal(dishes: orderedDishes)
            
            // Display new total cost
            totalCost.text = "$ " + String(format: "%.2f", totalAmount)
            
        }
    }
    
    // Handle submitBtn action
    @IBAction func submitBtn(_ sender: Any) {
        
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
    
    // Hanndle addBtn action
    @IBAction func addBtn(_ sender: Any) {
        //Perform segue to menu
        performSegue(withIdentifier: "menuSegue", sender: nil)
    }
    
}
