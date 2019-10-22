//
//  ViewAllOrdersTableViewCell.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 22/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class ViewAllOrdersTableViewCell: UITableViewCell {

    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var tableNumber: UILabel!
    @IBOutlet weak var staffNumber: UILabel!
    @IBOutlet weak var orderTotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
