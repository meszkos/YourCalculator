//
//  CalculatorManager.swift
//  YourCalculator
//
//  Created by MacOS on 31/01/2022.
//

import Foundation
import UIKit

struct CalculatorManager{

    var number: Double?
    
    var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String)-> Double?{
        
        if let n = number{
            switch symbol{
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    func performTwoNumberCalculation(n2: Double)-> Double?{
        
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod{
            switch operation{
            case "+":
                return n1+n2
            case "-":
                return n1-n2
            case "x":
                return n1*n2
            case "÷":
                return n1/n2
            default:
                fatalError("Error during performTwoNumberCalculation func")
            }
        }
        return nil
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
