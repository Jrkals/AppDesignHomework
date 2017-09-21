//
//  ViewController.swift
//  HomeWork1
//
//  Created by Justin on 9/15/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet var backgroundLink: UIView!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    var valueOfButton: Int =  50 // button showing value, starting at 50
    let buttonIncrement: Int = 10 // amount to change valueOfButton by each time
    let lowerThreshold: Int = 20 // if valueOfButton is < this, change color
    let upperThreshold: Int = 80 // if valueOfButton is > this, change color
    
    // Increment Value label and check for color change
    @IBAction func increaseAction(_ sender: Any) {
        valueOfButton += buttonIncrement
        changeBackgroundColor()
        valueLabel.text = "\(valueOfButton)"
    }
    
    // Decrease Value label and check for color change
    @IBAction func decreaseAction(_ sender: Any) {
        valueOfButton -= buttonIncrement
        changeBackgroundColor()
        valueLabel.text = "\(valueOfButton)"
    }
    
    // change the background color depending on the button value
    func changeBackgroundColor() {
        if (valueOfButton < lowerThreshold){
            backgroundLink.backgroundColor = UIColor.blue
        }
        else if (valueOfButton > upperThreshold){
           backgroundLink.backgroundColor = UIColor.green
            
        }
        // default color
        else{
            backgroundLink.backgroundColor = UIColor.white
        }
    }

}

