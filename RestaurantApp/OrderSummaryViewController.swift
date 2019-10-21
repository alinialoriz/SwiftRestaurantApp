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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
