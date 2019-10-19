//
//  Dish.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 19/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import Foundation
import UIKit

// Create a Dish object that contains
// the following properties: name, category, qty, price, isSelected
class Dish : NSObject {
    
    var name : String
    var category : String
    var qty : Int
    var price : Double
    var isSelected : Bool
    
    // initialize Dish object
    init ( name : String, category : String, qty: Int, price : Double, isSelected: Bool) {
        self.name = name
        self.category = category
        self.qty = qty
        self.price = price
        self.isSelected = isSelected
        
    }
}
