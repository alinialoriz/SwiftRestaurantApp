//
//  WaitStaffIDViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 20/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class WaitStaffIDViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var idPicker: UIPickerView!
    
    // Set up array of values to use for PickerView data
    // Array of Wait Staff ID
    var waitStaffIDs = [1001,1002,1003,1004,1005]
    
    //Create variable to hold selected wait staff id
    var selectedID : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.idPicker.dataSource = self
        self.idPicker.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // since only 1 column in data picker, set to 1
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // Set rows to size of waitStaffIDs array
        return waitStaffIDs.count
    }
    // The data to return for the row and component that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(waitStaffIDs[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // Detect and store picker's current row being selected
        selectedID = waitStaffIDs[idPicker.selectedRow(inComponent:0)]
        
       
    }
    @IBAction func selectWaitStaffID(_ sender: Any) {
        
        var message : String
        message = "\nYou are signing in as\nWait Staff ID number:\n\(selectedID)"
        
        let alertController = UIAlertController(title: "Confirm sign in", message:
            message , preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Sign in", style: .default, handler: { action in
            
            //Perform segue to ordering screen
            self.performSegue(withIdentifier: "orderScreenSegue", sender: self.selectedID)
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    // Prepares segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Override to prepare segue and pass reference of this ViewController to StartNewOrderViewController
        if let orderScreenVC = segue.destination as? OrderScreenViewController {
            if let staff = sender as? Int {
            orderScreenVC.waitStaffID = staff
            orderScreenVC.waitStaffIDViewVC = self
            }
        }
    }
}
