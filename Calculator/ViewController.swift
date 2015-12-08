//
//  ViewController.swift
//  Calculator
//
//  Created by Joanwe on 15/12/7.
//  Copyright © 2015年 joanwe.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var clear = true
    var sum = 0
    var key = 0 //1加2减3乘4除

    @IBAction func Number(sender: UIButton) {
        sender.showsTouchWhenHighlighted = true
        if clear {
            Display.text = sender.currentTitle
            clear = false
        }else{
            Display.text = Display.text! + sender.currentTitle!
            if Display.text == "00" {
                Display.text = "0"
                clear = true
            }
            
        }
        
           }
    
    @IBAction func Equal() {
        Method()
        key = 0
    }
  
    @IBOutlet weak var Display: UILabel!
    @IBOutlet weak var Reset: UIButton!
    
    @IBOutlet weak var Acc: UIButton!
    @IBAction func Judge(sender: UIButton) {
        sender.showsTouchWhenHighlighted = true
        switch sender.currentTitle {
        case "﹢"? : Method() ; key = 1
        case "﹣"? : Method() ; key = 2
        case "×"? : Method() ; key = 3
        case "÷"? : Method() ; key = 4
        default : break
        }
        if Display.text != "0"{
            Reset.setTitle("C", forState: .Normal)
        }else {
            Reset.setTitle("AC", forState: .Normal)
        }
    }
    
    //判断button为那个运算符
    
    func  Method(){if clear {

    }else{
        switch key {
        case 0 :
            sum = Int(Display.text!)!
            clear = true
        case 1 :
            sum = sum + Int(Display.text!)!
            Display.text = "\(sum)"
            clear = true
        case 2 :
            sum = sum - Int(Display.text!)!
            Display.text = "\(sum)"
            clear = true
        case 3 :
            sum = sum * Int(Display.text!)!
            Display.text = "\(sum)"
            clear = true
        case 4 :
            sum = sum / Int(Display.text!)!
            Display.text = "\(sum)"
            clear = true
        default : break
        }
        }
        
    }
    //获得前一个运算符的运算结果
    
    @IBAction func Reroll() {
        sum = 0
        Display.text = "0"
        key = 0
        Reset.setTitle("AC", forState: .Normal)
    }
}