//
//  DishTableViewCell.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 19/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class DishTableViewCell: UITableViewCell {
    
    
    // Create a dishCell subclass that accepts dishCell parameters to
    // set the value of the dishCell properties in the DishTableViewCell
    class dishCell : NSObject {
        var name : String
        var category : String
        var qty : Int
        var price : Double
        var isSelected : Bool
        
        // initialize dishCell
        init ( name : String, category : String, qty: Int, price : Double, isSelected: Bool) {
            self.name = name
            self.category = category
            self.qty = qty
            self.price = price
            self.isSelected = isSelected
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
