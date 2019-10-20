//
//  EntreeTableViewCell.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 20/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class EntreeTableViewCell: UITableViewCell {


    @IBOutlet weak var entreeImage: UIImageView!
    @IBOutlet weak var entreeName: UILabel!
    @IBOutlet weak var entreePrice: UILabel!
    @IBOutlet weak var entreeQty: UILabel!
    @IBOutlet weak var entreeSwitch: UISwitch!
    @IBOutlet weak var countStepper: UIStepper!
    // Subclass that accepts parameters to initialize entreeCell
    
    class entreeCell: NSObject {
        
        var eImage : UIImage
        var eName : String
        var ePrice : Double
        var eQty : Int
        var eSwitchValue : Bool
        
        init(image : UIImage, name : String, price : Double, qty : Int, sw : Bool) {
            
            self.eImage = image
            self.eName = name
            self.ePrice = price
            self.eQty = qty
            self.eSwitchValue = sw
        }
    }
    
    @IBAction func entreeStepper(_ sender: UIStepper) {
        
        if sender.value >= 1 {
        entreeQty.text = "x" + String(format: "%.0f", sender.value)
        entreeSwitch.isOn = true
        } else {
            entreeQty.text = ""
            entreeSwitch.isOn = false
        }
    }
    
    @IBAction func switchAction(_ sender: Any) {
        if entreeSwitch.isOn == false {
            entreeQty.text = ""
        } else {
            entreeQty.text = "x" + String(format: "%.0f", countStepper.value)
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
