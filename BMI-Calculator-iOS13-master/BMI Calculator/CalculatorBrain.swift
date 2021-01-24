//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Marki on 20.01.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        var color: UIColor
        var advice: String
        if (bmiValue < 18.5) {
            color = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            advice = "Eat more"
        } else if (bmiValue > 24.9) {
            color = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
            advice = "Eat less"
        } else {
            color = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            advice = "Good job"
        }
        bmi = BMI(value: bmiValue, advice: advice, color: color)
    }
    
    func getBMI() -> String {
        return String(format: "%0.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Good job"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .green
    }
}
