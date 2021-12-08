//
//  ViewController.swift
//  MyCalcApp
//
//  Created by leejungchul on 2021/12/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .Unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapNumberBtn(_ sender: UIButton) {
        guard let numVal = sender.title(for: .normal) else {return}
        if self.displayNumber.count < 9{
            self.displayNumber += numVal
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapDotBtn(_ sender: UIButton) {
        if self.displayNumber.count < 8 , !self.displayNumber.contains("."){
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapDivideBtn(_ sender: UIButton) {
        self.operation(operation: .Divide)
    }
    
    @IBAction func tapMultipleBtn(_ sender: UIButton) {
        self.operation(operation: .Multiple)
    }
    
    @IBAction func tapSubtractBtn(_ sender: UIButton) {
        self.operation(operation: .Subtract)
    }
    @IBAction func tapPlusBtn(_ sender: UIButton) {
        self.operation(operation: .Add)
    }
    @IBAction func tapEqualBtn(_ sender: UIButton) {
        self.operation(operation: self.currentOperation)
    }
    
    @IBAction func clearBtn(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .Unknown
        self.numberOutputLabel.text = "0"
        
    }
    
    func operation(operation: Operation) {
        if self.currentOperation != .Unknown {
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand = Double(self.secondOperand) else { return }
                
                switch self.currentOperation {
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                case .Multiple:
                    self.result = "\(firstOperand * secondOperand)"
                case .Subtract:
                    self.result = "\(firstOperand - secondOperand)"
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                default:
                    break
                }
                
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            self.currentOperation = operation
        } else {
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
}


enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiple
    case Unknown
}
