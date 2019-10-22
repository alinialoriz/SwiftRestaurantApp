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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ordersArray.append(order1)
        if newOrder != nil {
            ordersArray.append(newOrder)
        }
        print(ordersArray[0].orderNumber + "\n" + String(ordersArray[0].staffNumber) + "\n" + String(ordersArray.count))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
