//
//  MainTabBarViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 20/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    // Create a variable that holds a reference to AdminDishesTableView
    var waitStaffIDViewVC = WaitStaffIDViewController()
    
    // Create variable to accept values passed from AdminDishesTableView
    var waitStaffID : Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(waitStaffID)
        
        // Retrieves all tab bar view controllers
        guard let viewControllers = viewControllers else {
            return
        }
        
        // Loop through all the tab bar view controllers retrieved
        for viewController in viewControllers {
            // Get view controller that shows Start New Order screen
            if let orderScreenViewController = viewController as? OrderScreenViewController {
                // Set selectedID variable in OrderScreenViewController to the waitStaffID value
                orderScreenViewController.selectedID = waitStaffID
                
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
