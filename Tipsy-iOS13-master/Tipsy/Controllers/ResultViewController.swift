//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Marki on 20.01.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalValue: String?
    var totalSplit: String?
    var totalPercent: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalValue
        settingsLabel.text = "Split between \(totalSplit ?? "2") people, with \(totalPercent ?? "0")% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
