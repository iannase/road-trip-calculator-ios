//
//  SecondViewController.swift
//  Road Trip Pro
//
//  Created by Ian on 2/12/17.
//  Copyright © 2017 IanAnnase. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var milesFIeld: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var mpgField: UITextField!
    @IBOutlet weak var capacityField: UITextField!
    @IBOutlet weak var tankLevelField: UITextField!
    @IBOutlet weak var tripSwitch: UISwitch!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var numberOfFillsLabel: UILabel!
    @IBOutlet weak var costPerTankLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func calculate(_ sender: Any) {
        
        if milesFIeld.text == "" || priceField.text == "" || mpgField.text == "" || capacityField.text == "" || tankLevelField.text == ""
        {
            numberOfFillsLabel.text = "?"
            costPerTankLabel.text = "?"
            totalCostLabel.text = "?"
            return
        }
        
        let miles = Double(milesFIeld.text!)!
        let price = Double(priceField.text!)!
        let mpg = Double(mpgField.text!)!
        let capacity = Double(capacityField.text!)!
        let tankLevel = Double(tankLevelField.text!)!
        let roundTrip = tripSwitch.isOn
        var milesFixed = 0.0
        var tankMiles = 0.0
        var fillUps = 0
        var finalTank = 0.0
        var costPerTank = 0.0
        var total = 0.0
        var fillUps2 = 0.0
        var costPerTankString = ""
        
        tankMiles = mpg * capacity * tankLevel
        milesFixed = miles - tankMiles
        
        if roundTrip {
            milesFixed += miles
        }
        
        total = (milesFixed / mpg * price)
        fillUps = Int(milesFixed / mpg / capacity)
        fillUps2 = Double(fillUps)
        costPerTank = capacity * price
        finalTank = total - costPerTank * fillUps2
        costPerTankString = String(format: "%.2f", costPerTank)
        
        numberOfFillsLabel.text = "\(fillUps) tanks for $\(costPerTankString)"
        costPerTankLabel.text = String(format: "Final tank for $%.2f", finalTank)
        totalCostLabel.text = String(format: "$%.2f", total)
        
        dismissKeyboard() 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        milesFIeld.delegate = self
        priceField.delegate = self
        mpgField.delegate = self
        capacityField.delegate = self
        tankLevelField.delegate = self
        
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, 100, 0.0);
        scrollView.contentInset = contentInsets;
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func dismissKeyboard() {
        milesFIeld.resignFirstResponder()
        priceField.resignFirstResponder()
        mpgField.resignFirstResponder()
        capacityField.resignFirstResponder()
        tankLevelField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

