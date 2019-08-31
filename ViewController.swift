//
//  ViewController.swift
//  BullsEye
//
//  Created by Alessandro Lou on 8/27/19.
//  Copyright © 2019 Alessandro Lou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // instance variables
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    // connect slider in story board to this instance variable
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundeLabel: UILabel!
    
    // As soon as ViewController loads user interface
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
        
//        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    
    @IBAction func showAlert() {
        // local variable
        let differenceValue = abs(targetValue - currentValue)
        
        // instance variable
        score += 100 - differenceValue
        
        // local variable
        let message = "You scored \(differenceValue) points!"
        
        // local variable
        var titleValue: String
        
        if differenceValue == 0 {
            titleValue = "Perfect!"
            score += 100
        } else if (differenceValue < 5) {
            titleValue = "You almost had it!"
        } else if (differenceValue < 10) {
            titleValue = "Pretty good!"
        } else {
            titleValue = "Not even close!"
        }
        
        // local variable
        let alert = UIAlertController(title: titleValue, message: message, preferredStyle: .alert)
        
        // local variable
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
   func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    @IBAction func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundeLabel.text = String(round)
    }
    
    func updatescore() {
        
    }
    
//    func calculateSliderUserDifference() -> Int {
//        var differenceValue = abs(targetValue - currentValue)
//        return differenceValue
//    }
}

