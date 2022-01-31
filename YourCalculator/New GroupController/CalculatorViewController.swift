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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        changeButtonCornerRadius()
                
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
}
