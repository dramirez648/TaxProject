//
//  FourthViewController.swift
//  TaxProject
//
//  Created by Daniel Ramirez on 3/11/16.
//  Copyright © 2016 DePaul University. All rights reserved.
//

import UIKit
import QuartzCore

let gradientLayer4 = CAGradientLayer()

class FourthViewController: UIViewController, UITextFieldDelegate {
    
    func infoTapping () {
        let title = "Pay Stub Sheet"
        let message = "If you go to the next page, you can tap the screen once to populate your data, and twice to save a screenshot of your Pay Stub."
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let invalidAction = UIAlertAction(title: "Got It!", style: .Cancel, handler: nil)
        alertController.addAction(invalidAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        
        infoTapping()
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(red: 0.8078, green: 0.851, blue: 1, alpha: 1.0)
        gradientLayer4.frame = self.view.bounds
        let color0 = UIColor(red:250.0/255, green:250.0/255, blue:250.0/255, alpha:0.5).CGColor as CGColorRef
        let color1 = UIColor(red:200.0/255, green:200.0/255, blue: 200.0/255, alpha:0.1).CGColor as CGColorRef
        let color2 = UIColor(red:150.0/255, green:150.0/255, blue: 150.0/255, alpha:0.1).CGColor as CGColorRef
        let color3 = UIColor(red:100.0/255, green:100.0/255, blue: 100.0/255, alpha:0.1).CGColor as CGColorRef
        let color4 = UIColor(red:50.0/255, green:50.0/255, blue:50.0/255, alpha:0.1).CGColor as CGColorRef
        let color5 = UIColor(red:0.0/255, green:0.0/255, blue:0.0/255, alpha:0.1).CGColor as CGColorRef
        let color6 = UIColor(red:150.0/255, green:150.0/255, blue:150.0/255, alpha:0.1).CGColor as CGColorRef
        gradientLayer4.colors = [color0, color1, color2, color3, color4, color5, color6]
        gradientLayer4.locations = [0.0, 0.17, 0.34, 0.51, 0.68, 0.85, 1.0]
        self.view.layer.addSublayer(gradientLayer4)
        
        self.view.addSubview(backgroundView)
        let sTap = UITapGestureRecognizer(target: self, action: "singleTapped:")
        let dTap = UITapGestureRecognizer(target: self, action: "doubleTapped:")
        sTap.numberOfTapsRequired = 1
        dTap.numberOfTapsRequired = 2
        backgroundView.addGestureRecognizer(sTap)
        backgroundView.addGestureRecognizer(dTap)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var backgroundView: UIView!
    
    
    func takeScreenshot() -> UIImage {

        UIGraphicsBeginImageContext(backgroundView.bounds.size);
        backgroundView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image
    }
    
    func doubleTapped(sender: UITapGestureRecognizer) {
        
        let image = takeScreenshot()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    func singleTapped(send:UITapGestureRecognizer) {
        fillLabels()
        
    }
    

    
    @IBOutlet weak var regRateLabel: UILabel!
    
    @IBOutlet weak var overRateLabel: UILabel!
    
    @IBOutlet weak var regHoursLabel: UILabel!
    
    @IBOutlet weak var overHoursLabel: UILabel!
    
    @IBOutlet weak var regWageLabe: UILabel!
    
    @IBOutlet weak var overWageLabel: UILabel!
    
    @IBOutlet weak var totalWageLabel: UILabel!
    
    
    @IBOutlet weak var fedTax: UILabel!
    
    @IBOutlet weak var ssTax: UILabel!
    
    @IBOutlet weak var medTax: UILabel!
    
    @IBOutlet weak var stateTax: UILabel!
    
    
    @IBOutlet weak var totalTax: UILabel!
    
    @IBOutlet weak var netPay: UILabel!
    
    @IBOutlet weak var fedTaxWages: UILabel!
    
    func fillLabels() {

        regRateLabel.text = wage
        let otr = (Double(wage)! * Double(oRate)!)
        overRateLabel.text = currencyStringFromNumber(otr)
        regHoursLabel.text = wHours
        overHoursLabel.text = oHours
        
        let rw = Double(wage)! * Double(wHours)!
        regWageLabe.text = currencyStringFromNumber(rw)
        let ow = otr * Double(oHours)!
        overWageLabel.text = currencyStringFromNumber(ow)
        
        let tw = rw + ow
        totalWageLabel.text = currencyStringFromNumber(tw)
        
        netPay.text = postText
        
        totalTax.text = totalText
        
        fedTaxWages.text = fedText
        
        medTax.text = medText
        
        ssTax.text = socialText
        
        stateTax.text = stateText
        
        fedTax.text = fedText
    
        
    }
    
    func currencyStringFromNumber(number: Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        formatter.currencyCode = NSLocale.currentLocale().displayNameForKey(NSLocaleCurrencySymbol, value: NSLocaleCurrencyCode)
        return formatter.stringFromNumber(number)!
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
