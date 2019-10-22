//
//  AllOrdersTableViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 22/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class AllOrdersTableViewController: UITableViewController {
    
    @IBOutlet var allOrders: UITableView!
    
    // Create a variable that holds a reference to OrderSummaryView
    var previousVC = OrderSummaryViewController()
    
    // Create a variable to hold the Order object passed from OrderSummaryView
    var newOrder : Order!
    
    // Create a variable to hold an array of Order objects
    var ordersArray : [Order] = []
    
    
    let order1 = Order(oNum: "200", tNum: 12, sNum: 1002, oTotal: 16.00, oDishes: [Dish(image: UIImage(named: "xiao-long-bao")!, name: "Xiao long bao", category: "Entrée", qty: 2, price: 8.00, isSelected: true)])
    
    let order2 = Order(oNum: "201", tNum: 8, sNum: 1003, oTotal: 28.00, oDishes: [Dish(image: UIImage(named: "xiao-long-bao")!, name: "Xiao long bao", category: "Entrée", qty: 2, price: 8.00, isSelected: true), Dish(image: UIImage(named: "xiao-long-bao")!, name: "Xiao long bao", category: "Main", qty: 1, price: 12.00, isSelected: true)])
    
    let order3 = Order(oNum: "202", tNum: 4, sNum: 1004, oTotal: 14.00, oDishes: [Dish(image: UIImage(named: "xiao-long-bao")!, name: "Xiao long bao", category: "Main", qty: 1, price: 14.00, isSelected: true)])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ordersArray.append(order1)
        ordersArray.append(order2)
        ordersArray.append(order3)
        
        if newOrder != nil {
            ordersArray.append(newOrder)
        }
        print(ordersArray[0].orderNumber + "\n" + String(ordersArray[0].staffNumber) + "\n" + String(ordersArray.count))
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ordersArray.count
    }
    
    // Populate each table view cell with an order object
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let orderInfo : Order = ordersArray [indexPath.row]
        
        // Populate a cell with the values of the current order object
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderListCell", for: indexPath) as! ViewAllOrdersTableViewCell
        
        // Call the setOrder function of the ViewAllOrdersTableViewCell class
        // and pass current Order object to populate cell properties
        cell.setOrder(order: orderInfo)
        
        return cell
    }

}
