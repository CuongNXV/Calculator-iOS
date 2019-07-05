//
//  ViewController.swift
//  Calculator
//
//  Created by Nguyen Cuong on 7/3/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var buttonAC: UIButton!
    @IBOutlet weak var showCalculator: UILabel!
    var calculation:Bool = false
    var action:String = ""
    var numberOnScreen:Double?
    var temp_number:Double?
    var isCalculator:Bool = false

    @IBAction func number_0(_ sender: Any) {
        buttonAC.setTitle("C", for: .normal)
        buttonNumber(number: "0")
    }
    @IBAction func number_1(_ sender: Any) {
        buttonAC.setTitle("C", for: .normal)
        buttonNumber(number: "1")
    }
    @IBAction func number_2(_ sender: Any) {
        buttonAC.setTitle("C", for: .normal)
        buttonNumber(number: "2")
    }
    @IBAction func number_3(_ sender: Any) {
        buttonAC.setTitle("C", for: .normal)
        buttonNumber(number: "3")
    }
    @IBAction func number_4(_ sender: Any) {
        buttonAC.setTitle("C", for: .normal)
        buttonNumber(number: "4")
    }
    @IBAction func number_5(_ sender: Any) {
        buttonAC.setTitle("C", for: .normal)
        buttonNumber(number: "5")
    }
    @IBAction func number_6(_ sender: Any) {
        buttonAC.setTitle("C", for: .normal)
        buttonNumber(number: "6")
    }
    @IBAction func number_7(_ sender: Any) {
        buttonAC.setTitle("C", for: .normal)
        buttonNumber(number: "7")
    }
    @IBAction func number_8(_ sender: Any) {
        buttonAC.setTitle("C", for: .normal)
        buttonNumber(number: "8")
    }
    @IBAction func number_9(_ sender: Any) {
        buttonAC.setTitle("C", for: .normal)
        buttonNumber(number: "9")
    }
    
    //Calculation
    @IBAction func Addition(_ sender: Any) {
        action = "+"
        numberOnScreen = Double(showCalculator.text!)
        showCalculator.text = "0"
    }
    @IBAction func Subtraction(_ sender: Any) {
        action = "-"
        numberOnScreen = Double(showCalculator.text!)
        showCalculator.text = "0"
    }
    @IBAction func Multiplication(_ sender: Any) {
        action = "x"
        numberOnScreen = Double(showCalculator.text!)
        showCalculator.text = "0"
    }
    @IBAction func Division(_ sender: Any) {
        action = "/"
        numberOnScreen = Double(showCalculator.text!)
        showCalculator.text = "0"
    }
    
    //Clear result
    @IBAction func Delete(_ sender: Any) {
        showCalculator.text = "0"
        numberOnScreen = 0
        buttonAC.setTitle("AC", for: .normal)
        calculation = false
    }
    
    //"."
    @IBAction func dot(_ sender: Any) {
        buttonAC.setTitle("C", for: .normal)
        var temp: String;
        temp = String(showCalculator.text!)
        if (!temp.contains(".")){
            temp += "."
        }
        showCalculator.text = temp
    }
    
    //change negative and positive of number
    @IBAction func NegativeAndPositive(_ sender: Any) {
        var temp: String;
        temp = String(showCalculator.text!)
        if (!temp.contains("-")){
            temp = "-" + temp
            print(temp)
        }
        else {
            temp = temp.replacingOccurrences(of: "^-+", with: "", options: .regularExpression)
        }
        showCalculator.text = temp
    }
    
    //"%"
    @IBAction func Percentage(_ sender: Any) {
        var temp = Double(showCalculator.text!)
        temp = temp!/100;
        showCalculator.text = String(format: "%g", temp!)
    }
    
    //Show result
    @IBAction func result(_ sender: Any) {
        let screenDefaul = Double(showCalculator.text!)
        let temp = Double(showCalculator.text!)
        var result: Double?
        if  isCalculator {
            switch action {
            case "+":
                result = temp_number! + temp!
                print("+")
            case "-":
                result = temp_number! - temp!
                print("-")
            case "x":
                result = temp_number! * temp!
                print("x")
            case "/":
                result = temp_number! / temp!
                print("/")
            default:
                print("=")
                result = screenDefaul
            }
        } else {
            switch action {
            case "+":
                result = numberOnScreen! + temp!
                print("+")
            case "-":
                result = numberOnScreen! - temp!
                print("-")
            case "x":
                result = numberOnScreen! * temp!
                print("x")
            case "/":
                result = numberOnScreen! / temp!
                print("/")
            default:
                print("=")
                result = screenDefaul
            }
        }
        calculation = true
        isCalculator = true
        showCalculator.text = String(format: "%g", result!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showCalculator.adjustsFontSizeToFitWidth = true
        boderButton()
       
    }
    //get value of button Number
    func buttonNumber(number: String){
        var temp: String;
        if calculation{
            showCalculator.text = "0"
        }
        temp = String(showCalculator.text!)
        temp += number
        let temp2 = temp.replacingOccurrences(of: "^0+", with: "", options: .regularExpression)
        showCalculator.text = temp2
        temp_number = Double(showCalculator.text!)
    }
    //Custom button
    func boderButton(){
        for button in buttons {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        }
    }
}


