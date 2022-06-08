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
    case power
    case sqrt
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
    @IBAction func press4number(_ sender: UIButton) {
        temporalyNumberBox = "4"
        actionsAfterNumberPressing()
    }
    @IBAction func press5number(_ sender: UIButton) {
        temporalyNumberBox = "5"
        actionsAfterNumberPressing()
    }
    @IBAction func press6number(_ sender: UIButton) {
        temporalyNumberBox = "6"
        actionsAfterNumberPressing()
    }
    @IBAction func press7number(_ sender: UIButton) {
        temporalyNumberBox = "7"
        actionsAfterNumberPressing()
    }
    @IBAction func press8number(_ sender: UIButton) {
        temporalyNumberBox = "8"
        actionsAfterNumberPressing()
    }
    @IBAction func press9number(_ sender: UIButton) {
        temporalyNumberBox = "9"
        actionsAfterNumberPressing()
    }
    @IBAction func press0number(_ sender: UIButton) {
        temporalyNumberBox = "0"
        actionsAfterNumberPressing()
    }
    
    
    @IBAction func sqrtAction(_ sender: UIButton) {
        if firstNumber != "" {
            isThisFirstNumber = false
            
           actionType = MathAction.sqrt
            decide(mathAction: MathAction.sqrt)
            FinishLabel.text = "\(finishNumber)"
            secondNumber = ""
            firstNumber = String(finishNumber)
        }
    }
    
    
    @IBAction func Percent(_ sender: UIButton) {
        if isThisFirstNumber{
            
        } else {
            firstNumberFloat = Float(firstNumber) ?? 0.0
            secondNumberFloat = Float (secondNumber) ?? 0.0
            secondNumberFloat = firstNumberFloat * secondNumberFloat / 100
            secondNumber = String(secondNumberFloat)
            FinishLabel.text = secondNumber
        }
    }
    
    @IBAction func AdditionAction(_ sender: UIButton) {
        if firstNumber == "-" {
            FinishLabel.text = ""
            firstNumber = ""
        } else {
            isThisFirstNumber = false
            actionType = MathAction.additionAction
        }
    }
    
    @IBAction func NegativeAdditionAction(_ sender: UIButton) {
        if firstNumber == "" {
            temporalyNumberBox = "-"
            actionsAfterNumberPressing()
        } else {
            isThisFirstNumber = false
            actionType = MathAction.negativeAdditionAction
        }
    }
    
    
    @IBAction func PowerAction(_ sender: UIButton) {
        if firstNumber != "" {
            isThisFirstNumber = false
            actionType = MathAction.power
        }
    }
    
    @IBAction func multiplyAction(_ sender: UIButton) {
        if firstNumber != "" {
            isThisFirstNumber = false
            actionType = MathAction.multiplication
        }
    }
    
    @IBAction func divideAction(_ sender: UIButton) {
        if firstNumber != "" {
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
        case MathAction.power:
            finishNumber = Float(pow(firstNumberFloat, secondNumberFloat))
        case MathAction.sqrt:
            finishNumber = sqrt(firstNumberFloat)
        }
    }
    
    @IBAction func Сancel(_ sender: UIButton) {
        FinishLabel.text = "Press Any Key"
        temporalyNumberBox = ""
            firstNumber = ""
            secondNumber = ""
        isThisFirstNumber = true
    }
    
    @IBAction func FinishButton(_ sender: UIButton) {
        decide(mathAction: actionType)
        FinishLabel.text = "\(finishNumber)"
        secondNumber = ""
        firstNumber = String(finishNumber)
    }
}



