//
//  EntreeTableViewCell.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 20/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

//Pass a String array, to be used on the
//Segue call in the EntreeDishesViewController
//To send to the Order Summary

//protocol MyCustomCellDelegator {
//    func callSegueFromCell(myData: [String])
//}


class EntreeTableViewCell: UITableViewCell {


    @IBOutlet weak var entreeImage: UIImageView!
    @IBOutlet weak var entreeName: UILabel!
    @IBOutlet weak var entreePrice: UILabel!
    @IBOutlet weak var entreeQty: UILabel!
    @IBOutlet weak var entreeSwitch: UISwitch!
    @IBOutlet weak var countStepper: UIStepper!
    
//    //Set the EntreeTableViewCell new Delegate
//    var delegate:MyCustomCellDelegator!
    
    //Set variables to hold the data to be passed to the delegate function
    var cellItemName : String = ""
    var cellItemQty : String = ""
    var cellItemPrice : String = ""
    
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
        entreeQty.text = String(format: "%.0f", sender.value)
        } else {
            entreeQty.text = ""
        }
    }
    
    @IBAction func switchAction(_ sender: Any) {
        if entreeSwitch.isOn == true {
            
            //When switch is flipped on, get item name, qty and price
            //of the modified cell
            cellItemName = entreeName.text!
            cellItemQty = entreeQty.text!
            cellItemPrice = entreePrice.text!
            
            // Disable user from switching back off
            entreeSwitch.isUserInteractionEnabled = false
            countStepper.isEnabled = false
            
//            // Pass data of modified cell to EntreeTableViewController
//            let mydata = [cellItemName, (cellItemQty), (cellItemPrice)]
//            if(self.delegate != nil){ //Just to be safe.
//                self.delegate.callSegueFromCell(myData: mydata)
//            }
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
