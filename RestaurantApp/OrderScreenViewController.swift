//
//  OrderScreenViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 20/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class OrderScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var orderSummary: UITableView!
    @IBOutlet weak var staffID: UILabel!
    
    // Create a variable that holds a reference to AdminDishesTableView
    var waitStaffIDViewVC = WaitStaffIDViewController()
    
    // Create variable to accept values passed from AdminDishesTableView
    var selectedID : Int = 0
    
     // Create an array that contains the ordered Dish objects
    var orderedDishes : [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set staffID input to the selectedID from WaitStaffIDViewController
        staffID.text = String(selectedID)
        
        // Create 3 Dish objects: dish1, dish2, dish3
        let dish1 = Dish(image: UIImage(named: "potstickers")!, name: "Potstickers", category: "Entrée", qty: 0, price: 6.00, isSelected: true)
        let dish2 = Dish(image: UIImage(named: "xiao-long-bao")!, name: "Xiao long bao", category: "Main", qty: 0, price: 8.00, isSelected: true)
        let dish3 = Dish(image: UIImage(named: "spring-rolls")!, name: "Spring rolls", category: "Main", qty: 0, price: 6.00, isSelected: true)
        
        // Add Dish objects into the temporaryDishes array
        orderedDishes.append(dish1)
        orderedDishes.append(dish2)
        orderedDishes.append(dish3)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderedDishes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Populate a cell with the values of the current dish object
        let cell = tableView.dequeueReusableCell(withIdentifier: "dishCell", for: indexPath) as! DishTableViewCell
    }

}
