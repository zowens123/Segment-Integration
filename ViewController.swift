//
//  ViewController.swift
//  Segment Integration Demo
//
//  Created by Zach Owens on 6/6/19.
//  Copyright © 2019 Zach Owens. All rights reserved.
//

import UIKit
import LeanplumSegment

class ViewController: UIViewController {

    @IBOutlet weak var colorLabel: UILabel!
    
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    
    let textColor = UIColor.white
    
    var test = LPVar.define("test")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        SEGAnalytics.shared()!.screen("ButtonS", properties: nil, options: ["integrations": ["Leanplum": true]])
        
        redButton.backgroundColor = UIColor.red
        blueButton.backgroundColor = UIColor.blue
        orangeButton.backgroundColor = UIColor.orange
        greenButton.backgroundColor = UIColor.green
        
        redButton.setTitleColor(textColor, for: .normal)
        blueButton.setTitleColor(textColor, for: .normal)
        orangeButton.setTitleColor(textColor, for: .normal)
        greenButton.setTitleColor(textColor, for: .normal)
        
        redButton.setTitle("Red Button", for: .normal)
        blueButton.setTitle("Blue Button", for: .normal)
        orangeButton.setTitle("Orange Button", for: .normal)
        greenButton.setTitle("Green Button", for: .normal)
    }

    @IBAction func sendColorBtn(_ sender: UIButton) {
        
        let labelColor = sender.backgroundColor
        let labelText = sender.currentTitle
        let labelTextColor = sender.currentTitleColor
        
        colorLabel.text = labelText
        colorLabel.textColor = labelTextColor
        colorLabel.backgroundColor = labelColor
        
        SEGAnalytics.shared()!.track("buttonColorClick", properties: ["color":colorLabel.text!], options: ["integrations": ["Leanplum": true]])
        //Leanplum.track("buttonColorClick", withParameters: ["color":colorLabel.text!])
        
    }
    
}

