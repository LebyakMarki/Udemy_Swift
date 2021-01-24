//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var currentPercent: Double = 0.0
    var currentSplit: Double = 2.0
    var currentTotal: String = "0.0"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        zeroPctButton.isSelected = true
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }

    @IBAction func zeroPctPressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        currentPercent = 0.0
        zeroPctButton.isSelected = true
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    @IBAction func tenPctPressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        currentPercent = 0.1
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = true
        twentyPctButton.isSelected = false
    }
    
    @IBAction func twentyPctPressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        currentPercent = 0.2
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = true
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = Int(sender.value).description
        currentSplit = Double(sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        if let convertedTotal = Double(billTextField.text ?? "0.0") {
            let splittedValue = (convertedTotal + convertedTotal * currentPercent) / currentSplit
            currentTotal = String(format: "%0.2f", splittedValue)
            self.performSegue(withIdentifier: "goToResults", sender: self)
        } else {
            print("Pizdec")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalValue = currentTotal
            destinationVC.totalSplit = String(Int(currentSplit))
            destinationVC.totalPercent = String(Int(currentPercent * 100))
        }
    }
}

