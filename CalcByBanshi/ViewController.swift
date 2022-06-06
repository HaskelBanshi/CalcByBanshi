//
//  ViewController.swift
//  CalcByBanshi
//
//  Created by a2 on 05.06.2022.
//

import UIKit

class ViewController: UIViewController {

    
    

    @IBOutlet weak var Сancel: UIButton!
    @IBOutlet weak var FinishLabel: UILabel!
    @IBOutlet weak var FinishButton: UIButton!
    
    
   
    var firstNumber = ""
    var secondNumber = ""
    var firstNumberFloat : Float = 0.0
    var secondNumberFloat : Float = 0.0
    var temporalyNumberBox = ""
    var finishNumber : Float = 0.0
    var isThisFirstNumber = true
    var actionType = MathAction.additionAction
    
    enum MathAction {
    case additionAction
    case negativeAdditionAction
    case multiplication
    case division
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func actionsAfterNumberPressing(){
        if isThisFirstNumber {
            firstNumber = firstNumber + temporalyNumberBox
            FinishLabel.text = firstNumber
        } else {
           secondNumber = secondNumber + temporalyNumberBox
            FinishLabel.text = secondNumber
        }
    }

    @IBAction func press1number(_ sender: UIButton){
        temporalyNumberBox = "1"
        actionsAfterNumberPressing()
    }
    
    @IBAction func press2number(_ sender: UIButton) {
        temporalyNumberBox = "2"
        actionsAfterNumberPressing()
    }
    @IBAction func press3number(_ sender: UIButton) {
        temporalyNumberBox = "3"
        actionsAfterNumberPressing()
    }
    
    
    @IBAction func AdditionAction(_ sender: UIButton) {
        if firstNumber == "" {
            
        } else {
            isThisFirstNumber = false
            actionType = MathAction.additionAction
        }
    }
    
    @IBAction func NegativeAdditionAction(_ sender: UIButton) {
        if firstNumber == "" {
            
        } else {
            isThisFirstNumber = false
            actionType = MathAction.negativeAdditionAction
        }
    }
    
    
    @IBAction func multiplyAction(_ sender: UIButton) {
        if firstNumber == "" {
            
        } else {
            isThisFirstNumber = false
            actionType = MathAction.multiplication
        }
    }
    
    @IBAction func divideAction(_ sender: UIButton) {
        if firstNumber == "" {
            
        } else {
            isThisFirstNumber = false
            actionType = MathAction.division
        }
    }
    
    @IBAction func COMA(_ sender: UIButton) {
        temporalyNumberBox = "."
        actionsAfterNumberPressing()
    }
    
    func decide (mathAction: MathAction){
        firstNumberFloat = Float(firstNumber) ?? 0.0
        secondNumberFloat = Float (secondNumber) ?? 0.0
        
        switch mathAction {
    case MathAction.additionAction:
        finishNumber = firstNumberFloat + secondNumberFloat
    case MathAction.negativeAdditionAction:
        finishNumber = firstNumberFloat - secondNumberFloat
    case MathAction.multiplication:
        finishNumber = firstNumberFloat * secondNumberFloat
    case MathAction.division:
        finishNumber = firstNumberFloat / secondNumberFloat
    }
    }
    
    @IBAction func Сancel(_ sender: UIButton) {
        FinishLabel.text = ""
        temporalyNumberBox = ""
            firstNumber = ""
            isThisFirstNumber = true
            secondNumber = ""
    }
    
    @IBAction func FinishButton(_ sender: UIButton) {
        decide(mathAction: actionType)
        FinishLabel.text = "\(finishNumber)"
    }
}



