//
//  CalculatorManager.swift
//  YourCalculator
//
//  Created by MacOS on 31/01/2022.
//

import Foundation

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
            case "X":
                return n1*n2
            case "÷":
                return n1/n2
            default:
                fatalError("Error during performTwoNumberCalculation func")
            }
        }
        return nil
    }
}
