//
//  CalculatorViewController.swift
//  YourCalculator
//
//  Created by MacOS on 31/01/2022.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var ACButton: UIButton!
    @IBOutlet weak var PlusMinusButton: UIButton!
    @IBOutlet weak var PercentageButton: UIButton!
    @IBOutlet weak var DevideButton: UIButton!
    @IBOutlet weak var MultiplyButton: UIButton!
    @IBOutlet weak var MinusButton: UIButton!
    @IBOutlet weak var PlusButton: UIButton!
    @IBOutlet weak var EqualsButton: UIButton!
    @IBOutlet weak var ZeroButton: UIButton!
    @IBOutlet weak var CommaButton: UIButton!
    @IBOutlet weak var OneButton: UIButton!
    @IBOutlet weak var TwoButton: UIButton!
    @IBOutlet weak var ThreeButton: UIButton!
    @IBOutlet weak var FourButton: UIButton!
    @IBOutlet weak var FiveButton: UIButton!
    @IBOutlet weak var SixButton: UIButton!
    @IBOutlet weak var SevenButton: UIButton!
    @IBOutlet weak var EightButton: UIButton!
    @IBOutlet weak var NineButton: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    
    
    var finishedTypingNumber: Bool = true
    var calculatorManager = CalculatorManager()
    
    var displayValue: Double{
        get{
            guard let number = Double(displayLabel.text!) else{
                fatalError("Can't convert displayLabel text to a Double")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        changeButtonCornerRadius()
                
    }

    //MARK: - Performing calculations
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        finishedTypingNumber = true
        
        calculatorManager.setNumber(displayValue)
        
        if let calcMethod = sender.titleLabel?.text{
            if let result = calculatorManager.calculate(symbol: calcMethod){
                displayValue = result
            }
        }
        
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {

        if let numberValue = sender.titleLabel?.text{
            
            if finishedTypingNumber{
                displayLabel.text = numberValue
                finishedTypingNumber = false
            }else{
                if numberValue == ","{
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt{
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numberValue
            }
        }
        
    }
    
    
  //MARK: - UI Modification
    func changeButtonCornerRadius(){
        ACButton.layer.cornerRadius = 15
        PlusMinusButton.layer.cornerRadius = 15
        PercentageButton.layer.cornerRadius = 15
        DevideButton.layer.cornerRadius = 15
        MultiplyButton.layer.cornerRadius = 15
        MinusButton.layer.cornerRadius = 15
        PlusButton.layer.cornerRadius = 15
        EqualsButton.layer.cornerRadius = 15
        CommaButton.layer.cornerRadius = 15
        ZeroButton.layer.cornerRadius = 15
        OneButton.layer.cornerRadius = 15
        TwoButton.layer.cornerRadius = 15
        ThreeButton.layer.cornerRadius = 15
        FourButton.layer.cornerRadius = 15
        FiveButton.layer.cornerRadius = 15
        SixButton.layer.cornerRadius = 15
        SevenButton.layer.cornerRadius = 15
        EightButton.layer.cornerRadius = 15
        NineButton.layer.cornerRadius = 15
    }
}
