//
//  ViewController.swift
//  colorGuesingGame
//
//  Created by Mr Wonderful on 7/30/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redOutlet: UIButton!
    @IBOutlet weak var blueOutlet: UIButton!
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var greenOutlet: UIButton!
    @IBOutlet weak var highScore: UILabel!
    @IBOutlet weak var newGame: UIButton!
    
    @IBOutlet weak var gameOver: UILabel!
    @IBOutlet weak var currentScore: UILabel!
    var emojiStruct = Emojis()
    var colorGenerated = RGBValue()
    var increment = incrementer()
    @IBOutlet weak var RGBColorView: UIView!
    
    func isDisabled(){
        redOutlet.isEnabled = false
        blueOutlet.isEnabled = false
        greenOutlet.isEnabled = false
        
        redOutlet.alpha = 0.5
        blueOutlet.alpha = 0.5
        greenOutlet.alpha = 0.5
        
        gameOver.alpha = 1.0
        newGame.alpha = 1.0
        
        redOutlet.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
        blueOutlet.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
        greenOutlet.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
    }
    
    func isEnabled(){
        redOutlet.isEnabled = true
        blueOutlet.isEnabled = true
        greenOutlet.isEnabled = true
        
        redOutlet.alpha = 1
        blueOutlet.alpha = 1
        greenOutlet.alpha = 1
        
        gameOver.alpha = 0
        newGame.alpha = 0
        redOutlet.setTitleColor(UIColor.red, for: UIControl.State.normal)
        blueOutlet.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        greenOutlet.setTitleColor(UIColor.green, for: UIControl.State.normal)
    }
    
    func colorGenerator(){
        colorGenerated = RGBValue()
        RGBColorView.backgroundColor = colorGenerated.creatRGBColor()
    }
    
    func ifCaseIsTrue(){
        increment.incrementScore()
        increment.incrementHighScore()
        
        currentScore.text = "Curent Score: \(increment.score)"
        highScore.text = "High Score: \(increment.highestScore)"
        colorGenerator()
        emojiLabel.alpha = 1
        emojiStruct = Emojis()
        emojiLabel.text = emojiStruct.happy()
    }
    
    func ifCaseIsFalse(){
        increment.score = 0
        currentScore.text = "Curent Score: \(increment.score)"
        emojiStruct = Emojis()
        emojiLabel.text = emojiStruct.sad()
    }
    
    @IBAction func red(_ sender: UIButton) {
        switch colorGenerated.highestRGBvalue() {
        case CGFloat(colorGenerated.red):
            ifCaseIsTrue()
        default:
            ifCaseIsFalse()
            isDisabled()
        }
    }
    
    @IBAction func blue(_ sender: UIButton) {
        switch colorGenerated.highestRGBvalue() {
        case CGFloat(colorGenerated.blue):
            ifCaseIsTrue()
        default:
           ifCaseIsFalse()
            isDisabled()
        }
    }
    
    @IBAction func green(_ sender: UIButton) {
        switch colorGenerated.highestRGBvalue() {
        case CGFloat(colorGenerated.green):
           ifCaseIsTrue()
        default:
           ifCaseIsFalse()
            isDisabled()
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        isEnabled()
        colorGenerator()
         emojiLabel.alpha = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RGBColorView.backgroundColor = colorGenerated.creatRGBColor()
        
        // Do any additional setup after loading the view.
    }
}

