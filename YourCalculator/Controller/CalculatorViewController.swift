//
//  CalculatorViewController.swift
//  YourCalculator
//
//  Created by MacOS on 31/01/2022.
//

import UIKit

class CalculatorViewController: UIViewController, SettingsDelegate {

    @IBOutlet var backgroundView: UIView!
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
    
    var savedBackgroundColor: String?
    var savedOperationColor: String?
    var savedNumberColor: String?
    
    var finishedTypingNumber: Bool = true
    var calculatorManager = CalculatorManager()
    let settingsController = SettingsViewController()
    
    //MANAGE USER DEFAULTS
    let userDefaults = UserDefaults()
    
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
        settingsController.delegate = self
        
        restoreUISettings()
        
        if savedBackgroundColor != nil, savedOperationColor != nil, savedNumberColor != nil{
            updateUI(backgroundColor: savedBackgroundColor!, operationColor: savedOperationColor!, numberColor: savedNumberColor!)
        }
        
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
    
    func updateUI(backgroundColor: String, operationColor: String, numberColor: String) {

        ACButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: operationColor)
        PlusMinusButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: operationColor)
        PercentageButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: operationColor)
        DevideButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: operationColor)
        MultiplyButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: operationColor)
        MinusButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: operationColor)
        PlusButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: operationColor)
        EqualsButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: operationColor)
        CommaButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: numberColor)
        OneButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: numberColor)
        TwoButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: numberColor)
        ThreeButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: numberColor)
        FourButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: numberColor)
        FiveButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: numberColor)
        SixButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: numberColor)
        SevenButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: numberColor)
        EightButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: numberColor)
        NineButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: numberColor)
        ZeroButton.backgroundColor = calculatorManager.hexStringToUIColor(hex: numberColor)
        displayLabel.textColor = calculatorManager.hexStringToUIColor(hex: operationColor)
        backgroundView.backgroundColor = calculatorManager.hexStringToUIColor(hex: backgroundColor)

    }
    
    func restoreUISettings(){
        
        if let pickedTheme = userDefaults.value(forKey: "theme") as? String{
            
            switch pickedTheme{
            case "Sea":
                savedBackgroundColor = K.seaBackgroundColor
                savedOperationColor = K.seaOperationColor
                savedNumberColor = K.seaNumberColor
            case "Earth":
                savedBackgroundColor = K.earthBackgroundColor
                savedOperationColor = K.earthOperationColor
                savedNumberColor = K.earthNumberColor
            case "Chilli":
                savedBackgroundColor = K.chilliBackgroundColor
                savedOperationColor = K.chilliOperationColor
                savedNumberColor = K.chilliNumberColor
            case "Sunset":
                savedBackgroundColor = K.sunsetBackgroundColor
                savedOperationColor = K.sunsetOperationColor
                savedNumberColor = K.sunsetNumberColor
            case "Space":
                savedBackgroundColor = K.spaceBackgroundColor
                savedOperationColor = K.spaceOperationColor
                savedNumberColor = K.spaceNumberColor
            case "Kiwi":
                savedBackgroundColor = K.kiwiBackgroundColor
                savedOperationColor = K.kiwiOperationColor
                savedNumberColor = K.kiwiNumberColor
            default:
                print("es")
            }
        }
    }
    
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
    
//MARK: - Delegate methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSettings"{
            let destinationVC = segue.destination as! SettingsViewController
            
            destinationVC.delegate = self
        }
    }
}
