//
//  ViewController.swift
//  Bull's Eye
//
//  Created by Shridhar Sukhani on 01/02/18.
//  Copyright © 2018 Shridhar Sukhani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 50
    var targetValue = 0
    var roundNum = 0
    var totalScore = 0
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startNewRound()
        updateLabels()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = Int(sender.value)
    }
    
    @IBAction func hitPressed(_ sender: UIButton) {
        let pointsEarned = 100 - abs(currentValue - targetValue)
        totalScore += pointsEarned
        startNewRound()
        updateLabels()
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        totalScore = 0
        roundNum = 0
        startNewRound()
        updateLabels()
    }
    
    func startNewRound() {
        roundNum += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = "\(targetValue)"
        roundLabel.text = String(roundNum)
        scoreLabel.text = String(totalScore)
    }
    
    
}
