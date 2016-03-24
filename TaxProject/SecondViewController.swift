//
//  SecondViewController.swift
//  TaxProject
//
//  Created by Alaa Abdelati on 3/3/16.
//  Copyright © 2016 DePaul University. All rights reserved.
//

import UIKit

var wage = "0.00"
var wHours = "0.00"
var oHours = "0.00"
var oRate = "0.00"

var currency = "0.00"
var hours = "0.00"
var otHours = "0.00"
var otRate = "0.00"

let gradientLayer = CAGradientLayer()

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.hourlyWage.delegate = self;
        self.hoursSincePaycheck.delegate = self;
        self.overtimeHours.delegate = self;
        self.overtimeRate.delegate = self;
        
        self.view.backgroundColor = UIColor(red: 0.8078, green: 0.851, blue: 1, alpha: 1.0)
        
        // 2
        gradientLayer.frame = self.view.bounds
        
        // 3
        let color0 = UIColor(red:250.0/255, green:250.0/255, blue:250.0/255, alpha:0.5).CGColor as CGColorRef
        let color1 = UIColor(red:200.0/255, green:200.0/255, blue: 200.0/255, alpha:0.1).CGColor as CGColorRef
        let color2 = UIColor(red:150.0/255, green:150.0/255, blue: 150.0/255, alpha:0.1).CGColor as CGColorRef
        let color3 = UIColor(red:100.0/255, green:100.0/255, blue: 100.0/255, alpha:0.1).CGColor as CGColorRef
        let color4 = UIColor(red:50.0/255, green:50.0/255, blue:50.0/255, alpha:0.1).CGColor as CGColorRef
        let color5 = UIColor(red:0.0/255, green:0.0/255, blue:0.0/255, alpha:0.1).CGColor as CGColorRef
        let color6 = UIColor(red:150.0/255, green:150.0/255, blue:150.0/255, alpha:0.1).CGColor as CGColorRef
        gradientLayer.colors = [color0, color1, color2, color3, color4, color5, color6]
        
        // 4
        gradientLayer.locations = [0.0, 0.17, 0.34, 0.51, 0.68, 0.85, 1.0]
        
        // 5
        self.view.layer.addSublayer(gradientLayer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var allTextFields: [UITextField]!
    
    
    
    @IBOutlet weak var hourlyWage: UITextField!
    
    @IBAction func hourlyWageReturn(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    
    @IBAction func viewTouched(sender: UIControl) {
        if (hourlyWage.text == "") {
            hourlyWage.text = "0.00"
        }
        if (hoursSincePaycheck.text == "") {
            hoursSincePaycheck.text = "0.00"
        }
        if (overtimeHours.text == "") {
            overtimeHours.text = "0.00"
        }
        if (overtimeRate.text == "") {
            overtimeRate.text = "0.00"
        }
        
        if (hourlyWage.text == "0.00") {
            wage = "0.00"
        }
        if (hoursSincePaycheck.text == "0.00") {
            wHours = "0.00"
        }
        if (overtimeHours.text == "0.00") {
            oHours = "0.00"
        }
        if (overtimeRate.text == "0.00") {
            oRate = "0.00"
        }
        
        currency = currencyStringFromNumber(Double(hourlyWage.text!)!)
        hours = currencyStringFromNumber(Double(hoursSincePaycheck.text!)!)
        otHours = currencyStringFromNumber(Double(overtimeHours.text!)!)
        otRate = currencyStringFromNumber(Double(overtimeRate.text!)!)
        hourlyWage.text = currency
        wage = currency
        hoursSincePaycheck.text = hours
        wHours = hours
        overtimeHours.text = otHours
        oHours = otHours
        overtimeRate.text = otRate
        oRate = otRate
        for field in allTextFields{
            field.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (hourlyWage.text == "") {
            hourlyWage.text = "0.00"
        }
        if (hoursSincePaycheck.text == "") {
            hoursSincePaycheck.text = "0.00"
        }
        if (overtimeHours.text == "") {
            overtimeHours.text = "0.00"
        }
        if (overtimeRate.text == "") {
            overtimeRate.text = "0.00"
        }
        
        if (hourlyWage.text == "0.00") {
            wage = "0.00"
        }
        if (hoursSincePaycheck.text == "0.00") {
            wHours = "0.00"
        }
        if (overtimeHours.text == "0.00") {
            oHours = "0.00"
        }
        if (overtimeRate.text == "0.00") {
            oRate = "0.00"
        }
        
        let currency = currencyStringFromNumber(Double(hourlyWage.text!)!)
        let hours = currencyStringFromNumber(Double(hoursSincePaycheck.text!)!)
        let otHours = currencyStringFromNumber(Double(overtimeHours.text!)!)
        let otRate = currencyStringFromNumber(Double(overtimeRate.text!)!)
        hourlyWage.text = currency
        wage = currency
        hoursSincePaycheck.text = hours
        wHours = hours
        overtimeHours.text = otHours
        oHours = otHours
        overtimeRate.text = otRate
        oRate = otRate
        for field in allTextFields{
            field.resignFirstResponder()
        }
        return true;
    }
    
    func currencyStringFromNumber(number: Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        formatter.currencyCode = NSLocale.currentLocale().displayNameForKey(NSLocaleCurrencySymbol, value: NSLocaleCurrencyCode)
        return formatter.stringFromNumber(number)!
    }
    
    @IBOutlet weak var hoursSincePaycheck: UITextField!
    
    @IBAction func hoursSinceReturn(sender: AnyObject) {
    }
    
    @IBOutlet weak var overtimeHours: UITextField!
    
    @IBAction func overtimeHoursReturn(sender: AnyObject) {
    }
    
    @IBOutlet weak var overtimeRate: UITextField!
    
    @IBAction func overtimeRateReturn(sender: AnyObject) {
    }
    
    
    @IBAction func backBtn(sender: UIButton) {
        dismissViewControllerAnimated(true,
            completion: nil)
    }
    
    
    
    @IBAction func nextBtn(sender: DesignableButton) {
        
        if (hourlyWage.text == "0.00") {
            wage = "0.00"
            currency = "0.00"
        }
        if (hoursSincePaycheck.text == "0.00") {
            wHours = "0.00"
            hours = "0.00"
        }
        if (overtimeHours.text == "0.00") {
            oHours = "0.00"
            otHours = "0.00"
        }
        if (overtimeRate.text == "0.00") {
            oRate = "0.00"
            otRate = "0.00"
        }
        hourlyWage.text = "0.00"
        hoursSincePaycheck.text = "0.00"
        overtimeHours.text = "0.00"
        overtimeRate.text = "0.00"
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
