//
//  ThirdViewController.swift
//  TaxProject
//
//  Created by Daniel Ramirez on 3/10/16.
//  Copyright © 2016 DePaul University. All rights reserved.


//        income = ((Double(wage)! * Double(wHours)!) + ((Double(wage)! * Double(oRate)!) * Double(oHours)!))
//
//        let SocialSecurityDeduction = income * 0.062
//
//        let MedicareDeduction = income * 0.0144975
//
//        let FederalTaxDeduction = income * 0.129788
//
//        if (selectedState == "Alabama") {
//            grossEarnings.text = String(currencyStringFromNumber(income))
//            medicareD.text = String(currencyStringFromNumber(MedicareDeduction))
//            socialSecurityD.text = String(currencyStringFromNumber(SocialSecurityDeduction))
//            federalTaxD.text = String(currencyStringFromNumber(FederalTaxDeduction))
//            calcStateTaxDeduction()
//
//            let TotalDeduction = (SocialSecurityDeduction + MedicareDeduction + FederalTaxDeduction + StateTaxDeduction)
//            totalD.text = String(currencyStringFromNumber(TotalDeduction))
//            let PostTaxEarnings = income - TotalDeduction
//            postTaxEarnings.text = String(currencyStringFromNumber(PostTaxEarnings))
//        }
//



import UIKit


var StateTaxDeduction = 0.00

var postText = ""

var totalText = ""

var fedText = ""

var medText = ""

var socialText = ""

var stateTaxD = ""

var stateText = ""


let gradientLayer3 = CAGradientLayer()

class ThirdViewController: UIViewController, UITextFieldDelegate {
    
    var income = ((Double(wage)! * Double(wHours)!) + ((Double(wage)! * Double(oRate)!) * Double(oHours)!))
    
    var SocialSecurityDeduction = ((Double(wage)! * Double(wHours)!) + ((Double(wage)! * Double(oRate)!) * Double(oHours)!)) * 0.062
    
    var MedicareDeduction = ((Double(wage)! * Double(wHours)!) + ((Double(wage)! * Double(oRate)!) * Double(oHours)!)) * 0.0144975
    
    var FederalTaxDeduction = ((Double(wage)! * Double(wHours)!) + ((Double(wage)! * Double(oRate)!) * Double(oHours)!)) * 0.129788

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.8078, green: 0.851, blue: 1, alpha: 1.0)
        gradientLayer3.frame = self.view.bounds
        let color0 = UIColor(red:250.0/255, green:250.0/255, blue:250.0/255, alpha:0.5).CGColor as CGColorRef
        let color1 = UIColor(red:200.0/255, green:200.0/255, blue: 200.0/255, alpha:0.1).CGColor as CGColorRef
        let color2 = UIColor(red:150.0/255, green:150.0/255, blue: 150.0/255, alpha:0.1).CGColor as CGColorRef
        let color3 = UIColor(red:100.0/255, green:100.0/255, blue: 100.0/255, alpha:0.1).CGColor as CGColorRef
        let color4 = UIColor(red:50.0/255, green:50.0/255, blue:50.0/255, alpha:0.1).CGColor as CGColorRef
        let color5 = UIColor(red:0.0/255, green:0.0/255, blue:0.0/255, alpha:0.1).CGColor as CGColorRef
        let color6 = UIColor(red:150.0/255, green:150.0/255, blue:150.0/255, alpha:0.1).CGColor as CGColorRef
        gradientLayer3.colors = [color0, color1, color2, color3, color4, color5, color6]
        gradientLayer3.locations = [0.0, 0.17, 0.34, 0.51, 0.68, 0.85, 1.0]
        self.view.layer.addSublayer(gradientLayer3)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func currencyStringFromNumber(number: Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        formatter.currencyCode = NSLocale.currentLocale().displayNameForKey(NSLocaleCurrencySymbol, value: NSLocaleCurrencyCode)
        return formatter.stringFromNumber(number)!
    }
    
    
    @IBOutlet weak var grossEarnings: UILabel!
    
    @IBOutlet weak var medicareD: UILabel!
    
    @IBOutlet weak var socialSecurityD: UILabel!
    
    @IBOutlet weak var federalTaxD: UILabel!
    
    @IBOutlet weak var stateTaxD: UILabel!
    
    @IBOutlet weak var totalD: UILabel!
    
    @IBOutlet weak var postTaxEarnings: UILabel!
    
    @IBOutlet weak var dontForgetLabel: UILabel!
    
    @IBAction func startOverBtn(sender: DesignableButton) {
        grossEarnings.text = "0.00"
        medicareD.text = "0.00"
        socialSecurityD.text = "0.00"
        federalTaxD.text = "0.00"
        stateTaxD.text = "0.00"
        totalD.text = "0.00"
        postTaxEarnings.text = "0.00"
        
        dontForgetLabel.text = "Don't Forget to Press Me!"
        
        wage = "0.00"
        wHours = "0.00"
        oHours = "0.00"
        oRate = "0.00"
        
        currency = "0.00"
        hours = "0.00"
        otHours = "0.00"
        otRate = "0.00"
        
        swipeRightLabel.text = ""
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBOutlet weak var swipeRightLabel: UILabel!
    
    
    @IBAction func updateWageBtn(sender: DesignableButton) {
        
        
        dontForgetLabel.text = ""
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.swipeRightLabel.alpha = 0.0
            }, completion: { (finished: Bool) -> Void in
                
                //Once the label is completely invisible, set the text and fade it back in
                self.swipeRightLabel.text = "Swipe Right To View Your Pay Stub"
                
                // Fade in
                UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    self.swipeRightLabel.alpha = 1.0
                    }, completion: nil)
        })
        
        calcMyTaxNow()
        
    }
    
    func calcStateTaxDeductionNone() {
        
        StateTaxDeduction = 0.00
    }
    
    func calcStateTaxDeductionAlabama() {
        if (income <= 500.00) {
            StateTaxDeduction = income * 0.02
        }
        else if (income >= 501.00 && income <= 3000.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 3000.00) {
            StateTaxDeduction = income * 0.05
        }
    }
    
    func calcStateTaxDeductionArizona() {
        if (income <= 10163.00) {
            StateTaxDeduction = income * 0.0259
        }
        else if (income > 10163.00 && income <= 25406.00) {
            StateTaxDeduction = income * 0.0288
        }
        else if (income > 25406.00 && income <= 50812.00) {
            StateTaxDeduction = income * 0.0336
        }
        else if (income > 50812.00 && income <= 152434.00) {
            StateTaxDeduction = income * 0.0424
        }
        else if (income > 152434.00) {
            StateTaxDeduction = income * 0.0454
        }
    }
    
    func calcStateTaxDeductionArkansas() {
        if (income <= 4299.00) {
            StateTaxDeduction = income * 0.009
        }
        else if (income > 4300.00 && income <= 8399.00) {
            StateTaxDeduction = income * 0.024
        }
        else if (income > 8399.00 && income <= 12699.00) {
            StateTaxDeduction = income * 0.034
        }
        else if (income > 12699.00 && income <= 21099.00) {
            StateTaxDeduction = income * 0.044
        }
        else if (income > 21099.00 && income <= 35299.00) {
            StateTaxDeduction = income * 0.06
        }
        else if (income > 35299.00) {
            StateTaxDeduction = income * 0.07
        }
    }
    
    func calcStateTaxDeductionCalifornia() {
        if (income <= 7850.00) {
            StateTaxDeduction = income * 0.01
        }
        else if (income > 7850.00 && income <= 18610.00) {
            StateTaxDeduction = income * 0.02
        }
        else if (income > 18610.00 && income <= 29372.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 29372.00 && income <= 40773.00) {
            StateTaxDeduction = income * 0.06
        }
        else if (income > 40773.00 && income <= 51530.00) {
            StateTaxDeduction = income * 0.08
        }
        else if (income > 51530.00 && income <= 263222.00) {
            StateTaxDeduction = income * 0.093
        }
        else if (income > 263222.00 && income <= 315866.00) {
            StateTaxDeduction = income * 0.103
        }
        else if (income > 315866.00 && income <= 526443.00) {
            StateTaxDeduction = income * 0.113
        }
        else if (income > 526443.00) {
            StateTaxDeduction = income * 0.123
        }
    }
    
    func calcStateTaxDeductionColorado() {
        StateTaxDeduction = income * 0.0463
    }
    
    func calcStateTaxDeductionConnecticut() {
        if (income <= 10000.00) {
            StateTaxDeduction = income * 0.03
        }
        else if (income > 10000.00 && income <= 50000.00) {
            StateTaxDeduction = income * 0.05
        }
        else if (income > 50000.00 && income <= 100000.00) {
            StateTaxDeduction = income * 0.055
        }
        else if (income > 100000.00 && income <= 200000.00) {
            StateTaxDeduction = income * 0.06
        }
        else if (income > 200000.00 && income <= 250000.00) {
            StateTaxDeduction = income * 0.065
        }
        else if (income > 250000.00 && income <= 500000.00) {
            StateTaxDeduction = income * 0.069
        }
        else if (income > 500000.00) {
            StateTaxDeduction = income * 0.0699
        }
    }
    
    func calcStateTaxDeductionDelaware() {
        if (income <= 2000.00) {
            StateTaxDeduction = income * 0
        }
        else if (income > 2000.00 && income <= 5000.00) {
            StateTaxDeduction = income * 0.022
        }
        else if (income > 5000.00 && income <= 10000.00) {
            StateTaxDeduction = income * 0.039
        }
        else if (income > 10000.00 && income <= 20000.00) {
            StateTaxDeduction = income * 0.048
        }
        else if (income > 20000.00 && income <= 25000.00) {
            StateTaxDeduction = income * 0.052
        }
        else if (income > 25000.00 && income <= 60000.00) {
            StateTaxDeduction = income * 0.0555
        }
        else if (income > 60000.00) {
            StateTaxDeduction = income * 0.066
        }
    }
    
    func calcStateTaxDeductionGeorgia() {
        if (income <= 750.00) {
            StateTaxDeduction = income * 0.01
        }
        else if (income > 750.00 && income <= 2250.00) {
            StateTaxDeduction = income * 0.02
        }
        else if (income > 2250.00 && income <= 3750.00) {
            StateTaxDeduction = income * 0.03
        }
        else if (income > 3750.00 && income <= 5250.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 5250.00 && income <= 7000.00) {
            StateTaxDeduction = income * 0.05
            
        }
        else if (income > 7000.00) {
            StateTaxDeduction = income * 0.06
        }
    }
    
    func calcStateTaxDeductionHawaii() {
        if (income <= 2400.00) {
            StateTaxDeduction = income * 0.014
        }
        else if (income > 2400.00 && income <= 4800.00) {
            StateTaxDeduction = income * 0.032
        }
        else if (income > 4800.00 && income <= 9600.00) {
            StateTaxDeduction = income * 0.055
        }
        else if (income > 9600.00 && income <= 14400.00) {
            StateTaxDeduction = income * 0.064
        }
        else if (income > 14400.00 && income <= 19200.00) {
            StateTaxDeduction = income * 0.068
        }
        else if (income > 19200.00 && income <= 24000.00) {
            StateTaxDeduction = income * 0.072
        }
        else if (income > 24000.00 && income <= 36000.00) {
            StateTaxDeduction = income * 0.076
        }
        else if (income > 36000.00 && income <= 48000.00) {
            StateTaxDeduction = income * 0.079
        }
        else if (income > 48000.00 && income <= 150000.00) {
            StateTaxDeduction = income * 0.0825
        }
        else if (income > 150000.00 && income <= 175000.00) {
            StateTaxDeduction = income * 0.09
        }
        else if (income > 175000.00 && income <= 200000.00) {
            StateTaxDeduction = income * 0.10
        }
        else if (income > 200000.00) {
            StateTaxDeduction = income * 0.11
        }
    }
    
    func calcStateTaxDeductionIdaho() {
        if (income <= 1451.00) {
            StateTaxDeduction = income * 0.016
        }
        else if (income > 1451.00 && income <= 2903.00) {
            StateTaxDeduction = income * 0.036
        }
        else if (income > 2903.00 && income <= 4355.00) {
            StateTaxDeduction = income * 0.041
        }
        else if (income > 4355.00 && income <= 58070.00) {
            StateTaxDeduction = income * 0.051
        }
        else if (income > 58070.00 && income <= 7259.00) {
            StateTaxDeduction = income * 0.061
        }
        else if (income > 7259.00 && income <= 10889.00) {
            StateTaxDeduction = income * 0.071
        }
        else if (income > 10889.00) {
            StateTaxDeduction = income * 0.074
        }
    }
    
    
    func calcStateTaxDeductionTennessee() {
        StateTaxDeduction = income * 0.06
    }
    
    func calcStateTaxDeductionUtah() {
        StateTaxDeduction = income * 0.05
    }
    
    func calcStateTaxDeductionIndiana() {
        StateTaxDeduction = income * 0.033
    }
    
    func calcStateTaxDeductionMassachusetts() {
        StateTaxDeduction = income * 0.052
    }
    
    func calcStateTaxDeductionMichigan() {
        StateTaxDeduction = income * 0.0425
    }
    
    func calcStateTaxDeductionPennsylvania() {
        StateTaxDeduction = income * 0.0307
    }
    
    func calcStateTaxDeductionNorthCarolina() {
        StateTaxDeduction = income * 0.0575
    }
    
    func calcStateTaxDeductionIllinois() {
        StateTaxDeduction = income * 0.0375
    }
    
    func calcStateTaxDeductionIowa() {
        if (income <= 1539.00) {
            StateTaxDeduction = income * 0.0036
        }
        else if (income > 1539.00 && income <= 3078.00) {
            StateTaxDeduction = income * 0.0072
        }
        else if (income > 3078.00 && income <= 6156.00) {
            StateTaxDeduction = income * 0.0243
        }
        else if (income > 6156.00 && income <= 13851.00) {
            StateTaxDeduction = income * 0.0450
        }
        else if (income > 13851.00 && income <= 23085.00) {
            StateTaxDeduction = income * 0.0612
        }
        else if (income > 23085.00 && income <= 30780.00) {
            StateTaxDeduction = income * 0.0648
        }
        else if (income > 30780.00 && income <= 46170.00) {
            StateTaxDeduction = income * 0.0680
        }
        else if (income > 46170.00 && income <= 69255.00) {
            StateTaxDeduction = income * 0.00792
        }
        else if (income > 69255.00) {
            StateTaxDeduction = income * 0.0898
        }
    }
    
    func calcStateTaxDeductionKansas() {
        if (income <= 15000.00) {
            StateTaxDeduction = income * 0.027
        }
        else if (income > 15000.00) {
            StateTaxDeduction = income * 0.046
        }
    }
    
    func calcStateTaxDeductionWisconsin() {
        if (income <= 10910.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 10910.00 && income <= 21820.00) {
            StateTaxDeduction = income * 0.0584
        }
        else if (income > 21820.00 && income <= 240190.00) {
            StateTaxDeduction = income * 0.0627
        }
            
        else if (income > 240190.00) {
            StateTaxDeduction = income * 0.0765
        }
    }
    
    func calcStateTaxDeductionWestVirginia() {
        if (income <= 10000.00) {
            StateTaxDeduction = income * 0.03
        }
        else if (income > 10000.00 && income <= 25000.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 25000.00 && income <= 40000.00) {
            StateTaxDeduction = income * 0.045
        }
        else if (income > 40000.00 && income <= 60000.00) {
            StateTaxDeduction = income * 0.06
        }
        else if (income > 60000.00) {
            StateTaxDeduction = income * 0.065
        }
    }
    
    func calcStateTaxDeductionVirginia() {
        if (income <= 3000.00) {
            StateTaxDeduction = income * 0.02
        }
        else if (income > 3000.00 && income <= 5000.00) {
            StateTaxDeduction = income * 0.03
        }
        else if (income > 5000.00 && income <= 17000.00) {
            StateTaxDeduction = income * 0.05
        }
        else if (income > 17000.00) {
            StateTaxDeduction = income * 0.0575
        }
    }
    
    func calcStateTaxDeductionVermont() {
        if (income <= 36900.00) {
            StateTaxDeduction = income * 0.0355
        }
        else if (income > 36900.00 && income <= 89350.00) {
            StateTaxDeduction = income * 0.068
        }
        else if (income > 89350.00 && income <= 186350.00) {
            StateTaxDeduction = income * 0.078
        }
        else if (income > 186350.00 && income <= 405100.00) {
            StateTaxDeduction = income * 0.088
        }
        else if (income > 405100.00) {
            StateTaxDeduction = income * 0.0895
        }
    }
    
    func calcStateTaxDeductionSouthCarolina() {
        if (income <= 2880.00) {
            StateTaxDeduction = income * 0
        }
        else if (income > 2880.00 && income <= 5760.00) {
            StateTaxDeduction = income * 0.03
        }
        else if (income > 5760.00 && income <= 8640.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 8640.00 && income <= 11520.00) {
            StateTaxDeduction = income * 0.05
        }
        else if (income > 11520.00 && income <= 14400.00) {
            StateTaxDeduction = income * 0.06
        }
        else if (income > 14400.00) {
            StateTaxDeduction = income * 0.07
        }
    }
    
    func calcStateTaxDeductionRhodeIsland() {
        if (income <= 59600.00) {
            StateTaxDeduction = income * 0.0375
        }
        else if (income > 59600.00 && income <= 135500.00) {
            StateTaxDeduction = income * 0.0475
        }
        else if (income > 135500.00) {
            StateTaxDeduction = income * 0.05
        }
    }
    
    func calcStateTaxDeductionOregon() {
        if (income <= 3300.00) {
            StateTaxDeduction = income * 0.05
        }
        else if (income > 3300.00 && income <= 8250.00) {
            StateTaxDeduction = income * 0.07
        }
        else if (income > 8250.00 && income <= 125000.00) {
            StateTaxDeduction = income * 0.09
        }
            
        else if (income > 125000.00) {
            StateTaxDeduction = income * 0.099
        }
    }
    
    func calcStateTaxDeductionOklahoma() {
        if (income <= 1000.00) {
            StateTaxDeduction = income * 0.005
        }
        else if (income > 1000.00 && income <= 2500.00) {
            StateTaxDeduction = income * 0.01
        }
        else if (income > 2500.00 && income <= 3750.00) {
            StateTaxDeduction = income * 0.02
        }
        else if (income > 3750.00 && income <= 4900.00) {
            StateTaxDeduction = income * 0.03
        }
        else if (income > 4900.00 && income <= 7200.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 7200.00 && income <= 8700.00) {
            StateTaxDeduction = income * 0.05
        }
        else if (income > 8700.00) {
            StateTaxDeduction = income * 0.0525
        }
    }
    
    func calcStateTaxDeductionMaryland() {
        if (income <= 1000.00) {
            StateTaxDeduction = income * 0.02
        }
        else if (income > 1000.00 && income <= 2000.00) {
            StateTaxDeduction = income * 0.03
        }
        else if (income > 2000.00 && income <= 3000.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 3000.00 && income <= 100000.00) {
            StateTaxDeduction = income * 0.0475
        }
        else if (income > 100000.00 && income <= 125000.00) {
            StateTaxDeduction = income * 0.05
        }
        else if (income > 125000.00 && income <= 150000.00) {
            StateTaxDeduction = income * 0.0525
        }
        else if (income > 150000.00 && income <= 175000.00) {
            StateTaxDeduction = income * 0.0550
        }
        else if (income > 175000.00) {
            StateTaxDeduction = income * 0.0575
        }
    }
    
    func calcStateTaxDeductionNewYork() {
        if (income <= 8300.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 8300.00 && income <= 11450.00) {
            StateTaxDeduction = income * 0.045
        }
        else if (income > 11450.00 && income <= 13550.00) {
            StateTaxDeduction = income * 0.0525
        }
        else if (income > 13550.00 && income <= 20850.00) {
            StateTaxDeduction = income * 0.059
        }
        else if (income > 20850.00 && income <= 78400.00) {
            StateTaxDeduction = income * 0.0645
        }
        else if (income > 78400.00 && income <= 209250.00) {
            StateTaxDeduction = income * 0.0665
        }
        else if (income > 209250.00 && income <= 1046350.00) {
            StateTaxDeduction = income * 0.0685
        }
        else if (income > 1046350.00) {
            StateTaxDeduction = income * 0.882
        }
    }
    
    func calcStateTaxDeductionMaine() {
        if (income <= 5199.00) {
            StateTaxDeduction = income * 0
        }
        else if (income > 5199.00 && income <= 20899.00) {
            StateTaxDeduction = income * 0.065
        }
        else if (income > 20899.00) {
            StateTaxDeduction = income * 0.795
        }
    }
    
    func calcStateTaxDeductionLouisiana() {
        if (income <= 12500.00) {
            StateTaxDeduction = income * 0.02
        }
        else if (income > 12500.00 && income <= 50000.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 50000.00) {
            StateTaxDeduction = income * 0.06
        }
    }
    
    func calcStateTaxDeductionMississippi() {
        if (income <= 5000.00) {
            StateTaxDeduction = income * 0.03
        }
        else if (income > 5000.00 && income <= 10000.00) {
            StateTaxDeduction = income * 0.04
        }
            
        else if (income > 10000.00) {
            StateTaxDeduction = income * 0.05
        }
    }
    
    func calcStateTaxDeductionMinnesota() {
        if (income <= 25070.00) {
            StateTaxDeduction = income * 0.0535
        }
        else if (income > 25070.00 && income <= 82360.00) {
            StateTaxDeduction = income * 0.0705
        }
        else if (income > 82360.00 && income <= 154950.00) {
            StateTaxDeduction = income * 0.0705
        }
        else if (income > 154950.00) {
            StateTaxDeduction = income * 0.0985
        }
    }
    
    func calcStateTaxDeductionKentucky() {
        if (income <= 3000.00) {
            StateTaxDeduction = income * 0.02
        }
        else if (income > 3000.00 && income <= 4000.00) {
            StateTaxDeduction = income * 0.03
        }
        else if (income > 4000.00 && income <= 5000.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 5000.00 && income <= 8000.00) {
            StateTaxDeduction = income * 0.05
        }
        else if (income > 8000.00 && income <= 75000.00) {
            StateTaxDeduction = income * 0.058
        }
        else if (income > 75000.00) {
            StateTaxDeduction = income * 0.06
        }
    }
    
    func calcStateTaxDeductionMontana() {
        if (income <= 3000.00) {
            StateTaxDeduction = income * 0.02
        }
        else if (income > 3000.00 && income <= 4000.00) {
            StateTaxDeduction = income * 0.03
        }
        else if (income > 4000.00 && income <= 5000.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 5000.00 && income <= 8000.00) {
            StateTaxDeduction = income * 0.05
        }
        else if (income > 8000.00 && income <= 75000.00) {
            StateTaxDeduction = income * 0.058
        }
        else if (income > 75000.00) {
            StateTaxDeduction = income * 0.06
        }
    }
    
    func calcStateTaxDeductionNebraska() {
        if (income <= 3000.00) {
            StateTaxDeduction = income * 0.02
        }
        else if (income > 3000.00 && income <= 4000.00) {
            StateTaxDeduction = income * 0.03
        }
        else if (income > 4000.00 && income <= 5000.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 5000.00 && income <= 8000.00) {
            StateTaxDeduction = income * 0.05
        }
        else if (income > 8000.00 && income <= 75000.00) {
            StateTaxDeduction = income * 0.058
        }
        else if (income > 75000.00) {
            StateTaxDeduction = income * 0.06
        }
    }
    
    func calcStateTaxDeductionNewJersey() {
        if (income <= 3000.00) {
            StateTaxDeduction = income * 0.02
        }
        else if (income > 3000.00 && income <= 4000.00) {
            StateTaxDeduction = income * 0.03
        }
        else if (income > 4000.00 && income <= 5000.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 5000.00 && income <= 8000.00) {
            StateTaxDeduction = income * 0.05
        }
        else if (income > 8000.00 && income <= 75000.00) {
            StateTaxDeduction = income * 0.058
        }
        else if (income > 75000.00) {
            StateTaxDeduction = income * 0.06
        }
    }
    
    func calcStateTaxDeductionNewMexico() {
        if (income <= 3000.00) {
            StateTaxDeduction = income * 0.02
        }
        else if (income > 3000.00 && income <= 4000.00) {
            StateTaxDeduction = income * 0.03
        }
        else if (income > 4000.00 && income <= 5000.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 5000.00 && income <= 8000.00) {
            StateTaxDeduction = income * 0.05
        }
        else if (income > 8000.00 && income <= 75000.00) {
            StateTaxDeduction = income * 0.058
        }
        else if (income > 75000.00) {
            StateTaxDeduction = income * 0.06
        }
    }
    
    func calcStateTaxDeductionNorthDakota() {
        if (income <= 3000.00) {
            StateTaxDeduction = income * 0.02
        }
        else if (income > 3000.00 && income <= 4000.00) {
            StateTaxDeduction = income * 0.03
        }
        else if (income > 4000.00 && income <= 5000.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 5000.00 && income <= 8000.00) {
            StateTaxDeduction = income * 0.05
        }
        else if (income > 8000.00 && income <= 75000.00) {
            StateTaxDeduction = income * 0.058
        }
        else if (income > 75000.00) {
            StateTaxDeduction = income * 0.06
        }
    }
    
    func calcStateTaxDeductionOhio() {
        if (income <= 3000.00) {
            StateTaxDeduction = income * 0.02
        }
        else if (income > 3000.00 && income <= 4000.00) {
            StateTaxDeduction = income * 0.03
        }
        else if (income > 4000.00 && income <= 5000.00) {
            StateTaxDeduction = income * 0.04
        }
        else if (income > 5000.00 && income <= 8000.00) {
            StateTaxDeduction = income * 0.05
        }
        else if (income > 8000.00 && income <= 75000.00) {
            StateTaxDeduction = income * 0.058
        }
        else if (income > 75000.00) {
            StateTaxDeduction = income * 0.06
        }
    }
    
    func calcStateTaxDeductionMissouri() {
        if (income <= 99.99) {
            StateTaxDeduction = 0.00
        }
        if (income >= 100.00 && income <= 1000.00) {
            StateTaxDeduction = income * 0.015
        }
        if (income >= 1001.00 && income <= 2000.00) {
            StateTaxDeduction = income * 0.02
        }
        if (income >= 2001.00 && income <= 3000.00) {
            StateTaxDeduction = income * 0.025
        }
        if (income >= 3001.00 && income <= 4000.00) {
            StateTaxDeduction = income * 0.03
        }
        if (income >= 4001.00 && income <= 5000.00) {
            StateTaxDeduction = income * 0.035
        }
        if (income >= 5001.00 && income <= 6000.00) {
            StateTaxDeduction = income * 0.0
        }
        if (income >= 6001.00 && income <= 7000.00) {
            StateTaxDeduction = income * 0.045
        }
        if (income >= 7001.00 && income <= 8000.00) {
            StateTaxDeduction = income * 0.05
        }
        if (income >= 8001.00 && income <= 9000.00) {
            StateTaxDeduction = income * 0.055
        }
        if (income >= 9001.00) {
            StateTaxDeduction = income * 0.06
        }
    }
    
    func calcMyTotalDeduction()
    {
        
        let TotalDeduction = (SocialSecurityDeduction + MedicareDeduction + FederalTaxDeduction + StateTaxDeduction)
        totalD.text = String(TotalDeduction)
        
        let PostTaxEarnings = income - TotalDeduction
        postTaxEarnings.text = String(PostTaxEarnings)
        
        let grossText = currencyStringFromNumber(Double(grossEarnings.text!)!)
        grossEarnings.text = grossText
        
        medText = currencyStringFromNumber(Double(medicareD.text!)!)
        medicareD.text = medText
        
        socialText = currencyStringFromNumber(Double(socialSecurityD.text!)!)
        socialSecurityD.text = socialText
        
        fedText = currencyStringFromNumber(Double(federalTaxD.text!)!)
        federalTaxD.text = fedText
        
        totalText = currencyStringFromNumber(Double(totalD.text!)!)
        totalD.text = totalText
        
        postText = currencyStringFromNumber(Double(postTaxEarnings.text!)!)
        postTaxEarnings.text = postText
        
        stateTaxD.text = String(currencyStringFromNumber(StateTaxDeduction))
        
        stateText = currencyStringFromNumber(Double(stateTaxD.text!)!)
        stateTaxD.text = stateText
        
        
        
        
    }
    
    func calcMyTaxNow()
    {
        //        income = Double(currencyStringFromNumber(income))!
        //        MedicareDeduction = Double(currencyStringFromNumber(MedicareDeduction))!
        //        SocialSecurityDeduction = Double(currencyStringFromNumber(SocialSecurityDeduction))!
        //        FederalTaxDeduction = Double(currencyStringFromNumber(FederalTaxDeduction))!
        //
        //        var TotalDeduction = (SocialSecurityDeduction + MedicareDeduction + FederalTaxDeduction)
        //        TotalDeduction = Double(currencyStringFromNumber(TotalDeduction))!
        
        
        
        
        if (selectedState == "Alabama") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionAlabama()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Alaska") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionNone()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Arizona") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionArizona()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Arkansas") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionArkansas()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "California") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionCalifornia()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Colorado") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionColorado()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Connecticut") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionConnecticut()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Delaware") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionDelaware()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Florida") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionNone()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Georgia") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionGeorgia()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Hawaii") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionHawaii()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Idaho") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionHawaii()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Illinois") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionIllinois()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Indiana") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionIndiana()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Massachusetts") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionMassachusetts()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Michigan") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionMichigan()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Nevada") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionNone()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "New Hampshire") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionNone()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "South Dakota") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionNone()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Texas") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionNone()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Washington") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionNone()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Wyoming") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionNone()
            
            
            calcMyTotalDeduction()
        }
        if (selectedState == "Tennessee") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionTennessee()
            
            
            calcMyTotalDeduction()
        }
        if (selectedState == "North Carolina") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionNorthCarolina()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Michigan") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionMichigan()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Wyoming") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionUtah()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Pennsylvania") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionPennsylvania()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Iowa") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionIowa()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Kansas") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionKansas()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Kentucky") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionKentucky()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Louisiana") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionLouisiana()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Maine") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionMaine()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Maryland") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionMaryland()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Minnesota") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionMinnesota()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Missouri") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionMissouri()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Montana") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionMontana()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Nebraska") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionNebraska()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "New Jersey") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionNewJersey()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "New Mexico") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionNewMexico()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "New York") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionNewYork()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "North Dakota") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionNorthDakota()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Ohio") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionOhio()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Oklahoma") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionOklahoma()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Oregon") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionOregon()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Rhode Island") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionRhodeIsland()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "South Carolina") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionSouthCarolina()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Vermont") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionVermont()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Virginia") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionVirginia()
            
            
            calcMyTotalDeduction()
        }
        
        if (selectedState == "West Virginia") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionWestVirginia()
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Wisconsin") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionWisconsin()
            calcMyTotalDeduction()
        }
        
        if (selectedState == "Mississippi") {
            grossEarnings.text = String(income)
            medicareD.text = String(MedicareDeduction)
            socialSecurityD.text = String(SocialSecurityDeduction)
            federalTaxD.text = String(FederalTaxDeduction)
            calcStateTaxDeductionMississippi()
            calcMyTotalDeduction()
        }
        
        
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