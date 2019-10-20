//
//  EntreeDishesViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 20/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit


class EntreeDishesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MyCustomCellDelegator {
    
    //Create an array of entree dishes
    var entreeCells : [Dish] = []
   
    
    // Create 3 Dish objects: dish1, dish2, dish3
    let dish1 = Dish(image: UIImage(named: "potstickers")!, name: "Potstickers", category: "Entrée", qty: 0, price: 6.00, isSelected: false)
    let dish2 = Dish(image: UIImage(named: "xiao-long-bao")!, name: "Xiao long bao", category: "Entrée", qty: 0, price: 8.00, isSelected: false)
    let dish3 = Dish(image: UIImage(named: "spring-rolls")!, name: "Spring rolls", category: "Entrée", qty: 0, price: 6.00, isSelected: false)

    @IBOutlet weak var entreeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add Dish objects into the entreeCells array
        entreeCells.append(dish1)
        entreeCells.append(dish2)
        entreeCells.append(dish3)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entreeCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = entreeTableView.dequeueReusableCell(withIdentifier: "entreeCell", for: indexPath) as! EntreeTableViewCell
        
        let item = entreeCells[indexPath.row]
        
        cell.entreeImage.image = item.image
        cell.entreeName.text = item.name
        cell.entreePrice.text = String(format: "%.2f", item.price)
        cell.entreeSwitch.isOn = item.isSelected
        
        if item.qty == 0 {
            cell.entreeQty.text = ""
        }
        
        cell.delegate = self
        
        return cell
    }
    
        // Use the Protocol in EntreeTableViewCell to access data in the delegate function
        func callSegueFromCell(myData: [String]) {
        
        //Perform segue to OrderScreenViewController
        self.performSegue(withIdentifier: "newOrder", sender: myData)
    }
    
    // Prepares segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Override to prepare segue and pass reference of this ViewController to OrderScreenViewController
        if let orderScreenVC = segue.destination as? OrderScreenViewController {
            if let dish = sender as? [String] {
                orderScreenVC.newOrderString = dish
                orderScreenVC.entreeTableViewVC = self
            }
        }
    
    }
}
