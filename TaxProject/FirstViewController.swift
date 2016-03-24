//
//  ViewController.swift
//  TaxProject
//
//  Created by Alaa Abdelati on 3/3/16.
//  Copyright © 2016 DePaul University. All rights reserved.
//

import UIKit

let states = [
    "Alabama", "Alaska" , "Arizona" , "Arkansas" , "California" , "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"
]

var selectedState = "Illinois"

let gradientLayer2 = CAGradientLayer()

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var statePicker: UIPickerView!
    
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    @IBAction func nextButton(sender: UIButton) {
        
        let title = "State Selection"
        selectedState = states[statePicker.selectedRowInComponent(0)]
        let message = "You have selected \(selectedState) as your state."
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Destructive, handler: nil)
        let okayAction = UIAlertAction(title: "Confirm", style: .Default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(okayAction)
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statePicker.selectRow(12, inComponent: 0, animated: true)
        
        self.view.backgroundColor = UIColor(red: 0.8078, green: 0.851, blue: 1, alpha: 1.0)
        gradientLayer2.frame = self.view.bounds
        let color0 = UIColor(red:250.0/255, green:250.0/255, blue:250.0/255, alpha:0.5).CGColor as CGColorRef
        let color1 = UIColor(red:200.0/255, green:200.0/255, blue: 200.0/255, alpha:0.1).CGColor as CGColorRef
        let color2 = UIColor(red:150.0/255, green:150.0/255, blue: 150.0/255, alpha:0.1).CGColor as CGColorRef
        let color3 = UIColor(red:100.0/255, green:100.0/255, blue: 100.0/255, alpha:0.1).CGColor as CGColorRef
        let color4 = UIColor(red:50.0/255, green:50.0/255, blue:50.0/255, alpha:0.1).CGColor as CGColorRef
        let color5 = UIColor(red:0.0/255, green:0.0/255, blue:0.0/255, alpha:0.1).CGColor as CGColorRef
        let color6 = UIColor(red:150.0/255, green:150.0/255, blue:150.0/255, alpha:0.1).CGColor as CGColorRef
        gradientLayer2.colors = [color0, color1, color2, color3, color4, color5, color6]
        gradientLayer2.locations = [0.0, 0.17, 0.34, 0.51, 0.68, 0.85, 1.0]
        self.view.layer.addSublayer(gradientLayer2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UIPickerViewDataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    // MARK: UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    
}

