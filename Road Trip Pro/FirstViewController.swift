//
//  FirstViewController.swift
//  Road Trip Pro
//
//  Created by Ian on 2/12/17.
//  Copyright © 2017 IanAnnase. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var milesField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var mpgField: UITextField!
    @IBOutlet weak var tripSwitch: UISwitch!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func Calculate(_ sender: Any) {
        
        if milesField.text == "" || priceField.text == "" || mpgField.text == ""
        {
            priceLabel.text = "?"
            return
        }
        
        var miles = Double(milesField.text!)!
        let price = Double(priceField.text!)!
        let mpg = Double(mpgField.text!)!
        let roundTrip = tripSwitch.isOn
        var total = 0.0
        
        if roundTrip {
            miles *= 2
        }
        total = miles / mpg * price
        
        priceLabel.text =  String(format: "$%.2f", total)
        
        dismissKeyboard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        milesField.delegate = self
        priceField.delegate = self
        mpgField.delegate = self
        
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, 100, 0.0);
        scrollView.contentInset = contentInsets;
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func dismissKeyboard() {
        milesField.resignFirstResponder()
        priceField.resignFirstResponder()
        mpgField.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

