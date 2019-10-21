//
//  OrderSummaryViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 22/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class OrderSummaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    // Create an array that contains the ordered Dish objects
    var orderedDishes : [Dish] = []
    
    // Reference to MenuTableView
    var previousVC = MenuTableViewController()
    
    // Accept selectedID from MenuTableView
    var selectedID : Int = 0
    
    // UIOutlets
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var waitStaffID: UILabel!
    @IBOutlet weak var tableNumber: UITextField!
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var orderSummary: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up waitStaffID
        waitStaffID!.text = String(selectedID)

        // Compute total cost of ordered dishes
        let totalAmount = computeTotal(dishes: orderedDishes)
        // Display total cost
        totalCost!.text = "$ " + String(format: "%.2f", totalAmount)
    }
    
    // A function that computes total cost of ordered dishes
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
        
        cell.dishName!.text = item.name
        cell.dishQty!.text = String(item.qty)
        
        //Calculate total price of ordered dish
        let orderCost = Double(item.qty) * item.price
        cell.orderPrice!.text = "$ " + String(format: "%.2f", orderCost)
        
        return cell
    }
    
    // Allows order cells to be editable
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Implement delete function when user swipes left on a order cell, to remove an item form order summary
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Remove dish currently selected from orderedDishes array
            orderedDishes.remove(at: indexPath.row)
            
            // Reload orderSummary table view
            orderSummary.reloadData()
            
            // Recompute total cost of ordered dishes
            let totalAmount = computeTotal(dishes: orderedDishes)
            
            // Display new total cost
            totalCost.text = "$ " + String(format: "%.2f", totalAmount)
        }
    }
    
    // On click of folder icon, open list of all orders by specific staff member
    @IBAction func orderHistory(_ sender: Any) {
        // Perfom segway to order history screen
        //********************
    }
    
    // On click of submit order button, send Alert box/ SMS
    @IBAction func submitBtn(_ sender: Any) {
        // Set up notif
        //**********************
    }
    
}
