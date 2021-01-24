//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var currentHeight: UILabel!
    @IBOutlet weak var currentWeight: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentHeight.text = "\(heightSlider.value)m"
        currentWeight.text = "\(weightSlider.value)Kg"
    }


    @IBAction func heightSliderChanged(_ sender: UISlider) {
        currentHeight.text = "\(String(format: "%.2f", heightSlider.value))m"
    }
    
    @IBAction func weigthSliderChanged(_ sender: UISlider) {
        currentWeight.text = "\(Int(weightSlider.value))Kg"
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        calculatorBrain.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.getBMI()
            destinationVC.adviceValue = calculatorBrain.getAdvice()
            destinationVC.colorValue = calculatorBrain.getColor()
        }
    }
}

