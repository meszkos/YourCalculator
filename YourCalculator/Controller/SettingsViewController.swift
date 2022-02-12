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
    
    var pickedBackgroundColor: String?
    var pickedOperationColor: String?
    var pickedNumberColor: String?
    
    let userDefaults = UserDefaults()
    var savedBackgroundColor: String?
    
    var pickedTheme = "Sea"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        restoreBackgroundColor()
        if savedBackgroundColor != nil{
            backgroundView.backgroundColor = calculatorManager.hexStringToUIColor(hex: savedBackgroundColor!)
        }
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        
        if pickedBackgroundColor != nil, pickedOperationColor != nil, pickedNumberColor != nil{
            delegate?.updateUI(backgroundColor: pickedBackgroundColor!,
                               operationColor: pickedOperationColor!,
                               numberColor: pickedNumberColor!)
        }
        userDefaults.setValue(pickedTheme, forKey: "theme")
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pickThemeButtonPressed(_ sender: UIButton) {
        sender.isSelected = true
        pickedTheme = sender.restorationIdentifier!
            switch pickedTheme{
            case "Sea":
                pickedBackgroundColor = K.seaBackgroundColor
                pickedOperationColor = K.seaOperationColor
                pickedNumberColor = K.seaNumberColor
                backgroundView.backgroundColor = calculatorManager.hexStringToUIColor(hex: K.seaBackgroundColor)
            case "Earth":
                pickedBackgroundColor = K.earthBackgroundColor
                pickedOperationColor = K.earthOperationColor
                pickedNumberColor = K.earthNumberColor
                backgroundView.backgroundColor = calculatorManager.hexStringToUIColor(hex: K.earthBackgroundColor)
            case "Chilli":
                pickedBackgroundColor = K.chilliBackgroundColor
                pickedOperationColor = K.chilliOperationColor
                pickedNumberColor = K.chilliNumberColor
                backgroundView.backgroundColor = calculatorManager.hexStringToUIColor(hex: K.chilliBackgroundColor)
            case "Sunset":
                pickedBackgroundColor = K.sunsetBackgroundColor
                pickedOperationColor = K.sunsetOperationColor
                pickedNumberColor = K.sunsetNumberColor
                backgroundView.backgroundColor = calculatorManager.hexStringToUIColor(hex: K.sunsetBackgroundColor)
            case "Space":
                pickedBackgroundColor = K.spaceBackgroundColor
                pickedOperationColor = K.spaceOperationColor
                pickedNumberColor = K.spaceNumberColor
                backgroundView.backgroundColor = calculatorManager.hexStringToUIColor(hex: K.spaceBackgroundColor)
            case "Kiwi":
                pickedBackgroundColor = K.kiwiBackgroundColor
                pickedOperationColor = K.kiwiOperationColor
                pickedNumberColor = K.kiwiNumberColor
                backgroundView.backgroundColor = calculatorManager.hexStringToUIColor(hex: K.kiwiBackgroundColor)
            default:
                print("es")
            }
    }
    func restoreBackgroundColor(){
        
        if let pickedTheme = userDefaults.value(forKey: "theme") as? String{
            
            switch pickedTheme{
            case "Sea":
                savedBackgroundColor = K.seaBackgroundColor
            case "Earth":
                savedBackgroundColor = K.earthBackgroundColor
            case "Chilli":
                savedBackgroundColor = K.chilliBackgroundColor
            case "Sunset":
                savedBackgroundColor = K.sunsetBackgroundColor
            case "Space":
                savedBackgroundColor = K.spaceBackgroundColor
            case "Kiwi":
                savedBackgroundColor = K.kiwiBackgroundColor
            default:
                print("es")
            }
        }
    }
}
