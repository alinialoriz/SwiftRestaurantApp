//
//  EntreeDishesViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 20/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class EntreeDishesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        cell.entreePrice.text = "$ " + String(format: "%.2f", item.price)
        cell.entreeSwitch.isOn = item.isSelected
        
        if item.qty == 0 {
            cell.entreeQty.text = ""
        } else {
            cell.entreeQty.text = "x" + String(item.qty)
        }
        
        return cell
    }

}
