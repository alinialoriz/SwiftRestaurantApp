//
//  AdminDishesTableViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 18/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

//This class handles the TableView of the Admin user

class AdminDishesTableViewController: UITableViewController {
    
    @IBOutlet var dishesTableView: UITableView!
    
    // Create an array that contains Dish objects
    var dishes : [Dish] = []
    
    // Implement a segue for addBtn to move to Add New Dish form view
    @IBAction func addBtn(_ sender: Any) {
        performSegue(withIdentifier: "addNewDishSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call createArray function and populate the dishes array
        
        dishes = createArray()
    }
    
    // A function that creates a temporary array containing Dish objects
    // which will be passed into the dishes array
    
    func createArray() -> [Dish] {
        
        // Create a temporary array containing Dish objects
        var temporaryDishes : [Dish] = []
        
        // Create 3 Dish objects: dish1, dish2, dish3
        let dish1 = Dish(image: UIImage(named: "potstickers")!, name: "Potstickers", category: "Entrée", qty: 0, price: 6.00, isSelected: false)
        let dish2 = Dish(image: UIImage(named: "xiao-long-bao")!, name: "Xiao long bao", category: "Entrée", qty: 0, price: 8.00, isSelected: false)
        let dish3 = Dish(image: UIImage(named: "spring-rolls")!, name: "Spring rolls", category: "Entrée", qty: 0, price: 6.00, isSelected: false)
        
        // Add Dish objects into the temporaryDishes array
        temporaryDishes.append(dish1)
        temporaryDishes.append(dish2)
        temporaryDishes.append(dish3)
        
        // return a Dish array when this function is called
        return temporaryDishes
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Set number of table view rows according to number of items in dishes array
        return dishes.count
    }
    
    // Populate each table view cell with a specific dish object
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get dish object from dishes array at a specific index
        let dish = dishes[indexPath.row]
        
        // Populate a cell with the values of the current dish object
        let cell = tableView.dequeueReusableCell(withIdentifier: "dishCell", for: indexPath) as! DishTableViewCell

            // Call the setDish function of the DishTableViewCell class
            // and pass current dish object to populate cell properties
            cell.setDish(dish: dish)

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Override to prepare segue and pass reference of this ViewController to AddNewDishViewController
        let addNewDishVC = segue.destination as! AddNewDishViewController
        addNewDishVC.adminTableViewVC = self
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
