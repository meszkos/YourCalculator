//
//  SettingsViewController.swift
//  YourCalculator
//
//  Created by MacOS on 01/02/2022.
//

import UIKit

protocol SettingsDelegate{
    func updateUI(backgroundColor: String, operationColor: String, numberColor: String)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    
    var calculatorManager = CalculatorManager()
    var delegate: SettingsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.backgroundColor = calculatorManager.hexStringToUIColor(hex: "E5E5E5")
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        
        delegate?.updateUI(backgroundColor: K.kiwiBackgroundColor, operationColor: K.kiwiOperationColor, numberColor: K.kiwiNumberColor)
        
        
        self.navigationController?.popViewController(animated: true)
    }
}
