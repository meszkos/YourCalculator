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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.backgroundColor = calculatorManager.hexStringToUIColor(hex: "E5E5E5")
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        
        if pickedBackgroundColor != nil, pickedOperationColor != nil, pickedNumberColor != nil{
            delegate?.updateUI(backgroundColor: pickedBackgroundColor!, operationColor: pickedOperationColor!, numberColor: pickedNumberColor!)
        }
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pickThemeButtonPressed(_ sender: UIButton) {
        
        //Make it save thame after terminating app
        
        if let pickedTheme = sender.restorationIdentifier{
            switch pickedTheme{
            case "Sea":
                pickedBackgroundColor = K.seaBackgroundColor
                pickedOperationColor = K.seaOperationColor
                pickedNumberColor = K.seaNumberColor
            case "Earth":
                pickedBackgroundColor = K.earthBackgroundColor
                pickedOperationColor = K.earthOperationColor
                pickedNumberColor = K.earthNumberColor
            case "Chilli":
                pickedBackgroundColor = K.chilliBackgroundColor
                pickedOperationColor = K.chilliOperationColor
                pickedNumberColor = K.chilliNumberColor
            case "Sunset":
                pickedBackgroundColor = K.sunsetBackgroundColor
                pickedOperationColor = K.sunsetOperationColor
                pickedNumberColor = K.sunsetNumberColor
            case "Space":
                pickedBackgroundColor = K.spaceBackgroundColor
                pickedOperationColor = K.spaceOperationColor
                pickedNumberColor = K.spaceNumberColor
            case "Kiwi":
                pickedBackgroundColor = K.kiwiBackgroundColor
                pickedOperationColor = K.kiwiOperationColor
                pickedNumberColor = K.kiwiNumberColor
            default:
                print("es")
            }
            
        }
    }
}
